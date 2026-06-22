package com.javaweb.controller.web;

import com.javaweb.exception.UsernameException;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.UserRegisterDTO;
import com.javaweb.service.UserService;
import com.javaweb.utils.DistrictCode;
import com.javaweb.validation.OnRegister;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.groups.Default;
import java.util.List;
import java.util.stream.Collectors;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage(BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("modelSearch", buildingSearchRequest);
        mav.addObject("districts", DistrictCode.type());
        return mav;
    }

    @GetMapping(value = "/gioi-thieu")
    public ModelAndView introducceBuiding() {
        ModelAndView mav = new ModelAndView("web/introduce");
        return mav;
    }

    @GetMapping(value = "/san-pham")
    public ModelAndView buidingList() {
        ModelAndView mav = new ModelAndView("/web/list");
        return mav;
    }

    @GetMapping(value = "/tin-tuc")
    public ModelAndView news() {
        ModelAndView mav = new ModelAndView("/web/news");
        return mav;
    }

    @GetMapping(value = "/lien-he")
    public ModelAndView contact() {
        ModelAndView mav = new ModelAndView("/web/contact");
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @GetMapping(value = "/register")
    public ModelAndView register() {
        ModelAndView mav = new ModelAndView("register");
        return mav;
    }

    @PostMapping("/register")
    public ModelAndView registerUser(@Validated({Default.class, OnRegister.class}) @ModelAttribute UserRegisterDTO userDTO, BindingResult bindingResult) {
        ModelAndView mav = new ModelAndView("register");
        if (bindingResult.hasErrors()) {
            String errorMessage = bindingResult.getFieldErrors().get(0).getDefaultMessage();

            mav.addObject("message", errorMessage);
            mav.addObject("alert", "danger");
            return mav;
        }

        try {
            userService.registerNewUserAccount(userDTO);
            return new ModelAndView("redirect:/login?registerSuccess=true");
        } catch (UsernameException e) {
            mav.addObject("message", e.getMessage());
            mav.addObject("alert", "danger");
            return mav;
        }

    }

    @RequestMapping(value = "/access-denied", method = RequestMethod.GET)
    public ModelAndView accessDenied() {
        return new ModelAndView("redirect:/login?accessDenied");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/trang-chu");
    }
}
