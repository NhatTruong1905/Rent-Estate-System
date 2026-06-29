package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Setter
@Getter
public class TransactionDTO extends AbstractDTO {
    private String code;
    @NotBlank(message = "Note không được để trống!")
    private String note;
    private Long customerId;
}
