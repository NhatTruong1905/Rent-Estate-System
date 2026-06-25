package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerRequestDTO;
import com.javaweb.repository.CustomerRepository;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

//    private void applyCommonConfiguration() {
//        this.modelMapper.getConfiguration().setMatchingStrategy(MatchingStrategies.STRICT);
//        this.modelMapper.typeMap(CustomerRequestDTO.class, CustomerEntity.class)
//                .addMappings(mapper -> mapper.skip(CustomerEntity::setStatus));
//    }

    public CustomerEntity toEntity(CustomerRequestDTO customerDTO) {
        return modelMapper.map(customerDTO, CustomerEntity.class);
    }

    public void toCustomerEntityUpdate(CustomerRequestDTO customerDTO, CustomerEntity existingEntity) {
        this.modelMapper.map(customerDTO, existingEntity);
    }

    public CustomerDTO toDTO(CustomerEntity customerEntity) {
        return modelMapper.map(customerEntity, CustomerDTO.class);
    }


}
