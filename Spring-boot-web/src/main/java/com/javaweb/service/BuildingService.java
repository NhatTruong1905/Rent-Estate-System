package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest params);

    void deleteAllByIds(List<Long> ids);

    String findNameBuildingsById(List<Long> ids);

    BuildingDTO findBuildingById(Long id);
}
