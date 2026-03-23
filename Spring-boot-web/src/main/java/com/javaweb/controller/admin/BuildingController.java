package com.javaweb.controller.admin;


import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController(value = "buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;

    @GetMapping("/admin/building-list")
    public ModelAndView getBuilding(@ModelAttribute(name = "modelSearch") BuildingSearchRequest params) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("staffs", userService.getListStaff());
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypes());

// Tìm kiếm
        List<BuildingSearchResponse> results = new ArrayList<>();
        BuildingSearchResponse b1 = new BuildingSearchResponse();
        b1.setId(2L);
        b1.setName("Nhat Truong Building");
        b1.setAddress("221/45E Đông Thạnh Hóc Môn");
        b1.setRentArea("100,800,180");
        BuildingSearchResponse b2 = new BuildingSearchResponse();
        b2.setId(3L);
        b2.setName("Minh Han Tower");
        b2.setAddress("195/8A Lê Quang Định, Gò Vấp");
        b2.setRentArea("195,203,533");

        results.add(b1);
        results.add(b2);
        mav.addObject("buildingList", results);
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
