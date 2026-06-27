package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TransactionDTO extends AbstractDTO {
    private String code;
    private String note;
    private Long customerId;
}
