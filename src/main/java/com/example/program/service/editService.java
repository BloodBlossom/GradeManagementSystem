package com.example.program.service;

import com.example.program.dao.editDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("editService")
public class editService {

    @Autowired
    private editDao editDao;

    public Integer queryedit(Integer score,Integer st_id,Integer su_no){
        return editDao.selectById(score,st_id,su_no);
    }
}
