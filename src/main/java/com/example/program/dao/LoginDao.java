package com.example.program.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginDao {
    public Integer loginCheck(@Param("account") Integer account,@Param("password") String password,@Param("type") Integer type);
    public Integer accountCheck(@Param("account") Integer account,@Param("password") String password,@Param("type") Integer type);
    public Integer register(@Param("user_id")Integer user_id,
                            @Param("user_name") String user_name,
                            @Param("user_gender") Integer user_gender,
                            @Param("user_age") Integer user_age,
                            @Param("user_pro") String user_pro,
                            @Param("user_college") String user_college,
                            @Param("user_degree") Integer user_degree,
                            @Param("user_email") String user_email,
                            @Param("user_password") String user_password);

}
