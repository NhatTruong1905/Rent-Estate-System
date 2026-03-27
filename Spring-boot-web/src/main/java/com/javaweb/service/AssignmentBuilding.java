package com.javaweb.service;

import com.javaweb.entity.UserEntity;

import java.util.List;

public interface AssignmentBuilding {
    List<UserEntity> getAssignedBuildingByBuildingId(Long buildingId);
}
