package com.javaweb.service;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;

public interface AssignmentBuildingService {
    void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) throws ServiceException;
}
