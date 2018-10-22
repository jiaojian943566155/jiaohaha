<%--
  Created by IntelliJ IDEA.
  User: 焦哈哈
  Date: 2018/10/17
  Time: 16:35
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
        <tr >
            选择供应商<select class="supplier" name="supplierid">

            </select>
        </tr>
        <tr>
            <td>商品编号</td>
            <td>商品名称</td>
            <td>生产日期</td>
            <td>保质期</td>
            <td>生产商</td>
        </tr>
        <tbody id="suppGoods">


        </tbody>
    </table>
    <button type="button" class="btn btn-default" onclick="addtr()">添加一行</button>
    <button type="button" class="btn btn-info" onclick="addgoods()">保存</button>
    <!-- 模态框（Modal） -->
    <div class="modal fade" style="width: 1000px;align-content: center" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">

                    </h4>
                </div>
                <div class="modal-body" >
                    <table class="table table-striped table-hover table-bordered" >
                        <tr>
                            <td>商品编号</td>
                            <td>商品名称</td>
                            <td>生产日期</td>
                            <td>保质期</td>
                            <td>生产商</td>
                        </tr>
                        <tbody id="tbody2">

                        </tbody>

                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>
</html>
<script>
    var s=1;
    $(function(){
        getAllSupp();
    });
    function getAllSupp(){
        $.ajax({
            url:"getAllSupp",
            type:"post",
            contentType: "application/json; charset=utf-8",
            dataType:"json",
            success:function(data){

                $(".supplier").html("");
                for (var i=0; i<data.length;i++){

                   $(".supplier").append("<option value='"+data[i].supplierid+"'>"+data[i].suppliername+"</option>");
                }
            }

        })
    }
    function addtr(){

        var tr="<tr>";
        tr+="<td><input class='goodsnum' id='goodsnum' name='goodsnum' type='text' onclick='queryGoods(this)' class='' data-toggle='modal' data-target='#myModal'/></td>";
        tr+="<td><input class='goodsname' id='goodsname' name='goodsname' type='text' /></td>";
        tr+="<td><input class='goodsdate' id='goodsdata' name='goodsdate' type='text' /></td>";
        tr+="<td><input class='goodslassdate' id='goodslassdate' name='goodslassdate' type='text' /></td>";
        tr+="<td><input class='goodsid' id='goodsid' name='goodsid' type='hidden' /><input class='goodsmaker' id='goodsmaker' name='goodsmaker' type='text' /></td>";

        tr+="</tr>";

        $("#suppGoods").append(tr);


    }
    function queryGoods(obj){
        //获取modal的宽度
        var modalWidth = $("#myModal").width();

        //计算偏移量
        var left = "-" + parseInt(modalWidth) / 2 + "px";

        //modal居中
        $("#myModal").css({"margin-left":left});
        $.ajax({
            url:"getGoods",
            type:"post",
            dataType:"json",
            success: function (data) {


                $("#tbody2").html("");
                for (var i = 0; i < data.length; i++) {
                    var tr = "<tr  onclick='addgoodsInfo("+data[i].goodsnum+")'>";
                    tr += "<td>" + data[i].goodsnum + "</td>";
                    tr += "<td>" + data[i].goodsname + "</td>";
                    tr += "<td>" + data[i].goodsdate + "</td>";
                    tr += "<td>" + data[i].goodslassdate + "</td>";
                    tr += "<td>" + data[i].goodsmaker+ "</td>";
                    tr += "</tr>";

                    $("#tbody2").append(tr);

                }

            }

        })

    }
    function addgoodsInfo(goodsnum){

        $.ajax({
            url:"getGoodsId",
            type:"post",
            data:{"goodsnums":goodsnum},
            dataType:"json",
            success:function(data){
                $("#goodsid").val(data[0].goodsid);
                $("#goodsnum").val(data[0].goodsnum);
                $("#goodsname").val(data[0].goodsname);
                $("#goodsdate").val(data[0].goodsdate);
                $("#goodslassdate").val(data[0].goodslassdate);
                $("#goodsmaker").val(data[0].goodsmaker);
                $("#goodsid").attr("id","goodsid"+s +"");
                $("#goodsnum").attr("id","goodsnum"+s+"");
                $("#goodsname").attr("id","goodsname"+s+"");
                $("#goodsdate").attr("id","goodsdate"+s+"");
                $("#goodslassdate").attr("id","goodslassdate"+s+"");
                $("#goodsmaker").attr("id","goodsmaker"+s+"");
                s++;

            }

        })

    }
    function addgoods(){
        var jsonArr = [];
        $("#suppGoods tr").each(function (){
                var goodsid=$(".goodsid").val();
                alert(goodsid);
                var supplierid=$(".supplier").val()
                alert(supplierid);

                var jsonStr={"goodsid":goodsid,"supplierid":supplierid};

                jsonArr.push(jsonStr);

            }

        );


        $.ajax({
            url:"addgoodssup",
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