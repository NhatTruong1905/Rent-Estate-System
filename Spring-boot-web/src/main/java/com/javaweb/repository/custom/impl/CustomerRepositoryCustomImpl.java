package com.javaweb.repository.custom.impl;

import com.javaweb.entity.AssignmentCustomerEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequestDTO;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
@Transactional
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    private List<Predicate> buildPredicates(CustomerSearchRequestDTO request, Root<CustomerEntity> root, CriteriaBuilder builder) {
        List<Predicate> predicates = new ArrayList<>();

        if (request.getFullname() != null && !request.getFullname().trim().isEmpty()) {
            predicates.add(builder.like(root.get("fullname"), "%" + request.getFullname().trim() + "%"));
        }
        if (request.getEmail() != null && !request.getEmail().trim().isEmpty()) {
            predicates.add(builder.like(root.get("email"), "%" + request.getEmail().trim() + "%"));
        }
        if (request.getPhone() != null && !request.getPhone().trim().isEmpty()) {
            predicates.add(builder.like(root.get("phone"), "%" + request.getPhone().trim() + "%"));
        }

        boolean hasStatusFilter = request.getStatusAssignment() != null && !request.getStatusAssignment().trim().isEmpty();
        boolean hasStaffFilter = request.getStaffId() != null;

        if (hasStatusFilter || hasStaffFilter) {
            Join<CustomerEntity, AssignmentCustomerEntity> assignmentJoin = root.join("assignmentCustomers");

            if (hasStatusFilter) {
                predicates.add(builder.equal(assignmentJoin.get("status"), request.getStatusAssignment()));
            }
            if (hasStaffFilter) {
                predicates.add(builder.equal(assignmentJoin.get("staff").get("id"), request.getStaffId()));
            }
        }

        return predicates;
    }

    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequestDTO request, Pageable pageable) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<CustomerEntity> query = builder.createQuery(CustomerEntity.class);
        Root<CustomerEntity> root = query.from(CustomerEntity.class);

        List<Predicate> predicates = buildPredicates(request, root, builder);
        query.where(predicates.toArray(new Predicate[0]));
        query.distinct(true);

        query.orderBy(builder.desc(root.get("id")));

        TypedQuery<CustomerEntity> typedQuery = entityManager.createQuery(query);
        typedQuery.setFirstResult((int) pageable.getOffset());
        typedQuery.setMaxResults(pageable.getPageSize());

        return typedQuery.getResultList();
    }

    @Override
    public int countTotalItem(CustomerSearchRequestDTO request) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Long> query = builder.createQuery(Long.class);
        Root<CustomerEntity> root = query.from(CustomerEntity.class);

        List<Predicate> predicates = buildPredicates(request, root, builder);
        query.where(predicates.toArray(new Predicate[0]));

        query.select(builder.countDistinct(root));
        return entityManager.createQuery(query).getSingleResult().intValue();
    }

}
