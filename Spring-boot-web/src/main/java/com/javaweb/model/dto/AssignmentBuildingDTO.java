package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import java.util.List;

@Setter
@Getter
public class AssignmentBuildingDTO {
    @NotNull(message = "Id của tòa nhà không được null!")
    private Long buildingId;
    private List<Long> staffIds;

}
