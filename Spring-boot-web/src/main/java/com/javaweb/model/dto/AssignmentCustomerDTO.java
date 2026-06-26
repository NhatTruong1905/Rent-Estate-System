package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import java.util.List;

@Setter
@Getter
public class AssignmentCustomerDTO {
    @NotNull(message = "Id của khách hàng không được null!")
    private Long customerId;
    private List<Long> staffIds;
}
