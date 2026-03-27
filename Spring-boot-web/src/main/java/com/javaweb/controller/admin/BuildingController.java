package com.javaweb.controller.admin;


import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.service.BuildingService;
import com.javaweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@RestController(value = "buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private UserService userService;

    @Autowired
    private BuildingService buildingService;

    @GetMapping("/admin/building-list")
    public ModelAndView getBuilding(@ModelAttribute(name = "modelSearch") BuildingSearchRequest params) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("staffs", userService.getListStaff());
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypes());
        mav.addObject("buildingList", buildingService.findAll(params));

        return mav;
    }

    @GetMapping("/admin/building-edit")
    public ModelAndView addBuilding(@ModelAttribute(name = "building") BuildingDTO building) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypes());
        return mav;
    }

    @GetMapping("/admin/building-edit-{id}")
    public ModelAndView editBuilding(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypes());
        // find building by id ==> BuildingEntity ==> BuildingDTO
        BuildingDTO b = new BuildingDTO();
        b.setId(id);
        b.setName("Dev Building 1");
        b.setWard("Đông Thạnh");
        b.setStreet("Đặng Thúc Vịnh");
        b.setRentPrice(25L);
        List<String> type = new ArrayList<>();
        type.add("TANG_TRET");
        type.add("NOI_THAT");
        b.setTypeCode(type);
        mav.addObject("building", b);
        return mav;
    }
}
