package com.example.program.service;

import com.example.program.dao.StDao;
import com.example.program.entity.Student;
import com.example.program.entity.StudentScore;
import com.example.program.entity.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("StService")
public class StService {

    @Autowired
    private StDao stDao;

    public Student getStInfo(Integer account){
        return stDao.getStInfo(account);
    }

    public List<Subject> filterSub(String su_name,String tc_name,Integer is_select,Integer st_id){


        if (is_select == null){

            return stDao.filterSub(su_name,tc_name,st_id);
        }
        else{
            return stDao.filterSubIs(su_name,tc_name,is_select,st_id);
        }
    }

    public Integer selectSubject(Integer su_no,Integer  st_id){
        return stDao.selectSubject(su_no,st_id);
    }

    public List<StudentScore> getStScore(Integer account){
        return stDao.getStScore(account);
    }
}
