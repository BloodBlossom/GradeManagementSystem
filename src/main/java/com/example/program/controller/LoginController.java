package com.example.program.controller;

import com.example.program.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LoginController {
    @Autowired
    private LoginService loginService;

    @PostMapping("/register")
    public Integer register(@RequestParam("user_id") Integer user_id,
                    @RequestParam("user_name") String user_name,
                    @RequestParam("user_gender") Integer user_gender,
                    @RequestParam("user_age") Integer user_age,
                    @RequestParam("user_pro") String user_pro,
                    @RequestParam("user_college") String user_college,
                    @RequestParam("user_degree") Integer user_degree,
                    @RequestParam("user_email") String user_email,
                    @RequestParam("user_password") String user_password
                    ){
        return loginService.register(user_id,user_name,user_gender-1,user_age,user_pro,user_college,user_degree-1,user_email,user_password);
    }


    @GetMapping("/loginCheck")
    public Integer loginCheck(@RequestParam("account") Integer account,@RequestParam("password") String password,@RequestParam("type") Integer type){
       return loginService.loginCheck(account,password,type);
    }
}