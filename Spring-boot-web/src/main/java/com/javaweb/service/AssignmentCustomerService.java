package com.javaweb.service;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentCustomerDTO;

public interface AssignmentCustomerService {
    void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) throws ServiceException;
}
