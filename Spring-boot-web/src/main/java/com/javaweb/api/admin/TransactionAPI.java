package com.javaweb.api.admin;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;


@RestController
@RequestMapping("/api")
public class TransactionAPI {
    @Autowired
    private TransactionService transactionService;

    @GetMapping("/{customerId}/transactions")
    public ResponseEntity<?> loadTransaction(@PathVariable Long customerId, @RequestParam String code) {
        ResponseDTO response = new ResponseDTO();
        response.setMessage("Đã lấy giao dịch của customer id: " + customerId);
        response.setData(this.transactionService.loadTransaction(code, customerId));
        return ResponseEntity.ok().body(response);
    }

    @PostMapping("/customers/transaction")
    public ResponseEntity<?> createOrUpdateTransaction(@Valid @RequestBody TransactionDTO transactionDTO, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            List<String> errors = bindingResult.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .collect(Collectors.toList());
            return ResponseEntity.badRequest().body(errors);
        }

        this.transactionService.createOrUpdateTransaction(transactionDTO);
        ResponseDTO response = new ResponseDTO();
        if (transactionDTO.getId() != null) {
            response.setMessage("Cập nhập giao dịch thành công");
        } else {
            response.setMessage("Tạo giao dịch thành công");
        }
        return ResponseEntity.ok().body(response);
    }
}
