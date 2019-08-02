package com.store.service;

import com.store.model.dto.CaptchaResponse;
import com.store.model.user.Role;
import com.store.model.user.Sex;
import com.store.model.user.User;
import com.store.repository.EmailRepository;
import com.store.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import java.util.*;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {
    private final static String secret = "6LcJz68UAAAAAO4dCyx_2i-DnPwy_9fAhdzAnWFZ";
    private final static String RECAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MailService mailSender;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user;
    }

    public Map<String, Object> isValidUser(String firstName, String lastName, String email, String sex, String password, String retypePassword, String checkbox, String recaptcha, RestTemplate restTemplate) {
        Map<String, Object> attribute = new HashMap<>();

        boolean isUserValid = true;

        String url = String.format(RECAPTCHA_URL, secret, recaptcha);
        CaptchaResponse response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponse.class);

        if (!response.isSuccess()) {
            attribute.put("recaptchaError", "Invalid recaptcha!");
            isUserValid = false;
        }

        if (StringUtils.isEmpty(firstName)) {
            attribute.put("firstNameError", "Invalid first name!");
            isUserValid = false;
        } else attribute.put("firstName", firstName);

        if (StringUtils.isEmpty(lastName)) {
            attribute.put("lastNameError", "Invalid last name!");
            isUserValid = false;
        } else attribute.put("lastName", lastName);

        if (!isValidEmail(email)) {
            attribute.put("emailError", "Such email is already registered!");
            isUserValid = false;
        } else attribute.put("email", email);

        if (StringUtils.isEmpty(password)) {
            attribute.put("passwordError", "Invalid password!");
            isUserValid = false;
        }

        if (StringUtils.isEmpty(retypePassword)) {
            attribute.put("retypePasswordError", "Invalid retype password!");
            isUserValid = false;
        }

        if (!password.equals(retypePassword)) {
            attribute.put("retypePasswordError", "Passwords do not match!");
            isUserValid = false;
        }

        if (!checkbox.equals("on")) {
            attribute.put("checkboxError", "Confirm the terms of use of Shoppe.Com");
            isUserValid = false;
        }

        if (sex == null)
            isUserValid = false;

        if (isUserValid)
            return null;
        else
            return attribute;
    }

    public void addNewUser(String firstName, String lastName, String email, String sex, String password) {

        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password));
        user.setSex(Sex.valueOf(sex));
        user.setRoles(Collections.singleton(Role.ROLE_USER));
        user.setActivationCode(UUID.randomUUID().toString());
        user.setIsActivationAccount(false);

        userRepository.save(user);

        String message = String.format(
                "Hello, %s %s! \n" +
                        "Welcome to Store. Please, visit next link: http://localhost:8080/activate/%s",
                user.getFirstName(),
                user.getLastName(),
                user.getActivationCode()
        );

        mailSender.send(user.getEmail(), "Activation code", message);
        mailSender.addEmailRepository(email);
    }

    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    public Map<String, Object> editUser(User user, String firstName, String lastName, String email, String sex, String oldPassword, String newPassword, String retypePassword) {
        Map<String, Object> attribute = new HashMap<>();
        boolean validEdit = true;


        if (StringUtils.isEmpty(firstName)) {
            attribute.put("firstNameError", "First Name Invalid");
            validEdit = false;
        } else if (user.getFirstName() == null) {
            user.setFirstName(firstName);
        } else if (!user.getFirstName().equals(firstName)) {
            user.setFirstName(firstName);
        }

        if (StringUtils.isEmpty(lastName)) {
            validEdit = false;
            attribute.put("lastNameError", "Last Name Invalid");
        } else if (user.getLastName() == null) {
            user.setLastName(lastName);
        }else if (!user.getLastName().equalsIgnoreCase(lastName)) {
            user.setFirstName(firstName);
        }

        if (StringUtils.isEmpty(email)) {
            attribute.put("emailError", "Last Name Invalid");
            validEdit = false;
        } else if (!user.getEmail().equalsIgnoreCase(email)) {
            user.setEmail(email);
        }
        if (sex != null) {
            user.setSex(Sex.valueOf(sex));
        }

        if (!StringUtils.isEmpty(newPassword)) {
            if (passwordEncoder.matches(oldPassword, user.getPassword())) {
                if (newPassword.equals(retypePassword)) {
                    user.setPassword(passwordEncoder.encode(newPassword));
                } else {
                    attribute.put("passwordError", "Passwords Do Not Match!");
                    validEdit = false;
                }
            } else {
                attribute.put("oldPasswordError", "Invalid Old Password Entered!");
                validEdit = false;
            }
        }

        if (validEdit) {
            userRepository.save(user);
            return Collections.singletonMap("changeSuccessful", "Change Successful!");
        } else
            return attribute;
    }

    public void editUserRole(User user, String role) {
        Set<String> roleEdit = new HashSet<>(Arrays.asList(role.split(",")));

        if (roleEdit.size() > 0) {
            user.getRoles().clear();

            Set<String> roles = Arrays.stream(Role.values())
                    .map(Role::name)
                    .collect(Collectors.toSet());

            user.getRoles().clear();

            for (String key: roleEdit) {
                if (roles.contains(key)) {
                    user.getRoles().add(Role.valueOf(key));
                }
            }
            userRepository.save(user);
        }
    }

    public User getUser(String userId) {
        if (UtilitiesService.isValidId(userId)) {
            long id = Long.parseLong(userId);
            return userRepository.findById(id);
        }
        return null;
    }

    private boolean isValidEmail(String email) {
        if (StringUtils.isEmpty(email))
            return false;

        return userRepository.findByEmail(email) == null;
    }

    public boolean activateUser(String code) {
        User user = userRepository.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);
        user.setIsActivationAccount(true);

        userRepository.save(user);

        return true;
    }
}