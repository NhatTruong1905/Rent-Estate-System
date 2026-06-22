package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerRequestDTO;

public interface CustomerService {
    void createCustomer(CustomerRequestDTO customerDTO);
}
