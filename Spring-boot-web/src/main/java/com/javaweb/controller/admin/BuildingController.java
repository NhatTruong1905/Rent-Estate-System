package com.javaweb.controller.admin;


import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.UserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.awt.print.Pageable;
import java.util.ArrayList;
import java.util.List;

@RestController(value = "buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private UserService userService;

    @Autowired
    private BuildingService buildingService;

    @GetMapping("/admin/building-list")
    public ModelAndView getBuilding(@ModelAttribute(name = "modelSearch") BuildingSearchRequest params, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        DisplayTagUtils.of(request, params);

        mav.addObject("staffs", userService.getListStaff());
        mav.addObject("districts", District.getDistricts());
        mav.addObject("typeCodes", TypeCode.getTypes());

        List<BuildingSearchResponse> results = buildingService.findAll(params, PageRequest.of(params.getPage() - 1, params.getMaxPageItems()));
        params.setListResult(results);
        params.setTotalItems(buildingService.countTotalItems());

        mav.addObject("buildingList", results);
        mav.addObject("params", params);
        mav.addObject("formUrl", request.getRequestURI());

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
        mav.addObject("building", buildingService.findBuildingById(id));
        return mav;
    }
}
