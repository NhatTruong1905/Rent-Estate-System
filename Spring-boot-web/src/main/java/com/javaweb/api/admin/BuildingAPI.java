package com.javaweb.api.admin;

import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    private final UserRepository userRepository;

    public BuildingAPI(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @PostMapping()
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

    @DeleteMapping("/{ids}")
    public ResponseEntity<?> deleteBuilding(@PathVariable List<Long> ids) {
        ResponseDTO responseDTO = new ResponseDTO();
        if (ids == null || ids.isEmpty()) {
            responseDTO.setMessage("Ids can't be empty!");
            return ResponseEntity.badRequest().body(responseDTO);
        } else {
            buildingService.deleteAllByIds(ids);
            String nameOfBuildings = buildingService.findNameBuildingsById(ids);

            responseDTO.setMessage(nameOfBuildings + " đã xóa thành công!");
            return ResponseEntity.ok().body(responseDTO);
        }
    }

    @GetMapping("/{buildingId}/staffs")
    public ResponseEntity<?> loadStaff(@PathVariable Long buildingId) {
        // service lam
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");

        return null;
    }
}
