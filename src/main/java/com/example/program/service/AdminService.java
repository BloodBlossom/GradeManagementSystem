package com.example.program.service;

import com.example.program.dao.AdminDao;
import com.example.program.entity.Admin;
import com.example.program.entity.Grade;
import com.example.program.entity.User;
import com.example.program.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdminService")
public class AdminService {

    @Autowired
    private AdminDao adminDao;

    public Admin getAdInfo(Integer account){
        return adminDao.getAdInfo(account);
    }

    public List<User> selectUser(Integer user_id, String user_name, String password, Integer type){
        return adminDao.selectUser(user_id, user_name, password, type);
    }
    public Integer addUser(Integer user_id, String user_name, String password, Integer type){
        return adminDao.addUser(user_id, user_name, password, type);
    }
    public Integer deleteUser(Integer user_id, String user_name, String password, Integer type){
        return adminDao.deleteUser(user_id, user_name, password, type);
    }

    public List<Subject> selectSubject(Integer su_no, String su_name, Integer tc_id, String tc_name, Integer credit){
        return adminDao.selectSubject(su_no, su_name, tc_id, tc_name, credit);
    }
    public Integer addSubject(Integer su_no, String su_name, Integer tc_id, String tc_name, Integer credit){
        return adminDao.addSubject(su_no, su_name, tc_id, tc_name, credit);
    }
    public Integer deleteSubject(Integer su_no, String su_name, Integer tc_id, String tc_name, Integer credit){
        return adminDao.deleteSubject(su_no, su_name, tc_id, tc_name, credit);
    }

    public List<Grade> selectGrade(Integer su_no,String su_name, Integer st_id,String st_name, Float score, Integer state){
        return adminDao.selectGrade(su_no,su_name, st_id,st_name, score, state);
    }
    public Integer addGrade(Integer su_no, Integer st_id, Float score, Integer state){
        return adminDao.addGrade(su_no, st_id, score, state);
    }
    public Integer AcceptGrade(Integer su_no, Integer st_id){
        return adminDao.AcceptGrade(su_no, st_id);
    }
    public Integer RefuseGrade(Integer su_no, Integer st_id){
        return adminDao.RefuseGrade(su_no, st_id);
    }
}
