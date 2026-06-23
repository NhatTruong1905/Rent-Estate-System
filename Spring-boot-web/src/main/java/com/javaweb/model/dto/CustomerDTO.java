package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerDTO extends AbstractDTO {
    private String fullname;
    private String phone;
    private String email;
    private String demand;
    private String statusAssignment;
    private String companyName;
    private String note;
    private String staffId;
    private String staffName;
    private Integer status;
}
