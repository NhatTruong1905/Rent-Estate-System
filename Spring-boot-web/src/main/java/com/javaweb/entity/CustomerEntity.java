package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "customer")
public class CustomerEntity extends BaseEntity {
    @Column(name = "fullname", nullable = false)
    private String fullname;
    @Column(name = "email")
    private String email;
    @Column(name = "phone", nullable = false)
    private String phone;
    @Column(name = "demand")
    private String demand;
    @Column(name = "status")
    private String status;
    @Column(name = "is_active", nullable = false)
    private Integer isActive = 1;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
    private List<AssignmentCustomerEntity> assignmentCustomers = new ArrayList<>();
}
