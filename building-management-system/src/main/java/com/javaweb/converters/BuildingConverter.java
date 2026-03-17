package com.javaweb.converters;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.javaweb.dto.response.BuildingResponseDTO;
import com.javaweb.repository.entity.BuildingEntity;
import com.javaweb.repository.entity.RentAreaEntity;

@Component
public class BuildingConverter {

	@Autowired
	private ModelMapper modelMapper;

	public BuildingResponseDTO toBuildingResponseDTO(BuildingEntity it) {
		BuildingResponseDTO buildingResponseDTO = modelMapper.map(it, BuildingResponseDTO.class);
		buildingResponseDTO
				.setAddress(String.format("%s, %s, %s", it.getStreet(), it.getWard(), it.getDistrict().getName()));
		List<RentAreaEntity> rentAreaEntyties = it.getRentAreas();
		String rentArea = rentAreaEntyties.stream().map(i -> String.valueOf(i.getValue()))
				.collect(Collectors.joining(","));
		buildingResponseDTO.setRentArea(rentArea);

		return buildingResponseDTO;
	}
}
