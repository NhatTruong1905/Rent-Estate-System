package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "assignmentbuilding")
@Getter
@Setter
public class AssignmentBuildingEntity extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    private BuildingEntity building;

    @ManyToOne(fetch = FetchType.LAZY)
    private UserEntity staff;
}
