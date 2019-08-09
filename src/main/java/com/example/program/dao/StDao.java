package com.example.program.dao;

import com.example.program.entity.Student;
import com.example.program.entity.StudentScore;
import com.example.program.entity.Subject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StDao {
    public Student getStInfo(@Param("account") Integer account);
    public List<Subject> filterSubIs(@Param("su_name") String su_name,@Param("tc_name") String tc_name,@Param("is_select") Integer is_select,@Param("st_id") Integer st_id);
    public List<Subject> filterSub(@Param("su_name") String su_name,@Param("tc_name") String tc_name,@Param("st_id") Integer st_id);
    public Integer selectSubject(@Param("su_no") Integer su_no , @Param("st_id") Integer st_id);
    public List<StudentScore> getStScore(@Param("account") Integer account);
}
