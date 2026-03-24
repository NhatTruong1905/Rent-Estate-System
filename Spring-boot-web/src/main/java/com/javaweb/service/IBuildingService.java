package com.javaweb.service;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest params);
}
