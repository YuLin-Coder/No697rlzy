package com.rlzy.po;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 21:44
 */
public class Attendance implements Serializable {

    private Integer id;

    private String eno;

    private String ename;

    private String weekday;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Integer status;

    private String qdsj;

    private String status_str;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getWeekday() {
        return weekday;
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getQdsj() {
        return qdsj;
    }

    public void setQdsj(String qdsj) {
        this.qdsj = qdsj;
    }

    public String getStatus_str() {
        return status_str;
    }

    public void setStatus_str(String status_str) {
        this.status_str = status_str;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "id=" + id +
                ", eno='" + eno + '\'' +
                ", ename='" + ename + '\'' +
                ", weekday='" + weekday + '\'' +
                ", status=" + status +
                ", qdsj='" + qdsj + '\'' +
                ", status_str='" + status_str + '\'' +
                '}';
    }

    public Attendance() {
        super();
    }

    public Attendance(Integer id, String eno, String ename, String weekday, Integer status, String qdsj, String status_str) {
        this.id = id;
        this.eno = eno;
        this.ename = ename;
        this.weekday = weekday;
        this.status = status;
        this.qdsj = qdsj;
        this.status_str = status_str;
    }
}
