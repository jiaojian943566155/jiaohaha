package com.aaa.market.entity;

import java.util.Date;

public class Goods {
    private Integer goodsid;
    private Integer goodsnum;
    private String goodsname;
    private Date goodsdate;
    private Integer goodslassdate;
    private String goodsmaker;

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getGoodsnum() {
        return goodsnum;
    }

    public void setGoodsnum(Integer goodsnum) {
        this.goodsnum = goodsnum;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public Date getGoodsdate() {
        return goodsdate;
    }

    public void setGoodsdate(Date goodsdate) {
        this.goodsdate = goodsdate;
    }

    public Integer getGoodslassdate() {
        return goodslassdate;
    }

    public void setGoodslassdate(Integer goodslassdate) {
        this.goodslassdate = goodslassdate;
    }

    public String getGoodsmaker() {
        return goodsmaker;
    }

    public void setGoodsmaker(String goodsmaker) {
        this.goodsmaker = goodsmaker;
    }

    public Goods(Integer goodsid, Integer goodsnum, String goodsname, Date goodsdate, Integer goodslassdate, String goodsmaker) {
        this.goodsid = goodsid;
        this.goodsnum = goodsnum;
        this.goodsname = goodsname;
        this.goodsdate = goodsdate;
        this.goodslassdate = goodslassdate;
        this.goodsmaker = goodsmaker;
    }

    public Goods() {
        super();
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsid=" + goodsid +
                ", goodsnum=" + goodsnum +
                ", goodsname='" + goodsname + '\'' +
                ", goodsdate=" + goodsdate +
                ", goodslassdate=" + goodslassdate +
                ", goodsmaker='" + goodsmaker + '\'' +
                '}';
    }
}
