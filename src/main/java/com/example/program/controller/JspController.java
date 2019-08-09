package com.example.program.controller;

import com.example.program.service.LoginService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.*;

@Controller
public class JspController {
    @GetMapping("/student")
    public String student(){
        return "student";
    }

    @GetMapping("/st_course")
    public String st_course(){
        return "st_course";
    }

    @GetMapping("/st_personal")
    public String st_personal(){
        return "st_personal";
    }

    @GetMapping("/st_score")
    public String st_score(){
        return "st_score";
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }
	
	@GetMapping("/tc_info")
    public String hello(){
		return "tc_info";   
	}
	
    @GetMapping("/tc_sub")
    public String hello1(){
		return "tc_sub";   
	}
	
    @GetMapping("/su_score")
    public String score(){
		return "su_score";  
	}

    @GetMapping("/of_user")
    public String of_user(){ return "of_user"; }

    @GetMapping("/of_personal")
    public String of_personal(){
        return "of_personal";
    }

    @GetMapping("/of_subject")
    public String of_subject(){
        return "of_subject";
    }

    @GetMapping("/of_grade")
    public String of_grade(){
        return "of_grade";
    }
}
