package com.example.program.service;

import com.example.program.dao.LoginDao;
import com.example.program.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("LoginService")
public class LoginService {
    @Autowired
    private LoginDao loginDao;

    public Integer loginCheck(Integer account,String password,Integer type){
        if(loginDao.loginCheck(account,password,type) == 0){
            if(loginDao.accountCheck(account,password,type)==0){
                return -1;//账号或者登陆类型错误
            }
            else{
                return -2;//密码错误
            }
        }
        else {
            return loginDao.loginCheck(account,password,type);
        }
    }

    public Integer register(Integer user_id,
                            String user_name,
                            Integer user_gender,
                            Integer user_age,
                            String user_pro,
                            String user_college,
                            Integer user_degree,
                            String user_email,
                            String user_password){
        return loginDao.register(user_id,user_name,user_gender,user_age,user_pro,user_college,user_degree,user_email,user_password);
    }
}
