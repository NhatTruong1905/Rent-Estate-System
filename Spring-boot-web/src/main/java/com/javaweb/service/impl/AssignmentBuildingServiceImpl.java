package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();

        BuildingEntity building = buildingRepository.findBuildingById(assignmentBuildingDTO.getBuildingId());
        assignmentBuildingEntity.setBuilding(building);
        assignmentBuildingRepository.save(assignmentBuildingEntity);

        List<Long> idStaffEntities = assignmentBuildingDTO.getStaffIds();
        List<UserEntity> staffEntities = userRepository.findByIdIn(idStaffEntities);
        for (UserEntity s : staffEntities) {
            assignmentBuildingEntity.setStaff(s);
            assignmentBuildingRepository.save(assignmentBuildingEntity);
        }
    }
}
