package com.example.program.dao;


import com.example.program.entity.Admin;
import com.example.program.entity.Grade;
import com.example.program.entity.Subject;
import com.example.program.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminDao {
    public Admin getAdInfo(@Param("account") Integer account);

    public List<User> selectUser(@Param("user_id") Integer user_id, @Param("user_name") String user_name, @Param("password") String password, @Param("type") Integer type);
    public Integer addUser(@Param("user_id") Integer user_id, @Param("user_name") String user_name, @Param("password") String password, @Param("type") Integer type);
    public Integer deleteUser(@Param("user_id") Integer user_id, @Param("user_name") String user_name, @Param("password") String password, @Param("type") Integer type);

    public List<Subject> selectSubject(@Param("su_no") Integer su_no, @Param("su_name") String su_name, @Param("tc_id") Integer tc_id, @Param("tc_name") String tc_name, @Param("credit") Integer credit);
    public Integer addSubject(@Param("su_no") Integer su_no, @Param("su_name") String su_name, @Param("tc_id") Integer tc_id, @Param("tc_name") String tc_name, @Param("credit") Integer credit);
    public Integer deleteSubject(@Param("su_no") Integer su_no, @Param("su_name") String su_name, @Param("tc_id") Integer tc_id, @Param("tc_name") String tc_name, @Param("credit") Integer credit);

    public List<Grade> selectGrade(@Param("su_no") Integer su_no,@Param("su_name") String su_name, @Param("st_id") Integer st_id,@Param("st_name") String st_name, @Param("score") Float score, @Param("state") Integer state);
    public Integer addGrade(@Param("su_no") Integer su_no, @Param("st_id") Integer st_id, @Param("score") Float score, @Param("state") Integer state);
    public Integer AcceptGrade(@Param("su_no") Integer su_no, @Param("st_id") Integer st_id);
    public Integer RefuseGrade(@Param("su_no") Integer su_no, @Param("st_id") Integer st_id);
}
