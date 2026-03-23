package com.javaweb.api.admin;

import com.javaweb.model.dto.BuildingDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
public class BuildingAPI {
    @PostMapping("/api/buildings")
    public ResponseEntity<?> createOrUpdateBuilding(@Valid @RequestBody BuildingDTO buildingDTO, BindingResult bindingResult) {
        try {
            if (bindingResult.hasErrors()) {
                List<String> errors = bindingResult.getFieldErrors()
                        .stream()
                        .map(FieldError::getDefaultMessage)
                        .collect(Collectors.toList());
                return ResponseEntity.badRequest().body(errors);
            }


        } catch (Exception ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }

        return null;
    }
}
