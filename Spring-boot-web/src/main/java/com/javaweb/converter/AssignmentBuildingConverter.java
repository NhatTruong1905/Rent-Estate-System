package com.javaweb.converter;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AssignmentBuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public AssignmentBuildingDTO toConverterAssignmentBuildingDTO(AssignmentBuildingEntity building) {
        return modelMapper.map(building, AssignmentBuildingDTO.class);
    }
}
