package com.example.program.controller;
import com.example.program.service.su_scoService;
import com.example.program.entity.su_score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class su_scoController {
    @Autowired
    private su_scoService su_scoService;


    @GetMapping("/getsu_sco")
    public List<su_score>getsu_sco(@RequestParam("su_no") Integer su_no){

        return su_scoService.querysu_sco(su_no);
    }
}
