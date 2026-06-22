package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "assignmentcustomer")
@Getter
@Setter
public class AssignmentCustomerEntity extends BaseEntity {
    private String status;
    @ManyToOne(fetch = FetchType.LAZY)
    private UserEntity staff;
    @ManyToOne(fetch = FetchType.LAZY)
    private CustomerEntity customer;
}
