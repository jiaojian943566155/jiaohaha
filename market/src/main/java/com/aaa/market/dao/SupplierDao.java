package com.aaa.market.dao;

import com.aaa.market.entity.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Map;

@Repository
public interface SupplierDao {
    //查询当前供货商商品
    List<Map> getSupp(@Param("supplierid") Integer supplierid);
    //添加商品
    void addGoods(@Param("list") List<Map> list);
    //获取供货商
    List<Map> getAllSup();
    //查询供货商
    List<Map> getSup(@Param("suppliername")String suppliername);
    //查询所有商品
    List<Map> getGoods();
    //查询商品编号
    List<Map> getGoodsId(@Param("goodsnum")Integer goodsnum);
    //给供货商添加商品
    void addgoodssup(@Param("list") List<Map> list);
}
