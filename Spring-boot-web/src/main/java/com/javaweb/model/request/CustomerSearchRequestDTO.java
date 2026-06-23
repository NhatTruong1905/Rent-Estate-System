package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerSearchRequestDTO extends AbstractDTO {
    private String fullname;
    private String phone;
    private String email;
    private String statusAssignment;
    private Long staffId;
}
