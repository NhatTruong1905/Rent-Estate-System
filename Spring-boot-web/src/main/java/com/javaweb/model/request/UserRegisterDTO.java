package com.javaweb.model.request;

import com.javaweb.model.dto.RoleDTO;
import com.javaweb.validation.OnRegister;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class UserRegisterDTO {
    @NotBlank(message = "Username không được để trống")
    @Size(min = 3, message = "Username phải chứa tối thiểu 3 ký tự")
    private String userName;
    @NotBlank(message = "Fullname không được để trống")
    private String fullName;
    @NotBlank(message = "Password không được để trống", groups = OnRegister.class)
    @Size(min = 6, message = "Password phải chứa tối thiểu 6 ký tự", groups = OnRegister.class)
    private String password;
    @Pattern(regexp = "^$|^[0-9]{10}$", message = "Số điện thoại không hợp lệ cần 10 số")
    private String phone;
    @Email(message = "Email không đúng định dạng")
    private String email;
    private Integer status = 1;
    private List<RoleDTO> roles = new ArrayList<>();
    private String roleName;
    private String roleCode;
    private Map<String, String> roleDTOs = new HashMap<>();
}
