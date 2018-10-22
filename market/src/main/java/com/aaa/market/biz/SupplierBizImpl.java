package com.aaa.market.biz;

import com.aaa.market.dao.SupplierDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SupplierBizImpl  implements  SupplierBiz{

    @Autowired
    private SupplierDao supplierDao;




    //查询供货商
    public List<Map> getSup(String suppliername){

        return supplierDao.getSup(suppliername);
    }

    @Override
    public List<Map> getGoods() {
        return supplierDao.getGoods();
    }

    @Override
    public List<Map> getGoodsId(Integer goodsnum) {
        return supplierDao.getGoodsId(goodsnum);
    }

    @Override
    public void addgoodssup(List<Map> list) {

        supplierDao.addgoodssup(list);
    }

    @Override
    public List<Map> getSupp(Integer supplierid) {
        return supplierDao.getSupp(supplierid);
    }

    @Override
    public List<Map> addGoods(List<Map> goods) {
        supplierDao.addGoods(goods);
        return goods;
    }

    @Override
    public List<Map> getAllSup() {


        return supplierDao.getAllSup();
    }
}
