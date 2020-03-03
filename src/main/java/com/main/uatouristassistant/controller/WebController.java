package com.main.uatouristassistant.controller;

import com.main.uatouristassistant.entity.User;
import com.main.uatouristassistant.repository.UserRepository;
import org.apache.commons.codec.digest.DigestUtils;
import com.main.uatouristassistant.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletRequest;

@Controller
public class WebController {

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserController userController;

    @Autowired
    PlaceRepository placeRepository;

    @RequestMapping("/")
    public void handleRequest(HttpServletRequest request) {
        throw new RuntimeException("UA Tourist exception");
    }

    @GetMapping("/")
    public String mainPage() {
        return "index";
    }

    @PostMapping("/save-user")
    public String saveUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){
        userRepository.save(user);
        return "redirect:/show-users";
    }

    @RequestMapping("/login")
    public String loginPage(HttpServletRequest request) {
        return "login";
    }

    @RequestMapping("/login-user")
    public String loginUser(@ModelAttribute User user, HttpServletRequest request) {
        if (userRepository.findByLoginAndPassword(user.getLogin(), DigestUtils.sha256Hex(user.getPassword()))!=null){
            return "homepage";
        } else {
            request.setAttribute("error", "Invalid Username or Password");
            return "login";
        }
    }

    @RequestMapping("/registration")
    public String registrationPage(HttpServletRequest request) {
        return "registration";
    }

    @GetMapping("/show-users")
    public String showAllUsersPage(HttpServletRequest request) {
        request.setAttribute("users", userRepository.findAll());
        return "show-users";
    }

    @RequestMapping("/delete-user")
    public String deleteUser(@RequestParam Long userId, HttpServletRequest request){
        userRepository.deleteById(userId);
        return "redirect:/show-users";
    }

    @RequestMapping("/update-user")
    public String updateUser(@RequestParam Long userId, HttpServletRequest request) {
        request.setAttribute("user", userRepository.findByUserId(userId));
        return "/update-user";
    }

    @RequestMapping("/add-place")
    public String addPlacePage(HttpServletRequest request) {
        return "add-place";
    }

    @GetMapping("/show-places")
    public String showAllPlacesPage(HttpServletRequest request) {
        request.setAttribute("places", placeRepository.findAll());
        return "show-places";
    }

    @RequestMapping("/delete-place")
    public String deletePlace(@RequestParam Long idPlace, HttpServletRequest request) {
        placeRepository.deleteById(idPlace);
        return "redirect:/show-places";
    }
}
