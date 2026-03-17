package com.javaweb.service;

import java.util.List;
import java.util.Map;

import com.javaweb.dto.BuildingDTO;
import com.javaweb.dto.response.BuildingResponseDTO;
import com.javaweb.repository.entity.BuildingEntity;

public interface BuildingService {
	public List<BuildingResponseDTO> findAll(Map<String, Object> params, List<String> typeCode);

	public BuildingEntity createOrUpdateBuilding(BuildingDTO building);

	public void deleteById(List<Integer> ids);
}
