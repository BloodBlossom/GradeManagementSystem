package com.example.program.controller;


import com.example.program.entity.Admin;
import com.example.program.entity.Grade;
import com.example.program.entity.Subject;
import com.example.program.entity.User;
import com.example.program.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AdminCotroller {

    @Autowired
    private AdminService adminService;

    @GetMapping("getAdInfo")
    public Admin getAdInfo(@RequestParam("account") Integer account){
        return adminService.getAdInfo(account);
    }

    @GetMapping("selectUser")
    public List<User> selectUser(@RequestParam("user_id") Integer user_id, @RequestParam("user_name") String user_name, @RequestParam("password") String password, @RequestParam("type") Integer type){
        return adminService.selectUser(user_id,user_name, password, type);
    }
    @PostMapping("addUser")
    public Integer addUser(@RequestParam("user_id") Integer user_id, @RequestParam("user_name") String user_name, @RequestParam("password") String password, @RequestParam("type") Integer type){
        return adminService.addUser(user_id,user_name, password, type);
    }
    @PostMapping("deleteUser")
    public Integer deleteUser(@RequestParam("user_id") Integer user_id, @RequestParam("user_name") String user_name, @RequestParam("password") String password, @RequestParam("type") Integer type){
        return adminService.deleteUser(user_id,user_name, password, type);
    }

    @GetMapping("selectSubject")
    public List<Subject> selectSubject(@RequestParam("su_no") Integer su_no, @RequestParam("su_name") String su_name , @RequestParam("tc_id") Integer tc_id , @RequestParam("tc_name") String tc_name , @RequestParam("credit") Integer credit){
        return adminService.selectSubject(su_no, su_name, tc_id, tc_name, credit);
    }
    @PostMapping("addSubject")
    public Integer addSubject(@RequestParam("su_no") Integer su_no, @RequestParam("su_name") String su_name ,@RequestParam("tc_id") Integer tc_id , @RequestParam("tc_name") String tc_name , @RequestParam("credit") Integer credit){
        return adminService.addSubject(su_no, su_name, tc_id, tc_name, credit);
    }
    @PostMapping("deleteSubject")
    public Integer deleteSubject(@RequestParam("su_no") Integer su_no, @RequestParam("su_name") String su_name ,@RequestParam("tc_id") Integer tc_id , @RequestParam("tc_name") String tc_name , @RequestParam("credit") Integer credit){
        return adminService.deleteSubject(su_no, su_name, tc_id, tc_name, credit);
    }

    @GetMapping("selectGrade")
    public List<Grade> selectGrade(@RequestParam("su_no") Integer su_no,@RequestParam("su_name") String su_name ,@RequestParam("st_id") Integer st_id,@RequestParam("st_name") String st_name, @RequestParam("score") Float score, @RequestParam("state") Integer state){
        return adminService.selectGrade(su_no,su_name, st_id,st_name, score, state);
    }
    @PostMapping("addGrade")
    public Integer addGrade(@RequestParam("su_no") Integer su_no, @RequestParam("st_id") Integer st_id, @RequestParam("score") Float score, @RequestParam("state") Integer state){
        return adminService.addGrade(su_no, st_id, score, state);
    }
    @PostMapping("AcceptGrade")
    public Integer AcceptGrade(@RequestParam("su_no") Integer su_no, @RequestParam("st_id") Integer st_id){
        return adminService.AcceptGrade(su_no, st_id);
    }
    @PostMapping("RefuseGrade")
    public Integer RefuseGrade(@RequestParam("su_no") Integer su_no, @RequestParam("st_id") Integer st_id){
        return adminService.RefuseGrade(su_no, st_id);
    }

}
