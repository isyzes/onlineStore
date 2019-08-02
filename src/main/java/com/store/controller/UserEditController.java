package com.store.controller;

import com.store.model.user.Role;
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

import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class UserEditController {
    @Autowired
    private UserService userService;

    @Autowired
    private MailService mailService;

    @RequestMapping(value = "editUser", method = RequestMethod.GET)
    public String editUser(@AuthenticationPrincipal User user, Model model,
                           @RequestParam(name = "newsletter", required = false) String email) {
        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        List<User> users = userService.getAllUser();

        addAttribute(model, users, user);

        return "editUserList";
    }

    @RequestMapping(value = "editUser/{userId}", method = RequestMethod.POST)
    public String editUser(
            @AuthenticationPrincipal User user,
            @PathVariable(name = "userId") String userId ,
            @RequestParam(name = "role") String role,
            Model model,
            @RequestParam(name = "newsletter", required = false) String email) {

        if (!StringUtils.isEmpty(email)) {
            mailService.addEmailRepository(email);
        }

        User userEdit = userService.getUser(userId);

        userService.editUserRole(userEdit, role);

        List<User> users = userService.getAllUser();

        addAttribute(model, users, user);

        return "editUserList";
    }

    private void addAttribute (Model model, List<User> users,User user ) {
        model.addAttribute("users", users);
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
    }

}
