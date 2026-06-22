package com.javaweb.controller.admin;

import com.javaweb.model.request.CustomerSearchRequestDTO;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/admin")
public class CustomerController {

    @GetMapping("/customer-list")
    public ModelAndView getCustomer(@ModelAttribute(name="modelSearch")CustomerSearchRequestDTO params, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        DisplayTagUtils.of(request, params);
        return mav;
    }
}
