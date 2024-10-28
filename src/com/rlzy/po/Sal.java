package com.rlzy.po;

import java.io.Serializable;

/**
 * @author Ywj
 * @version 1.0
 * @date 2021/3/20 21:51
 */
public class Sal implements Serializable {

    private Integer id;

    private String eno;

    private String ename;

    private Double sal;

    private Double jx;

    private Double kcsb;

    private Double kx;

    private Double totalsal;

    private String fxrq;

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

    public Double getSal() {
        return sal;
    }

    public void setSal(Double sal) {
        this.sal = sal;
    }

    public Double getJx() {
        return jx;
    }

    public void setJx(Double jx) {
        this.jx = jx;
    }

    public Double getKcsb() {
        return kcsb;
    }

    public void setKcsb(Double kcsb) {
        this.kcsb = kcsb;
    }

    public Double getKx() {
        return kx;
    }

    public void setKx(Double kx) {
        this.kx = kx;
    }

    public Double getTotalsal() {
        return totalsal;
    }

    public void setTotalsal(Double totalsal) {
        this.totalsal = totalsal;
    }

    public String getFxrq() {
        return fxrq;
    }

    public void setFxrq(String fxrq) {
        this.fxrq = fxrq;
    }

    public Sal(Integer id, String eno, String ename, Double sal, Double jx, Double kcsb, Double kx, Double totalsal, String fxrq) {
        this.id = id;
        this.eno = eno;
        this.ename = ename;
        this.sal = sal;
        this.jx = jx;
        this.kcsb = kcsb;
        this.kx = kx;
        this.totalsal = totalsal;
        this.fxrq = fxrq;
    }

    @Override
    public String toString() {
        return "Sal{" +
                "id=" + id +
                ", eno='" + eno + '\'' +
                ", ename='" + ename + '\'' +
                ", sal=" + sal +
                ", jx=" + jx +
                ", kcsb=" + kcsb +
                ", kx=" + kx +
                ", totalsal=" + totalsal +
                ", fxrq='" + fxrq + '\'' +
                '}';
    }

    public Sal() {
        super();
    }
}
