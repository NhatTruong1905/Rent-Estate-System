package com.javaweb.api.admin;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.AssignmentCustomerService;
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
@RequestMapping("/api/assignments")
public class AssignmentAPI {

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @Autowired
    private AssignmentCustomerService assignmentCustomerService;

    @Autowired
    private UserService userService;

    @PostMapping("/building")
    public ResponseEntity<?> updateAssignmentBuilding(@Valid @RequestBody AssignmentBuildingDTO assignmentBuilding, BindingResult bindingResult) throws ServiceException {

        if (bindingResult.hasErrors()) {
            List<String> errors = bindingResult.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .collect(Collectors.toList());
            return ResponseEntity.badRequest().body(errors);
        }
        String nameOfStaffs = this.userService.getNameStaffs(assignmentBuilding.getStaffIds());
        this.assignmentBuildingService.updateAssignmentBuilding(assignmentBuilding);

        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage(nameOfStaffs);
        return ResponseEntity.ok().body(responseDTO);
    }

    @PostMapping("/customer")
    public ResponseEntity<?> updateAssignmentCustomer(@Valid @RequestBody AssignmentCustomerDTO assignmentCustomer, BindingResult bindingResult) throws ServiceException {

        if (bindingResult.hasErrors()) {
            List<String> errors = bindingResult.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .collect(Collectors.toList());
            return ResponseEntity.badRequest().body(errors);
        }
        String nameOfStaffs = this.userService.getNameStaffs(assignmentCustomer.getStaffIds());
        this.assignmentCustomerService.updateAssignmentCustomer(assignmentCustomer);

        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage(nameOfStaffs);
        return ResponseEntity.ok().body(responseDTO);
    }
}
