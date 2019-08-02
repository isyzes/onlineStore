package com.store.controller;

import com.store.model.user.User;
import com.store.service.MailService;
import com.store.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.util.Map;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private MailService mailService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(@RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        return "/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(
            @RequestParam(name = "first name") String firstName,
            @RequestParam(name = "last name") String lastName,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "radio") String sex,
            @RequestParam(name = "password") String password,
            @RequestParam(name = "retype password") String retypePassword,
            @RequestParam(name = "checkbox", required = false, defaultValue = "off") String checkbox,
            @RequestParam(name = "g-recaptcha-response") String recaptcha,
            Model model,
            @RequestParam(name = "newsletter", required = false) String newsletter
    ) {
        if (!StringUtils.isEmpty(newsletter)) {
            mailService.addEmailRepository(newsletter);
        }

        Map<String, Object> attribute = userService.isValidUser(firstName, lastName, email, sex, password, retypePassword, checkbox, recaptcha, restTemplate);

        boolean isUserValid = attribute == null;

        if (isUserValid) {
            userService.addNewUser(firstName, lastName, email, sex, password);
            return "/register_finish";
        } else {
            model.addAllAttributes(attribute);
            return "/register";
        }
    }

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public String myProfile(@AuthenticationPrincipal User user, Model model,
                            @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);
        return "profile";
    }

    @RequestMapping(value = "editProfile", method = RequestMethod.GET)
    public String editProfile(@AuthenticationPrincipal User user, Model model,
                              @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);
        return "editProfile";
    }

    @RequestMapping(value = "editProfile", method = RequestMethod.POST)
    public String editProfile(
            @AuthenticationPrincipal User user,
            @RequestParam(name = "first name") String firstName,
            @RequestParam(name = "last name") String lastName,
            @RequestParam(name = "email") String email,
            @RequestParam(name = "radio") String radio,
            @RequestParam(name = "old password") String oldPassword,
            @RequestParam(name = "new password") String newPassword,
            @RequestParam(name = "retype password") String retypePassword,
            @RequestParam(name = "submit") String submit,
            Model model,
            @RequestParam(name = "newsletter", required = false) String newsletter
    ) {
        if (!StringUtils.isEmpty(newsletter)) {
            mailService.addEmailRepository(newsletter);
        }

        if (submit.equalsIgnoreCase("Edit")) {
            Map<String, Object> attribute = userService.editUser(user, firstName, lastName, email, radio, oldPassword, newPassword, retypePassword);
            model.addAllAttributes(attribute);
            model.addAttribute("user", user);

            return "editProfile";
        } else {
            return "redirect:/profile";
        }
    }

    @RequestMapping(value = "purchases", method = RequestMethod.GET)
    public String purchases(@AuthenticationPrincipal User user, Model model,
                            @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        model.addAttribute("user", user);
        return "purchases";
    }

    @RequestMapping(value = "/activate/{code}", method = RequestMethod.GET)
    public String activation(Model model, @PathVariable String code) {
        boolean isActivated = userService.activateUser(code);

        if (isActivated) {
            model.addAttribute("message", "User successfully activated");
        } else {
            model.addAttribute("message", "Activation code is not found!");
        }

        return "activation";
    }
}