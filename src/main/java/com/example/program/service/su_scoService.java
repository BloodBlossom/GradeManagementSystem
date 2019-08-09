package com.example.program.service;

import com.example.program.dao.su_scoDao;
import com.example.program.entity.su_score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("su_scoService")
public class su_scoService {

    @Autowired
    private su_scoDao su_scoDao;

    public List<su_score> querysu_sco(Integer su_no){

        return su_scoDao.selectById(su_no);
    }
}
