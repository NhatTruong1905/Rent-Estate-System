package com.javaweb.service;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest params, Pageable pageable);

    void deleteAllByIds(List<Long> ids);

    String findNameBuildingsById(List<Long> ids);

    BuildingDTO findBuildingById(Long id);

    void createOrUpdateBuilding(BuildingDTO buildingDTO) throws ServiceException;

    int countTotalItems();
}
