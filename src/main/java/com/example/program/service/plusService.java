package com.example.program.service;

import com.example.program.dao.plusDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;

@Service("plusService")
public class plusService {

    @Autowired
    private plusDao plusDao;

    public Integer queryplus(Integer su_no,
                                   Integer tc_id,
                                   String su_name,
                                   String tc_name,
                                   Integer su_credit,
                                   Date se_begin,
                                   Date se_end,
                                   Date ma_begin,
                                   Date ma_end){
        return plusDao.selectById(su_no,tc_id,su_name,tc_name,su_credit,se_begin,se_end,ma_begin,ma_end);
    }
}

