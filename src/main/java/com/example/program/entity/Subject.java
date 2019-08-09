package com.example.program.entity;

import java.util.Date;

public class Subject {
    Integer su_no;
    String su_name;
    Integer su_credit;
    Integer tc_id;
    String tc_name;
    Date se_begin;
    Date se_end;
    Date ma_begin;
    Date ma_end;
    Integer is_select;
    String se_time;
    String ma_time;

    public String getSe_time() {
        return se_time;
    }

    public void setSe_time(String se_time) {
        this.se_time = se_time;
    }

    public String getMa_time() {
        return ma_time;
    }

    public void setMa_time(String ma_time) {
        this.ma_time = ma_time;
    }

    public Integer getIs_select() {
        return is_select;
    }

    public void setIs_select(Integer is_select) {
        this.is_select = is_select;
    }

    public Integer getSu_no() {
        return su_no;
    }

    public void setSu_no(Integer su_no) {
        this.su_no = su_no;
    }

    public String getSu_name() {
        return su_name;
    }

    public void setSu_name(String su_name) {
        this.su_name = su_name;
    }

    public Integer getSu_credit() {
        return su_credit;
    }

    public void setSu_credit(Integer su_credit) {
        this.su_credit = su_credit;
    }

    public Integer getTc_id() {
        return tc_id;
    }

    public void setTc_id(Integer tc_id) {
        this.tc_id = tc_id;
    }

    public String getTc_name() {
        return tc_name;
    }

    public void setTc_name(String tc_name) {
        this.tc_name = tc_name;
    }

    public Date getSe_begin() {
        return se_begin;
    }

    public void setSe_begin(Date se_begin) {
        this.se_begin = se_begin;
    }

    public Date getSe_end() {
        return se_end;
    }

    public void setSe_end(Date se_end) {
        this.se_end = se_end;
    }

    public Date getMa_begin() {
        return ma_begin;
    }

    public void setMa_begin(Date ma_begin) {
        this.ma_begin = ma_begin;
    }

    public Date getMa_end() {
        return ma_end;
    }

    public void setMa_end(Date ma_end) {
        this.ma_end = ma_end;
    }
}
