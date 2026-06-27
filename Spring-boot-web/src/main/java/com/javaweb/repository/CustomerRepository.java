package com.javaweb.repository;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Long>, CustomerRepositoryCustom {
    CustomerEntity findCustomerById(Long id);

    boolean existsByIdAndStaffs_Id(Long id, Long staffId);

    CustomerEntity findByIdAndIsActive(Long id, Integer isActive);
}
