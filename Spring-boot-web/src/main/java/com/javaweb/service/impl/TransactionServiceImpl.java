package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private TransactionConverter transactionConverter;

    @Override
    public List<TransactionDTO> findByCustomer_IdAndCode(Long id, String code) {
        List<TransactionEntity> transactionEntities = this.transactionRepository.findByCustomer_IdAndCode(id, code);

        List<TransactionDTO> transactionDTOS = new ArrayList<>();
        for (TransactionEntity trans : transactionEntities) {
            TransactionDTO transDTO = this.transactionConverter.toDTO(trans);
            transDTO.setCustomerId(trans.getCustomer().getId());

            transactionDTOS.add(transDTO);
        }

        return transactionDTOS;
    }
}
