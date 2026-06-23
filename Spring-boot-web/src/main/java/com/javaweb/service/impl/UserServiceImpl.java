package com.javaweb.service.impl;

import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.UserConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.exception.UsernameException;
import com.javaweb.model.dto.PasswordDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.entity.RoleEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.UserRegisterDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserConverter userConverter;

    @Autowired
    private BuildingRepository iBuildingRepository;

    @Autowired
    private CustomerRepository iCustomerRepository;

    @Override
    public UserDTO findOneByUserNameAndStatus(String name, int status) {
        return userConverter.convertToDto(userRepository.findOneByUserNameAndStatus(name, status));
    }

    @Override
    public List<UserDTO> getUsers(String searchValue, Pageable pageable) {
        Page<UserEntity> users = null;
        if (StringUtils.isNotBlank(searchValue)) {
            users = userRepository.findByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(searchValue, searchValue, 0, pageable);
        } else {
            users = userRepository.findByStatusNot(0, pageable);
        }
        List<UserEntity> newsEntities = users.getContent();
        List<UserDTO> result = new ArrayList<>();
        for (UserEntity userEntity : newsEntities) {
            UserDTO userDTO = userConverter.convertToDto(userEntity);
            userDTO.setRoleCode(userEntity.getRoles().get(0).getCode());
            result.add(userDTO);
        }
        return result;
    }


    @Override
    public List<UserDTO> getAllUsers(Pageable pageable) {
        List<UserEntity> userEntities = userRepository.getAllUsers(pageable);
        List<UserDTO> results = new ArrayList<>();
        for (UserEntity userEntity : userEntities) {
            UserDTO userDTO = userConverter.convertToDto(userEntity);
            userDTO.setRoleCode(userEntity.getRoles().get(0).getCode());
            results.add(userDTO);
        }
        return results;
    }

    @Override
    public int countTotalItems() {
        return userRepository.countTotalItem();
    }

    @Override
    public Map<Long, String> getListStaff() {
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        Map<Long, String> staffList = new HashMap<>();
        for (UserEntity s : staffs) {
            staffList.put(s.getId(), s.getUserName());
        }

        return staffList;
    }

    @Override
    public int getTotalItems(String searchValue) {
        int totalItem = 0;
        if (StringUtils.isNotBlank(searchValue)) {
            totalItem = (int) userRepository.countByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(searchValue, searchValue, 0);
        } else {
            totalItem = (int) userRepository.countByStatusNot(0);
        }
        return totalItem;
    }

    @Override
    public UserDTO findOneByUserName(String userName) {
        UserEntity userEntity = userRepository.findOneByUserName(userName);
        UserDTO userDTO = userConverter.convertToDto(userEntity);
        return userDTO;
    }

    @Override
    public UserDTO findUserById(long id) {
        UserEntity entity = userRepository.findById(id).get();
        List<RoleEntity> roles = entity.getRoles();
        UserDTO dto = userConverter.convertToDto(entity);
        roles.forEach(item -> {
            dto.setRoleCode(item.getCode());
        });
        return dto;
    }

    @Override
    @Transactional
    public UserRegisterDTO insert(UserRegisterDTO newUser) {
        RoleEntity role = roleRepository.findOneByCode(newUser.getRoleCode());
        UserEntity userEntity = userConverter.convertToEntity(newUser);
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setStatus(1);
        userEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
        return userConverter.convertToRegisterDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public UserRegisterDTO update(Long id, UserRegisterDTO updateUser) {
        UserEntity oldUser = userRepository.findById(id).get();
        RoleEntity role = roleRepository.findOneByCode(updateUser.getRoleCode());

        oldUser.setFullName(updateUser.getFullName());
        oldUser.setEmail(updateUser.getEmail());
        oldUser.setPhone(updateUser.getPhone());
        oldUser.setRoles(Stream.of(role).collect(Collectors.toList()));

        if (StringUtils.isNotBlank(updateUser.getPassword())) {
            oldUser.setPassword(passwordEncoder.encode(updateUser.getPassword()));
        }

        return userConverter.convertToRegisterDto(userRepository.save(oldUser));
    }

    @Override
    @Transactional
    public void updatePassword(long id, PasswordDTO passwordDTO) throws NumberFormatException {
        UserEntity user = userRepository.findById(id).get();
        if (passwordEncoder.matches(passwordDTO.getOldPassword(), user.getPassword())
                && passwordDTO.getNewPassword().equals(passwordDTO.getConfirmPassword())) {
            user.setPassword(passwordEncoder.encode(passwordDTO.getNewPassword()));
            userRepository.save(user);
        } else {
            throw new NumberFormatException(SystemConstant.CHANGE_PASSWORD_FAIL);
        }
    }

    @Override
    @Transactional
    public UserDTO resetPassword(long id) {
        UserEntity userEntity = userRepository.findById(id).get();
        userEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public UserDTO updateProfileOfUser(String username, UserDTO updateUser) {
        UserEntity oldUser = userRepository.findOneByUserName(username);
        oldUser.setFullName(updateUser.getFullName());
        return userConverter.convertToDto(userRepository.save(oldUser));
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (Long item : ids) {
            UserEntity userEntity = userRepository.findById(item).get();
            userEntity.setStatus(0);
            userRepository.save(userEntity);
        }
    }

    @Override
    public List<StaffResponseDTO> getStaffOfBuilding(Long buildingId) {
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        BuildingEntity buildingEntity = iBuildingRepository.findBuildingById(buildingId);
        List<UserEntity> assignedStaffs = userRepository.findByBuildings(buildingEntity);


        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        for (UserEntity s : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(s.getId());
            staffResponseDTO.setFullName(s.getFullName());
            if (assignedStaffs.contains(s)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }

            staffResponseDTOS.add(staffResponseDTO);
        }

        return staffResponseDTOS;
    }

    @Override
    public List<StaffResponseDTO> getStaffOfCustomer(Long customerId) {
        List<UserEntity> staffs = this.userRepository.findByStatusAndRoles_Code(1, "STAFF");
        CustomerEntity customerEntity = this.iCustomerRepository.findCustomerById(customerId);
        List<UserEntity> assignedStaffs = this.userRepository.findByAssignmentCustomers_Customer(customerEntity);


        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        for (UserEntity s : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(s.getId());
            staffResponseDTO.setFullName(s.getFullName());
            if (assignedStaffs.contains(s)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }

            staffResponseDTOS.add(staffResponseDTO);
        }

        return staffResponseDTOS;
    }

    @Override
    public String getNameStaffs(List<Long> ids) {
        List<UserEntity> staffEntities = userRepository.findByIdIn(ids);
        return staffEntities.stream().map(n -> n.getFullName()).collect(Collectors.joining(", "));
    }

    @Override
    public void registerNewUserAccount(UserRegisterDTO userDTO) throws UsernameException {
        if (userRepository.existsByUserName(userDTO.getUserName())) {
            throw new UsernameException("Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác!");
        }

        UserEntity userEntity = userConverter.convertToEntity(userDTO);
        userEntity.setPassword(passwordEncoder.encode(userDTO.getPassword()));

        RoleEntity defaultRole = roleRepository.findOneByCode("USER");
        if (defaultRole != null) {
            userEntity.setRoles(Collections.singletonList(defaultRole));
        }

        userRepository.save(userEntity);

    }
}
