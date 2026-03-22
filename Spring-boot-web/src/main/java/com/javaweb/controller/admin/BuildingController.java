package com.javaweb.controller.admin;


import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
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
    public ModelAndView addBuilding() {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        return mav;
    }

    @GetMapping("/admin/building-edit-{id}")
    public ModelAndView addBuilding(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        return mav;
    }
}
