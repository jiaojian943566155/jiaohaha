<%--
  Created by IntelliJ IDEA.
  User: 焦哈哈
  Date: 2018/10/11
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js\jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<style>





</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="end">
        请输入供货商：<input id="supname" type="text" /><input type="button" value="查询" onclick="queSup()"/>
        <table id="suppgoods" class="table table-striped table-hover table-bordered" >
            <tr>
                <td>供货商</td>
                <td>供货商电话</td>
                <td>供货商地址</td>

            </tr>
            <tbody id="tbody">

            </tbody>

        </table>
    </div>
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
                            <td>供货商</td>
                            <td>供货商电话</td>
                            <td>供货商地址</td>
                        </tr>
                        <tbody id="tbody2">

                        </tbody>

                    </table>
                    <div>
                        <a href="GoodsInfo.jsp">供货商添加商品</a>
                    </div>
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

    $(function(){
        getAllSupp();
    });
    function queSup(){
        var name=$("#supname").val();
        getSupp(name);
    }
    function getSupp(obj){

        $.ajax({
            url:"getSupp",
            type:"post",
            contentType: "application/json; charset=utf-8",
            data:obj,
            dataType:"json",
            success:function(data){
                $("#tbody").html("");
                for (var i=0; i<data.length;i++){
                    var tr="<tr onclick='getsuppid("+data[i].supplierid+")'>";
                    tr+="<td>"+data[i].suppliername+"</td>";
                    tr+="<td>"+data[i].suppliertel+"</td>";
                    tr+="<td>"+data[i].supplieraddress+"</td>";
                    tr+="</tr>";
                    $("#tbody").append(tr);

                }
            }

        })

    }
    function getAllSupp(){

        $.ajax({
            url:"getAllSupp",
            type:"post",
            contentType: "application/json; charset=utf-8",
            dataType:"json",
            success:function(data){

                $("#tbody").html("");
                for (var i=0; i<data.length;i++){

                    var tr="<tr onclick='getsuppid("+data[i].supplierid+")' class='' data-toggle='modal' data-target='#myModal'>";
                    tr+="<td>"+data[i].suppliername+"</td>";
                    tr+="<td>"+data[i].suppliertel+"</td>";
                    tr+="<td>"+data[i].supplieraddress+"</td>";
                    tr+="</tr>";
                    $("#tbody").append(tr);

                }
            }

        })

    }
    function getsuppid(obj) {
        //获取modal的宽度
        var modalWidth = $("#myModal").width();

        //计算偏移量
        var left = "-" + parseInt(modalWidth) / 2 + "px";

        //modal居中
        $("#myModal").css({"margin-left":left});
        alert(obj);
        $.ajax({
            url:"getSuppGoods",
            type:"post",
            data:{"supplierid":obj},

            dataType:"json",
            success: function (data) {


                $("#tbody2").html("");
                for (var i = 0; i < data.length; i++) {
                    var tr = "<tr>";
                    tr += "<td>" + data[i].goodsnum + "</td>";
                    tr += "<td>" + data[i].goodsname + "</td>";
                    tr += "<td>" + data[i].goodsdate + "</td>";
                    tr += "<td>" + data[i].goodslassdate + "</td>";
                    tr += "<td>" + data[i].goodsmaker+ "</td>";
                    tr += "<td>" + data[i].suppliername + "</td>";
                    tr += "<td>" + data[i].suppliertel + "</td>";
                    tr += "<td>" + data[i].supplieraddress + "</td>";
                    tr += "</tr>";
                    $("#tbody2").append(tr);

                }
            }

        })
    }



</script>