package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.exception.NumberFormatException;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse toBuildingSearchResponseConverter(BuildingEntity entity) {
        return modelMapper.map(entity, BuildingSearchResponse.class);
    }

    public BuildingDTO toBuildingDTOConverter(BuildingEntity buildingEntity) {
        return modelMapper.map(buildingEntity, BuildingDTO.class);
    }

    private void validateNumber(String value) throws NumberFormatException {
        if (value == null || value.isEmpty()) {
            throw new NumberFormatException("Giá trị không được để trống.");
        }

        for (char c : value.toCharArray()) {
            if (!Character.isDigit(c)) {
                throw new NumberFormatException("Giá trị '" + value + "' chứa ký tự '" + c + "' không phải là số.");
            }
        }
    }

    public BuildingEntity toBuildingEntityConverter(BuildingDTO buildingDTO) throws NumberFormatException {
        BuildingEntity building = modelMapper.map(buildingDTO, BuildingEntity.class);

        String rentAreaRaw = buildingDTO.getRentArea();
        if (rentAreaRaw == null || rentAreaRaw.isEmpty()) {
            building.setRentAreas(new ArrayList<>());
            return building;
        }

        List<String> rentAreaStrings = Arrays.asList(rentAreaRaw.split(","));
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

        for (String s : rentAreaStrings) {
            String trimedString = s.trim();
            validateNumber(trimedString);

            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(Integer.parseInt(trimedString));
            rentAreaEntity.setBuilding(building);
            rentAreaEntities.add(rentAreaEntity);
        }
        building.setRentAreas(rentAreaEntities);

        return building;
    }
}
