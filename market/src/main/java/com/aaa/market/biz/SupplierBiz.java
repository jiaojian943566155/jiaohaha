package com.aaa.market.biz;




import com.aaa.market.entity.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface SupplierBiz {

    //查询当前供货商商品
    List<Map> getSupp(Integer supplierid);
    //添加商品
    List<Map> addGoods(List<Map> list);
    //获取供货商
    List<Map> getAllSup();
    //查询供货商
    List<Map> getSup(String suppliername);
    //查询商品
    List<Map> getGoods();
    //查询商品信息
    List<Map> getGoodsId(@Param("goodsnum")Integer goodsnum);
    //给供货商添加商品
    void addgoodssup(List<Map> list);
}
