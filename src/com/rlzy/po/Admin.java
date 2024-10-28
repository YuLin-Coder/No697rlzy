package com.rlzy.po;


import java.io.Serializable;

public class Admin implements Serializable {

    private Integer id;

    private String email;

    private String pwd;

    private String nickname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Admin() {
        super();
    }

    public Admin(Integer id, String email, String pwd, String nickname) {
        this.id = id;
        this.email = email;
        this.pwd = pwd;
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
