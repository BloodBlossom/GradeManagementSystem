package com.example.program.controller;
import com.example.program.entity.tc_info;
import com.example.program.service.tc_infoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class tc_infoController {
    @Autowired
    private tc_infoService tc_infoService;


    @GetMapping("/gettc_info")
    public tc_info gettc_info(@RequestParam("tc_id") Integer tc_id){

        return tc_infoService.querytc_info(tc_id);
    }

}

