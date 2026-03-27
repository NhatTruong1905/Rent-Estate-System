package com.javaweb.service.impl;

import com.javaweb.converter.AssignmentBuildingConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class AssignmentBuilding implements com.javaweb.service.AssignmentBuilding {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private AssignmentBuildingConverter assignmentBuildingConverter;

    @Override
    public List<AssignmentBuildingDTO> getAssignedBuildingByBuildingId(Long buildingId) {
        List<AssignmentBuildingEntity> assignmentBuildingEntities = assignmentBuildingRepository.findAllByBuildingId(buildingId);

        List<AssignmentBuildingDTO> results = new ArrayList<>();
        for (AssignmentBuildingEntity assignment : assignmentBuildingEntities) {
            AssignmentBuildingDTO ass = assignmentBuildingConverter.toConverterAssignmentBuildingDTO(assignment);
            results.add(ass);
        }

        return results;
    }
}
