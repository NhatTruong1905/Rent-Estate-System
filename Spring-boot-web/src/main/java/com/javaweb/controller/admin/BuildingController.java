package com.javaweb.controller.admin;


import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@RestController(value = "buildingControllerOfAdmin")
public class BuildingController {
    @GetMapping("/admin/building-list")
    public ModelAndView getBuilding(@ModelAttribute(name = "modelSearch") BuildingSearchRequest params) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        return mav;
    }

    @GetMapping("/admin/building-edit")
    public ModelAndView addBuilding() {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        return mav;
    }
}
