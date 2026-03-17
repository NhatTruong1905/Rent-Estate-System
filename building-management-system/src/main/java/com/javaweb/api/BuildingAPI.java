package com.javaweb.api;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.javaweb.customexceptions.InvalidDataException;
import com.javaweb.dto.BuildingDTO;
import com.javaweb.dto.response.BuildingResponseDTO;
import com.javaweb.service.BuildingService;

@RestController
public class BuildingAPI {

	@Autowired
	private BuildingService buildingService;

	@GetMapping("/api/buildings")
	private Object getBuilding(@RequestParam Map<String, Object> params,
			@RequestParam(name = "typeCode", required = false) List<String> typeCode) {
		List<BuildingResponseDTO> buildings = buildingService.findAll(params, typeCode);
		return buildings;
	}

	private void validate(BuildingDTO building) throws InvalidDataException {
		if (building.getName() == null || building.getName().trim().equals("") || building.getNumberOfBasement() == null) {
			throw new InvalidDataException("Tên tòa nhà không được để ký tự trắng hoặc rỗng");
		}
	}

	@PostMapping("/api/buildings")
	private Object createBuilding(@RequestBody BuildingDTO buildings) throws InvalidDataException {
		validate(buildings);

		return buildingService.createOrUpdateBuilding(buildings);
	}

	@DeleteMapping("/api/buildings/{ids}")
	private void deleteBuilding(@PathVariable List<Integer> ids) {
		if (ids.size() != 0) {
			buildingService.deleteById(ids);
		}else {
			///
		}
	}
}
