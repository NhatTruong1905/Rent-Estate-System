package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerRequestDTO;
import com.javaweb.model.request.CustomerSearchRequestDTO;
import org.springframework.data.domain.Pageable;


import java.util.List;

public interface CustomerService {
    void createOrUpdateCustomer(CustomerRequestDTO customerDTO);

    List<CustomerDTO> findAll(CustomerSearchRequestDTO customerSearchRequestDTO, Pageable pageable);

    int countTotalItem(CustomerSearchRequestDTO request);

    CustomerDTO findCustomerById(Long id);

    boolean isStaffOfCustomer(Long staffId, Long id);

    void deleteAllByIds(List<Long> ids);

    CustomerDTO findByIdAndIsActive(Long id, Integer isActive);
}
