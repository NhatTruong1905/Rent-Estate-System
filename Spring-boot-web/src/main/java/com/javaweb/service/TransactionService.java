package com.javaweb.service;


import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface TransactionService {
    List<TransactionDTO> findByCustomer_IdAndCode(Long id, String code);
}
