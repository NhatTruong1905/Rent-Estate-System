package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequestDTO;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.UserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("/admin")
public class CustomerController {
    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @GetMapping("/customer-list")
    public ModelAndView getCustomer(@ModelAttribute(name = "modelSearch") CustomerSearchRequestDTO params, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        DisplayTagUtils.of(request, params);

        mav.addObject("status", Status.getListOfStatus());
        mav.addObject("staffList", this.userService.getListStaff());

        if (SecurityUtils.getAuthorities().contains(SystemConstant.STAFF_ROLE)) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            params.setStaffId(staffId);
        }
        List<CustomerDTO> results = this.customerService.findAll(params, PageRequest.of(params.getPage() - 1, params.getMaxPageItems()));
        params.setListResult(results);
        params.setTotalItems(this.customerService.countTotalItem(params));

        mav.addObject("customerList", results);
        mav.addObject("params", params);
        mav.addObject("formUrl", request.getRequestURI());
        return mav;
    }

    @GetMapping("/customer-edit")
    public ModelAndView addCustomer(@ModelAttribute(name = "customer") CustomerDTO customerDTO) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        customerDTO.setStatus(Status.CHUA_XU_LY.getStatus());
        mav.addObject("status", Status.getListOfStatus());
        mav.addObject("transactionType", TransactionType.getListOfTransactionType());

        return mav;
    }

    @GetMapping("/customer-edit-{id}")
    public ModelAndView editCustomer(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");

        if (SecurityUtils.getAuthorities().contains(SystemConstant.STAFF_ROLE)) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            if (!this.customerService.isStaffOfCustomer(staffId, id)) {
                mav.setViewName("error/404");
                return mav;
            }
        }
        mav.addObject("status", Status.getListOfStatus());
        mav.addObject("transactionType", TransactionType.getListOfTransactionType());
        mav.addObject("customer", this.customerService.findCustomerById(id));
        return mav;
    }
}
