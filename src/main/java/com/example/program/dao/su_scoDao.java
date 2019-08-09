package com.example.program.dao;

import com.example.program.entity.su_score;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface su_scoDao {

    public List<su_score> selectById(@Param("su_no") Integer su_no);
}
