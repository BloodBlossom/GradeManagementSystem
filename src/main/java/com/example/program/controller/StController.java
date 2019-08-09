package com.example.program.controller;

import com.example.program.entity.Student;
import com.example.program.entity.StudentScore;
import com.example.program.entity.Subject;
import com.example.program.service.StService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class StController {

    @Autowired
    private StService   stService;

    @GetMapping("getStInfo")
    public Student getStInfo(@RequestParam("account") Integer account){
        return stService.getStInfo(account);
    }

    @GetMapping("filterSub")
    public List<Subject> filterSub(
            @RequestParam("su_name") String su_name,
            @RequestParam("tc_name") String tc_name,
            @RequestParam("is_select") Integer is_select,
            @RequestParam("st_id") Integer st_id){
        return stService.filterSub(su_name,tc_name,is_select,st_id);
    }

    @PostMapping("selectSubject")
    public Integer selectSubject(@RequestParam("su_no") Integer su_no,@RequestParam("st_id") Integer st_id){
        return stService.selectSubject(su_no,st_id);
    }

    @GetMapping("getStScore")
    public List<StudentScore> getStScore(@RequestParam("account") Integer account){
        return stService.getStScore(account);
    }
}
