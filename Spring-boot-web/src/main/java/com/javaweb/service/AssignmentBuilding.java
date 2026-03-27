package com.javaweb.service;

import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;

import java.util.List;

public interface AssignmentBuilding {
    List<AssignmentBuildingDTO> getAssignedBuildingByBuildingId(Long buildingId);
}
