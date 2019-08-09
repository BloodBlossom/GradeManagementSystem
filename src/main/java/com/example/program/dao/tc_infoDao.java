package com.example.program.dao;

import com.example.program.entity.tc_info;
import org.springframework.stereotype.Repository;

@Repository
public interface tc_infoDao {

   public tc_info selectById(Integer tc_id);
}