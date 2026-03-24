package com.javaweb.repository;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;

import java.util.List;

public interface IBuildingRepository {
    List<BuildingEntity> findAll(BuildingSearchBuilder builder);
}
