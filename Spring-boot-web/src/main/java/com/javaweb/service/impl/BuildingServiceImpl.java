package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.IBuildingRepository;
import com.javaweb.repository.IRentAreaRepository;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingServiceImpl implements IBuildingService {

    @Autowired
    private IBuildingRepository buildingRepository;

    @Autowired
    private IRentAreaRepository rentAreaRepository;

    @Autowired
    private BuildingSearchConverter buildingSearchConverter;

    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest params) {
        BuildingSearchBuilder builder = buildingSearchConverter.toBuildingSearchBuilderConverter(params);

        List<BuildingEntity> buildingList = buildingRepository.findAll(builder);

        List<BuildingSearchResponse> results = new ArrayList<>();
        for (BuildingEntity b : buildingList) {
            BuildingSearchResponse bOfResponse = buildingConverter.toBuildingSearchResponseConverter(b);

            bOfResponse.setAddress(String.format("%s, %s, %s", b.getStreet(), b.getWard(), District.getDistrictNameByKey(b.getDistrict())));

            String s = rentAreaRepository.findByBuilding_Id(b.getId()).stream().map(r -> String.valueOf(r.getValue())).collect(Collectors.joining(", "));
            bOfResponse.setRentArea(s);

            results.add(bOfResponse);
        }

        return results;
    }

    @Override
    public void deleteAllByIds(List<Long> ids) {
        rentAreaRepository.deleteByBuilding_IdIn(ids);
        buildingRepository.deleteAllById(ids);
    }

    @Override
    public String findNameBuildingsById(List<Long> ids) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAllByIdIn(ids);

        return buildingEntities.stream().map(b -> b.getName()).collect(Collectors.joining(", "));
    }
}
