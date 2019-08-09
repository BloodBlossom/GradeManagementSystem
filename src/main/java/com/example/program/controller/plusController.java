package com.example.program.controller;
import com.example.program.service.plusService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.Date;
@RestController
public class plusController {
    @Autowired
    private plusService plusService;


    @PostMapping("/insertSub")
    public Integer insertSub(@RequestParam("su_no") Integer su_no,
                                  @RequestParam("tc_id") Integer tc_id,
                                  @RequestParam("su_name") String su_name,
                                  @RequestParam("tc_name") String tc_name,
                                  @RequestParam("su_credit") Integer su_credit,
                                  @RequestParam("se_begin") Date se_begin,
                                  @RequestParam("se_end") Date se_end,
                                  @RequestParam("ma_begin") Date ma_begin,
                                  @RequestParam("ma_end") Date ma_end){

        return plusService.queryplus(su_no,tc_id,su_name,tc_name,su_credit,se_begin,se_end,ma_begin,ma_end);
    }
}
