package com.javaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.repository.entity.BuildingEntity;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Integer>, BuildingRepositoryCustom {
//	public List<BuildingEntity> findAll(BuildingSearchBuilder builder);

//	public List<BuildingEntity> findByNameAndDistrict_Name(String name, Integer id);

//	public void deleteByIdIn(List<Integer> ids);
}