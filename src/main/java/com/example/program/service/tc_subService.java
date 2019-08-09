package com.example.program.service;

import com.example.program.dao.tc_subDao;
import com.example.program.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tc_subService")
public class tc_subService {

    @Autowired
    private tc_subDao tc_subDao;

    public List<Subject> querytc_sub(Integer tc_id){

        return tc_subDao.selectById(tc_id);
    }
}
