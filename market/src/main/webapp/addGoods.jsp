<%--
  Created by IntelliJ IDEA.
  User: 焦哈哈
  Date: 2018/10/15
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js\jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table class="table table-striped table-hover table-bordered">
    <tr>
        <td>请输入商品编号</td>
        <td>请输入商品名称</td>
        <td>请输入生产日期</td>
        <td>请输入保质期</td>
        <td>请输入生产商</td>
    </tr>
    <tbody id="addtr" >


    </tbody>

</table>
<button type="button" class="btn btn-default" onclick="addtr()">添加一行</button>
<button type="button" class="btn btn-info" onclick="addgoods()">保存</button>
</body>
</html>
<script>
    function addtr(){
        var tr="<tr>";
        tr+="<td><input id='goodsnum' name='goodsnum' type='text' /></td>";
        tr+="<td><input id='goodsname' name='goodsname' type='text' /></td>";
        tr+="<td><input id='goodsdate' name='goodsdate' type='text' /></td>";
        tr+="<td><input id='goodslassdate' name='goodslassdate' type='text' /></td>";
        tr+="<td><input id='goodsmaker' name='goodsmaker' type='text' /></td>";

        tr+="</tr>";
        $("#addtr").append(tr);

    }
    function addgoods(){
        var jsonArr = [];
        $("#addtr tr").each(function (){
            var goodsnum=$(this).find("#goodsnum").val();
            alert(goodsnum);
            var goodsname=$(this).find("#goodsname").val()
            alert(goodsname);
            var goodsdate=$(this).find("#goodsdate").val();
            var goodslassdate=$(this).find("#goodslassdate").val();
            var goodsmaker=$(this).find("#goodsmaker").val();
            var jsonStr={"goodsnum":goodsnum,"goodsname":goodsname,"goodsdate":goodsdate,"goodslassdate":goodslassdate,"goodsmaker":goodsmaker};

            jsonArr.push(jsonStr);

        }

        );


        $.ajax({
            url:"addgoods",
            contentType: "application/json; charset=utf-8",
            data:JSON.stringify(jsonArr),
            dataType:"json",
            type:"post",
            success:function(data){
                alert(data);
                alert("成功");
            }

        })

    }

</script>