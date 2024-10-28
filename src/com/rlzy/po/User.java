package com.rlzy.po;

import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serializable;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/19 20:19
 */
public class User implements Serializable {

    private Integer id;

    private String eno;

    private String realname;

    private String pwd;

    private String sex;

    private String birthday;

    private String hiredate;

    private String email;

    private String address;

    private String jg;

    private String phone;

    private Integer d_id;

    private String gwzz;

    private String deptname;

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

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getHiredate() {
        return hiredate;
    }

    public void setHiredate(String hiredate) {
        this.hiredate = hiredate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJg() {
        return jg;
    }

    public void setJg(String jg) {
        this.jg = jg;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getD_id() {
        return d_id;
    }

    public void setD_id(Integer d_id) {
        this.d_id = d_id;
    }

    public String getGwzz() {
        return gwzz;
    }

    public void setGwzz(String gwzz) {
        this.gwzz = gwzz;
    }

    public String getDeptname() {
        return deptname;
    }

    public void setDeptname(String deptname) {
        this.deptname = deptname;
    }

    public User() {
        super();
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", eno='" + eno + '\'' +
                ", realname='" + realname + '\'' +
                ", pwd='" + pwd + '\'' +
                ", sex='" + sex + '\'' +
                ", birthday='" + birthday + '\'' +
                ", hiredate='" + hiredate + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", jg='" + jg + '\'' +
                ", phone='" + phone + '\'' +
                ", d_id=" + d_id +
                ", gwzz='" + gwzz + '\'' +
                ", deptname='" + deptname + '\'' +
                '}';
    }

    public User(Integer id, String eno, String realname, String pwd, String sex, String birthday, String hiredate, String email, String address, String jg, String phone, Integer d_id, String gwzz, String deptname) {
        this.id = id;
        this.eno = eno;
        this.realname = realname;
        this.pwd = pwd;
        this.sex = sex;
        this.birthday = birthday;
        this.hiredate = hiredate;
        this.email = email;
        this.address = address;
        this.jg = jg;
        this.phone = phone;
        this.d_id = d_id;
        this.gwzz = gwzz;
        this.deptname = deptname;
    }
}
