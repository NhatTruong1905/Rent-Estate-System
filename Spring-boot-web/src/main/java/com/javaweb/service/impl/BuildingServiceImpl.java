package com.javaweb.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private BuildingSearchConverter buildingSearchConverter;

    @Autowired
    private BuildingConverter buildingConverter;


    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest params, Pageable pageable) {
        BuildingSearchBuilder builder = buildingSearchConverter.toBuildingSearchBuilderConverter(params);

        List<BuildingEntity> buildingList = buildingRepository.findAll(builder, pageable);

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
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public String findNameBuildingsById(List<Long> ids) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAllByIdIn(ids);

        return buildingEntities.stream().map(b -> b.getName()).collect(Collectors.joining(", "));
    }

    @Override
    public BuildingDTO findBuildingById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findBuildingById(id);
        List<RentAreaEntity> rentAreaEntities = rentAreaRepository.findByBuilding_Id(id);

        BuildingDTO buildingDTO = buildingConverter.toBuildingDTOConverter(buildingEntity);

        buildingDTO.setRentArea(rentAreaEntities.stream().map(r -> String.valueOf(r.getValue())).collect(Collectors.joining(", ")));
        buildingDTO.setTypeCode(Arrays.asList(buildingEntity.getTypeCode().split(",")));

        return buildingDTO;
    }

    @Override
    public void createOrUpdateBuilding(BuildingDTO buildingDTO) throws ServiceException {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntityConverter(buildingDTO);

        buildingRepository.save(buildingEntity);
    }

    @Override
    public int countTotalItems() {
        return buildingRepository.countTotalItem();
    }
}
