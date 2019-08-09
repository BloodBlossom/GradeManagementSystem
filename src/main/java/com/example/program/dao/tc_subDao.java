package com.example.program.dao;

import com.example.program.entity.Subject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface tc_subDao {

    public List<Subject> selectById(@Param("tc_id") Integer tc_id);
}

