package com.javaweb.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converters.BuildingConverter;
import com.javaweb.converters.BuildingSearchBuilderConverter;
import com.javaweb.dto.BuildingDTO;
import com.javaweb.dto.response.BuildingResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.DistrictRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.entity.BuildingEntity;
import com.javaweb.repository.entity.DistrictEntity;
import com.javaweb.repository.entity.RentAreaEntity;
import com.javaweb.service.BuildingService;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {

	@Autowired
	private BuildingRepository buildingRepository;

	@Autowired
	private BuildingConverter buildingConverter;

	@Autowired
	private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private DistrictRepository districtRepo;

	@Autowired
	private RentAreaRepository rentAreaRepo;

//	@PersistenceContext
//	private EntityManager entityManager;

	@Override
	public List<BuildingResponseDTO> findAll(Map<String, Object> params, List<String> typeCode) {
		BuildingSearchBuilder builder = buildingSearchBuilderConverter.toBuildingSearchBuilderConverter(params,
				typeCode);
		List<BuildingEntity> buildingEntities = buildingRepository.findAll(builder);

		List<BuildingResponseDTO> results = new ArrayList<>();
		for (BuildingEntity it : buildingEntities) {
			BuildingResponseDTO buildingResponseDTO = buildingConverter.toBuildingResponseDTO(it);
			results.add(buildingResponseDTO);
		}

		return results;
	}

	@Override
	public BuildingEntity createOrUpdateBuilding(BuildingDTO building) {
		BuildingEntity buildingEntity = modelMapper.map(building, BuildingEntity.class);
		buildingEntity.setDistrict(districtRepo.findById(building.getDistrictId()).get());
		buildingRepository.save(buildingEntity);

		if (buildingEntity.getId() != null) {
			rentAreaRepo.deleteByBuilding(buildingEntity);
		}

		List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
		RentAreaEntity r1 = new RentAreaEntity();
		r1.setBuilding(buildingEntity);
		r1.setValue(500);
		RentAreaEntity r2 = new RentAreaEntity();
		r2.setBuilding(buildingEntity);
		r2.setValue(600);
		rentAreaEntities.add(r1);
		rentAreaEntities.add(r2);
		rentAreaRepo.saveAll(rentAreaEntities);

		return buildingEntity;
	}

	@Override
	public void deleteById(List<Integer> ids) {
		rentAreaRepo.deleteByBuilding_IdIn(ids);
		buildingRepository.deleteAllById(ids);
	}

}
