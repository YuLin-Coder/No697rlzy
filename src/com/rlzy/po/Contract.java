package com.rlzy.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class Contract implements Serializable {

    private Integer id;

    private String eno;

    private Double salary;

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date hireDate;

    private String note;

    private String file;

    private Date createTime;

    private String ename;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEno() {
        return eno;
    }

    public void setEno(String eno) {
        this.eno = eno;
    }

    public Double getSalary() {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public Contract() {
    }

    public Contract(int id, String eno, Double salary, Date hireDate, String note, String file, Date createTime) {
        this.id = id;
        this.eno = eno;
        this.salary = salary;
        this.hireDate = hireDate;
        this.note = note;
        this.file = file;
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Contract{" +
                "id=" + id +
                ", eno='" + eno + '\'' +
                ", salary=" + salary +
                ", hireDate=" + hireDate +
                ", note='" + note + '\'' +
                ", file='" + file + '\'' +
                ", createTime=" + createTime +
                '}';
    }

}
