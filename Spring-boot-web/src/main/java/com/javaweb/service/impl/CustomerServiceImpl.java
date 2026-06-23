package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.AssignmentCustomerEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerRequestDTO;
import com.javaweb.model.request.CustomerSearchRequestDTO;
import com.javaweb.repository.AssignmentCustomerRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Autowired
    private AssignmentCustomerRepository assignmentCustomerRepository;

    @Override
    public void createOrUpdateCustomer(CustomerRequestDTO customerDTO) {
        CustomerEntity customerEntity = this.customerConverter.toEntity(customerDTO);
        this.customerRepository.save(customerEntity);
    }

    @Override
    public List<CustomerDTO> findAll(CustomerSearchRequestDTO customerSearchRequestDTO, Pageable pageable) {
        List<CustomerEntity> customerEntities = this.customerRepository.findAll(customerSearchRequestDTO, pageable);

        List<CustomerDTO> customerDTOS = new ArrayList<>();
        for (CustomerEntity customerEntity : customerEntities) {
            CustomerDTO c = this.customerConverter.toDTO(customerEntity);
            AssignmentCustomerEntity assignmentCustomerEntity = this.assignmentCustomerRepository.findByCustomer(customerEntity);
            if (assignmentCustomerEntity != null) {
                c.setStatusAssignment(assignmentCustomerEntity.getStatus());
            } else {
                c.setStatus(null);
            }

            customerDTOS.add(c);
        }

        return customerDTOS;
    }

    @Override
    public int countTotalItem(CustomerSearchRequestDTO request) {
        return this.customerRepository.countTotalItem(request);
    }

    @Override
    public CustomerDTO findCustomerById(Long id) {
        return this.customerConverter.toDTO(this.customerRepository.findCustomerById(id));
    }

    @Override
    public boolean isStaffOfCustomer(Long staffId, Long id) {
        return this.customerRepository.existsByIdAndAssignmentCustomers_Staff_Id(id, staffId);
    }

    @Override
    public void deleteAllByIds(List<Long> ids) {
        for (Long id : ids) {
            CustomerEntity customerEntity = this.customerRepository.findCustomerById(id);
            customerEntity.setStatus(0);
            this.customerRepository.save(customerEntity);
        }
    }

}
