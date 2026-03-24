package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class BuildingSearchConverter {
    public BuildingSearchBuilder toBuildingSearchBuilderConverter(BuildingSearchRequest params) {
        BuildingSearchBuilder building = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(params.getName(), String.class))
                .setDistrict(MapUtils.getObject(params.getDistrict(), String.class))
                .setAreaFrom(MapUtils.getObject(params.getAreaFrom(), Long.class))
                .setAreaTo(MapUtils.getObject(params.getAreaTo(), Long.class))
                .setFloorArea(MapUtils.getObject(params.getFloorArea(), Long.class))
                .setManagerName(MapUtils.getObject(params.getManagerName(), String.class))
                .setManagerPhoneNumber(MapUtils.getObject(params.getManagerPhoneNumber(), String.class))
                .setNumberOfBasement(MapUtils.getObject(params.getNumberOfBasement(), Long.class))
                .setRentPriceFrom(MapUtils.getObject(params.getRentPriceFrom(), Long.class))
                .setRentPriceTo(MapUtils.getObject(params.getRentPriceTo(), Long.class))
                .setStaffId(MapUtils.getObject(params.getStaffId(), Long.class))
                .setStreet(MapUtils.getObject(params.getStreet(), String.class))
                .setWard(MapUtils.getObject(params.getWard(), String.class))
                .setDirection(MapUtils.getObject(params.getDirection(), String.class))
                .setLevel(MapUtils.getObject(params.getLevel(), Long.class))
                .setTypeCode(params.getTypeCode()).build();

        return building;
    }
}
