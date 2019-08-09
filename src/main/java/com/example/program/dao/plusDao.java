package com.example.program.dao;


import org.springframework.stereotype.Repository;

import java.util.Date;



@Repository
public interface plusDao {

    public Integer selectById(Integer su_no,
                                    Integer tc_id,
                                    String su_name,
                                    String tc_name,
                                    Integer su_credit,
                                    Date se_begin,
                                    Date se_end,
                                    Date ma_begin,
                                    Date ma_end);
}
