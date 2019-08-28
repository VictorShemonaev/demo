package com.example.demo.controller;

import com.example.demo.entity.User;
import com.example.demo.repo.UserRepo;
import com.example.demo.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Date;


@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private UserValidator userValidator;

    @GetMapping("/")
    public String hello() {
        return "welcom";
    }

    @GetMapping("/user")
    public String userList(Model model, @PageableDefault(sort = {"id"}, direction = Sort.Direction.ASC) Pageable pageable) {
        Page<User> page;

        page = userRepo.findAll(pageable);

        model.addAttribute("page", page);
        model.addAttribute("url", "/user");

        return "user";
    }
    @GetMapping("/new")
    public String creatUserPage() {
        return "new";
    }

    @PostMapping("/new")
    public String addUser(User user, Model model) throws Exception {
        Date dateNow = new Date();
        user.setCreatdat(dateNow);
        System.out.println(user.toString());
        if (userRepo.findByUsername(user.getUsername()) != null){
            model.addAttribute("nameError", "This name is taken.");
            return "new";
        }else {
            if (!userValidator.checkUserName(user.getUsername())) {
                model.addAttribute("nameError", "Invalid username. Minimum 3 characters, maximum 16 and only latin letters!");
                return "new";
            }
            if (!userValidator.checkPasswordName(user.getPassword())) {
                model.addAttribute("passwordError", "Invalid password. Minimum 3 characters, maximum 16 and only latin letters!");
                return "new";
            }
            if (!userValidator.checkFirstAndLastName(user.getFirstname())) {
                model.addAttribute("firstNameError", "Invalid First Name. Minimum 1 characters, maximum 16 and only latin letters!");
                return "new";
            }
            if (!userValidator.checkFirstAndLastName(user.getLastname())) {
                model.addAttribute("lastNameError", "Invalid Last Name. Minimum 1 characters, maximum 16 and only latin letters!");
                return "new";
            }
        }
        System.out.println(user.toString());
        userRepo.save(user);
        return "redirect:/user";
    }

    @GetMapping("/{id}/edit")
    public String updatePage(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", userRepo.getOne(id));
        return "edit";
    }

    @PostMapping("/{id}/edit")
    public String update(@Valid  User user, Model model, @PathVariable("id") int id) throws Exception {
        User userOne = userRepo.getOne(id);
        user.setId(userOne.getId());
        user.setCreatdat(userOne.getCreatdat());
        user.setPassword(userOne.getPassword());

        if (userRepo.findByUsername(user.getUsername()) != null){
            model.addAttribute("usNameError", "This name is taken.");
            return "edit";
        }else {
            if (!userValidator.checkUserName(user.getUsername())) {
                model.addAttribute("usNameError", "Invalid username. Minimum 3 characters, maximum 16 and only latin letters!");
                return "edit";
            }
            if (!userValidator.checkFirstAndLastName(user.getFirstname())) {
                model.addAttribute("firstNameError", "Invalid First Name. Minimum 1 characters, maximum 16 and only latin letters!");
                return "edit";
            }
            if (!userValidator.checkFirstAndLastName(user.getLastname())) {
                model.addAttribute("lastNameError", "Invalid Last Name. Minimum 1 characters, maximum 16 and only latin letters!");
                return "edit";
            }
        }
        userRepo.save(user);

        return "redirect:/user";

    }

    @GetMapping("/user/{id}")
    public String getById(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", userRepo.getOne(id));

        return "view";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        userRepo.deleteById(id);
        return "redirect:/user";
    }
}
