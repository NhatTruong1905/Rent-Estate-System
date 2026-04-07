package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "building")
@Setter
@Getter
public class BuildingEntity extends BaseEntity {
    private String name;
    @Column(name = "numberofbasement")
    private Integer numberOfBasement;
    private String street;
    private String ward;
    @Column(name = "rentprice", nullable = false)
    private int rentPrice;
    @Column(name = "rentpricedescription")
    private String rentPriceDescription;
    @Column(name = "managername")
    private String managerName;
    @Column(name = "managerphonenumber")
    private String managerPhoneNumber;
    @Column(name = "renttype")
    private String typeCode;
    private String structure;
    @Column(name = "floorarea")
    private int floorArea;
    private String direction;
    private String level;
    @Column(name = "servicefee")
    private String serviceFee;
    @Column(name = "carfee")
    private String carFee;
    @Column(name = "motorbikefee")
    private String motorbikeFee;
    @Column(name = "overtimefee")
    private String overtimeFee;
    @Column(name = "waterfee")
    private String waterFee;
    @Column(name = "electricityfee")
    private String electricityFee;
    @Column(name = "deposit")
    private String deposit;
    @Column(name = "payment")
    private String payment;
    @Column(name = "renttime")
    private String rentTime;
    @Column(name = "decorationtime")
    private String decorationtime;
    @Column(name = "brokeragefee")
    private BigDecimal brokerageFee;
    @Column(name = "note")
    private String note;
    @Column(name = "linkofbuilding")
    private String linkOfBuilding;
    @Column(name = "map")
    private String map;
    @Column(name = "image")
    private String image;
    @Column(name = "district")
    private String district;


    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE}, orphanRemoval = true)
    private List<RentAreaEntity> rentAreas = new ArrayList<>();

    @ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "assignmentbuilding", joinColumns = @JoinColumn(name = "buildingid"), inverseJoinColumns = @JoinColumn(name = "staffid"))
    private List<UserEntity> users = new ArrayList<>();
}
