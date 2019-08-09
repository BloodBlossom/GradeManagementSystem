package com.example.program.controller;
import com.example.program.service.tc_subService;
import com.example.program.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class tc_subController {
    @Autowired
    private tc_subService tc_subService;


    @GetMapping("/gettc_sub")
    public List<Subject> gettc_sub(@RequestParam("tc_id") Integer tc_id){

        return tc_subService.querytc_sub(tc_id);
    }
}
