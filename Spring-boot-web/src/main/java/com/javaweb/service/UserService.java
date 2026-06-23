package com.javaweb.service;

import com.javaweb.model.dto.PasswordDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.UserRegisterDTO;
import com.javaweb.model.response.StaffResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface UserService {
    UserDTO findOneByUserNameAndStatus(String name, int status);

    List<UserDTO> getUsers(String searchValue, Pageable pageable);

    int getTotalItems(String searchValue);

    UserDTO findOneByUserName(String userName);

    UserDTO findUserById(long id);

    UserRegisterDTO insert(UserRegisterDTO userDTO);

    UserRegisterDTO update(Long id, UserRegisterDTO userDTO);

    void updatePassword(long id, PasswordDTO userDTO) throws NumberFormatException;

    UserDTO resetPassword(long id);

    UserDTO updateProfileOfUser(String id, UserDTO userDTO);

    void delete(long[] ids);

    //    ResponseDTO listStaff(Long buildingId);
    List<UserDTO> getAllUsers(Pageable pageable);

    int countTotalItems();

    Map<Long, String> getListStaff();

    List<StaffResponseDTO> getStaffOfBuilding(Long buildingId);

    List<StaffResponseDTO> getStaffOfCustomer(Long customerId);

    String getNameStaffs(List<Long> ids);

    void registerNewUserAccount(UserRegisterDTO userDTO);


}
