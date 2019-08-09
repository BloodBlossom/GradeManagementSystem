package com.example.program.controller;
import com.example.program.service.editService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class editController {
    @Autowired
    private editService editService;

    @PostMapping("/insertSco")
    public Integer interSco(@RequestParam("score") Integer score,
                            @RequestParam("st_id") Integer st_id,
                            @RequestParam("su_no") Integer su_no){

        return editService.queryedit(score,st_id,su_no);
    }
}
