package com.javaweb.service.impl;

import com.javaweb.entity.UserEntity;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class AssignmentBuilding implements com.javaweb.service.AssignmentBuilding {
    @Override
    public List<UserEntity> getAssignedBuildingByBuildingId(Long buildingId) {
        return Collections.emptyList();
    }
}
