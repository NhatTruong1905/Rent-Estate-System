package com.javaweb.api.admin;

import com.javaweb.model.request.CustomerRequestDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/customers")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;

    @Autowired
    private UserService userService;

    @PostMapping
    public ResponseEntity<?> createOrUpdateCustomer(@Valid @RequestBody CustomerRequestDTO customerDTO, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            List<String> errors = bindingResult.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .collect(Collectors.toList());
            return ResponseEntity.badRequest().body(errors);
        }

        this.customerService.createOrUpdateCustomer(customerDTO);

        return ResponseEntity.ok().body(customerDTO);
    }

    @DeleteMapping("/{ids}")
    public ResponseEntity<?> deleteCustomer(@PathVariable List<Long> ids) {
        ResponseDTO responseDTO = new ResponseDTO();
        if (ids == null || ids.isEmpty()) {
            responseDTO.setMessage("Ids can't be empty!");
            return ResponseEntity.badRequest().body(responseDTO);
        } else {
            this.customerService.deleteAllByIds(ids);

            return ResponseEntity.ok().body(responseDTO);
        }
    }

    @GetMapping("/{customerId}/staffs")
    public ResponseEntity<?> loadStaff(@PathVariable Long customerId) {
        List<StaffResponseDTO> staffResponseDTOS = this.userService.getStaffOfCustomer(customerId);

        ResponseDTO response = new ResponseDTO();
        response.setMessage("Staffs loaded successfully!");
        response.setData(staffResponseDTOS);
        return ResponseEntity.ok().body(response);
    }
}
