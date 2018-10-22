package com.aaa.market.controller;


import com.aaa.market.biz.SupplierBiz;

import com.aaa.market.entity.Goods;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;


import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class SuppController {


    @Autowired
    private SupplierBiz supplierBiz;

    //查询所有
    @RequestMapping("getAllSupp")
    public  @ResponseBody List<Map> getAllSup(){

        List<Map> supAll = supplierBiz.getAllSup();
        System.out.println(supAll);
        return supAll;
    }

    //查询供应商
    @RequestMapping("getSupp")
    public @ResponseBody List<Map> getSupp(@RequestBody String supname){

         System.out.print(supname);

         List<Map> list= supplierBiz.getSup("%"+supname+"%");
         System.out.print(list);
         return list;
    }

    //添加商品
    @RequestMapping(value="addgoods")
    public @ResponseBody String addgoods(@RequestBody List<Map> list) throws IOException {




        supplierBiz.addGoods(list);
        return "OK";
    }

    //查询供货商商品
    @RequestMapping("getSuppGoods")
    public @ResponseBody List<Map> getSuppGoods(Integer supplierid)  {

        System.out.println(supplierid);
        List<Map> list = supplierBiz.getSupp(supplierid);
        return  list;
    }
    //查询商品
    @RequestMapping("getGoods")
    public @ResponseBody List<Map> getGoods(){


        List<Map> list = supplierBiz.getGoods();
        return list;
    }
    //查询商品id
    @RequestMapping("getGoodsId")
    public @ResponseBody List<Map> getGoodsId(Integer goodsnums){

        List<Map> list = supplierBiz.getGoodsId(goodsnums);
        return list;
    }
    //给供货商添加商品
    @RequestMapping(value="addgoodssup")
    public @ResponseBody String addgoodssup(@RequestBody List<Map> list)  {

        System.out.println(list);


        supplierBiz.addgoodssup(list);
        return "OK";
    }



}
