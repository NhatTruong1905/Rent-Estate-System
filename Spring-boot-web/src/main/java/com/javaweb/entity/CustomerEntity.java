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
    @Column(name = "note")
    private String note;
    @Column(name = "status", nullable = false)
    private Integer status = 1;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
    private List<AssignmentCustomerEntity> assignmentCustomers = new ArrayList<>();
}
