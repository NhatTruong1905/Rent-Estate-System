package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.IBuildingRepository;
import com.javaweb.utils.DataUtil;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements IBuildingRepository {
    @PersistenceContext
    private EntityManager entityManager;

    private void sqlJoin(BuildingSearchBuilder builder, StringBuilder join) {
        Long staffId = builder.getStaffId();
        if (DataUtil.checkData(staffId)) {
            join.append(" JOIN assignmentbuilding ab ON ab.buildingid = b.id");
        }

        Long rentAreaFrom = builder.getAreaFrom();
        Long rentAreaTo = builder.getAreaTo();
        if (DataUtil.checkData(rentAreaFrom) || DataUtil.checkData(rentAreaTo)) {
            join.append(" JOIN rentarea rt ON rt.buildingid = b.id");
        }
    }

    private void sqlWhereNormal(BuildingSearchBuilder builder, StringBuilder where) {
        try {
            Field[] fields = com.javaweb.builder.BuildingSearchBuilder.class.getDeclaredFields();

            for (Field it : fields) {
                it.setAccessible(true);
                String fieldName = it.getName();
                if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area")
                        && !fieldName.startsWith("rentPrice")) {
                    Object value = it.get(builder);
                    if (value != null && !value.toString().equals("")) {
                        if (it.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + fieldName.toLowerCase() + " LIKE '%" + value.toString().trim() + "%'");
                        } else if (it.getType().getName().equals("java.lang.Long")
                                || it.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND b." + fieldName.toLowerCase() + " = " + value);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void sqlWhereSpecial(BuildingSearchBuilder builder, StringBuilder where) {
        Long staffId = builder.getStaffId();
        if (DataUtil.checkData(staffId)) {
            where.append(" AND ab.staffid = " + staffId);
        }

        Long rentAreaFrom = builder.getAreaFrom();
        Long rentAreaTo = builder.getAreaTo();
        if (DataUtil.checkData(rentAreaFrom)) {
            where.append(" AND rt.value >= " + rentAreaFrom);
        }
        if (DataUtil.checkData(rentAreaTo)) {
            where.append(" AND rt.value <= " + rentAreaTo);
        }

        Long rentPriceFrom = builder.getRentPriceFrom();
        Long rentPriceTo = builder.getRentPriceTo();
        if (DataUtil.checkData(rentPriceFrom)) {
            where.append(" AND b.rentprice >= " + rentPriceFrom);
        }
        if (DataUtil.checkData(rentPriceTo)) {
            where.append(" AND b.rentprice <= " + rentPriceTo);
        }

        List<String> typeCodes = builder.getTypeCode();
        if (typeCodes != null && !typeCodes.isEmpty()) {
            where.append(" AND (");
            String sqlTypes = typeCodes.stream()
                    .map(it -> "b.renttype LIKE '%" + it + "%'")
                    .collect(Collectors.joining(" OR "));
            where.append(sqlTypes).append(")");
        }
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder builder) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        sqlJoin(builder, sql);

        StringBuilder where = new StringBuilder(" WHERE 1=1");
        sqlWhereNormal(builder, where);
        sqlWhereSpecial(builder, where);
        sql.append(where).append(" GROUP BY b.id ");

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        return query.getResultList();
    }
}
