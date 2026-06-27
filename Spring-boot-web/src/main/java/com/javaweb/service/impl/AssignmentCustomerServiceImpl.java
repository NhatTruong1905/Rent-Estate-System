package com.javaweb.service.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.exception.CustomerException;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.repository.AssignmentCustomerRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AssignmentCustomerServiceImpl implements AssignmentCustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) throws ServiceException {
        CustomerEntity customer = this.customerRepository.findCustomerById(assignmentCustomerDTO.getCustomerId());

        if (customer == null) {
            throw new CustomerException("Customer không tìm thấy");
        }

        customer.getStaffs().clear();

        List<Long> staffIds = assignmentCustomerDTO.getStaffIds();
        if (staffIds != null && !staffIds.isEmpty()) {
            List<UserEntity> staffEntities = this.userRepository.findByIdIn(staffIds);
            if (staffEntities.size() != staffIds.size()) {
                throw new ServiceException("Một hoặc nhiều nhân viên không tồn tại trong hệ thống!");
            }

            customer.getStaffs().addAll(staffEntities);
        }
    }
}
