package com.example.program.entity;

public class Grade {
    Integer id;
    Integer su_no;
    Integer st_id;
    Float score;
    Integer su_state;
    String su_name;
    String st_name;

    public String getSu_name() {
        return su_name;
    }

    public void setSu_name(String su_name) {
        this.su_name = su_name;
    }

    public String getSt_name() {
        return st_name;
    }

    public void setSt_name(String st_name) {
        this.st_name = st_name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSu_no() {
        return su_no;
    }

    public void setSu_no(Integer su_no) {
        this.su_no = su_no;
    }

    public Integer getSt_id() {
        return st_id;
    }

    public void setSt_id(Integer st_id) {
        this.st_id = st_id;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public Integer getSu_state() {
        return su_state;
    }

    public void setSu_state(Integer su_state) {
        this.su_state = su_state;
    }
}
