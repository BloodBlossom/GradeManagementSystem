package com.example.program.entity;

public class StudentScore {

    String su_name;
    Integer su_credit;
    String tc_name;
    Float score;
    Integer su_state;
    String score_display;


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

    public String getTc_name() {
        return tc_name;
    }

    public void setTc_name(String tc_name) {
        this.tc_name = tc_name;
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

    public String getScore_display() {
        return score_display;
    }

    public void setScore_display(String score_display) {
        this.score_display = score_display;
    }
}
