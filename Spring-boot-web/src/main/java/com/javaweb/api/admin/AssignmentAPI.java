package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/assignments")
public class AssignmentAPI {

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @Autowired
    private UserService userService;

    @PostMapping()
    public ResponseEntity<?> updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuilding, BindingResult bindingResult) {

        try {
            if (bindingResult.hasErrors()) {
                List<String> errors = bindingResult.getFieldErrors()
                        .stream()
                        .map(FieldError::getDefaultMessage)
                        .collect(Collectors.toList());
                return ResponseEntity.badRequest().body(errors);
            }
            assignmentBuildingService.updateAssignmentBuilding(assignmentBuilding);
// Tìm tên nhân viên.... sổ ra
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return null;
    }
}
