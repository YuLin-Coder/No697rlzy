package com.rlzy.po;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 15:16
 */
public class Dept {

    private Integer id;

    private String dname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public Dept(Integer id, String dname) {
        this.id = id;
        this.dname = dname;
    }

    @Override
    public String toString() {
        return "Dept{" +
                "id=" + id +
                ", dname='" + dname + '\'' +
                '}';
    }

    public Dept() {
        super();
    }
}
