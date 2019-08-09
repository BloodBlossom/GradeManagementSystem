package com.example.program.service;

import com.example.program.dao.tc_infoDao;
import com.example.program.entity.tc_info;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("tc_infoService")
public class tc_infoService {

    @Autowired
    private tc_infoDao tc_infoDao;

    public tc_info querytc_info(Integer tc_id){

        return tc_infoDao.selectById(tc_id);
    }
}
