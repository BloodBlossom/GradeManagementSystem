package com.example.program.dao;


import org.springframework.stereotype.Repository;

@Repository
public interface editDao {

    public Integer selectById(Integer score,Integer st_id,Integer su_no);
}
