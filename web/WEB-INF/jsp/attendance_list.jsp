<%--
  Created by IntelliJ IDEA.
  User: hkw
  Date: 2018/10/31
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.rlzy.po.User" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<title>后台登录</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
<script src="${pageContext.request.contextPath}/layui_exts/excel.js"></script>

<style type="text/css">
    .layui-table{
        text-align: center;
    }
    .layui-table th{
        text-align: center;
    }
</style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findUser">员工信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/findUser" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="x-body">
    <xblock>
        <button id="addDaKaBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>打卡</button>
        <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" id="test2" onclick="daoChu()" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</button>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>
    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>星期几</th>
            <th>签到状态</th>
            <th>签到时间</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="attendance">
            <tr>
                <td>${attendance.eno}</td>
                <td>${attendance.ename}</td>
                <td>${attendance.weekday}</td>

                <td>
                    <c:if test="${attendance.status==1}">
                        已签到
                    </c:if>
                    <c:if test="${attendance.status==0}">
                        未签到
                    </c:if>
                </td>
                <td>${attendance.qdsj}</td>
                <td>
                    <a title="编辑"    id= "updateAttendance"    href="${pageContext.request.contextPath }/toupdateAttendanceView?id=${attendance.id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${attendance.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="" >
        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${pi.totalCount}"/>
            <c:param name="currentPageNo" value="${pi.pageIndex}"/>
            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
        </c:import>
    </div>

<%--    <div class="" >
        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${pi.totalCount}"/>
            <c:param name="currentPageNo" value="${pi.pageIndex}"/>
            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
        </c:import>
    </div>--%>


</div>
<%--添加考勤记录模态框--%>
<div class="layui-row" id="test" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" id="addDaKaForm">
            <br>
            <div class="layui-form-item">
                <label class="layui-form-label">员工编号：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="eno"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">员工姓名：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="ename"  class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">星期几：</label>
                <div class="layui-input-block">
                    <select class="form-control" name="weekday" size="1">
                        <option value="星期一">星期一</option>
                        <option value="星期二">星期二</option>
                        <option value="星期三">星期三</option>
                        <option value="星期四">星期四</option>
                        <option value="星期五">星期五</option>
                        <option value="星期六">星期六</option>
                        <option value="星期日">星期日</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">打卡</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="已签到" checked="">
                    <input type="radio" name="status" value="0" title="未签到">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">确认打卡</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });


    layui.use(['jquery', 'excel','form','layer','laydate'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });


        /*添加弹出框*/
        $("#addDaKaBtn").click(function () {
            layer.open({
                type:1,
                title:"考勤打卡",
                skin:"myclass",
                area:["50%"],
                anim:2,
                content:$("#test").html()
            });
            $("#addDaKaForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param=data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '${pageContext.request.contextPath}/addAttendance',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('打卡成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findUserAttendance';},2000);

                    },
                    error:function(){
                        layer.msg('打卡失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findUserAttendance';},2000);
                    }
                });
            });
        });
    });

    /*删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("${pageContext.request.contextPath }/deleteAttendanceById",{"id":id},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findUserAttendance';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findUserAttendance';},2000);
                }
            });
        });
    }


    var list2 = [];
    function exportCsv(obj) {
        console.log(obj)
        var list = '';
        console.log($('input[name="path"]'));
        console.log($('input:radio[name="path"]:checked').val())
        var path_str = $('input:radio[name="path"]:checked').val();

        $.ajax({
            type: "get",
            dataType: 'text',
            url: '${pageContext.request.contextPath }/daoChuAttendance',
            async: false,
            //cache: false,
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                list2.splice(0,list2.length);
                console.log("list2上"+list2)
                list = JSON.parse(result);
                $.each(list[0],function(key,value){
                    list2.push(key)
                })
                console.log("list2"+list2)
            }
        });
        //var title = list2;
        var titleForKey = list2;
        var data = list;
        var str = [];
        str.push(obj.title.join(",") + "\n");
        for(var i = 0; i < data.length; i++) {
            var temp = [];
            for(var j = 0; j < titleForKey.length; j++) {
                temp.push(data[i][titleForKey[j]]);
            }
            str.push(temp.join(",") + "\n");
        }
        var uri = 'data:text/csv;charset=utf-8,' + encodeURIComponent(str.join(""));
        var downloadLink = document.createElement("a");
        downloadLink.href = uri;
        downloadLink.download = "export.csv";
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }

    function daoChu() {
        document.getElementById("test2").onclick = function() {
            exportCsv({
                title: ["ID","员工编号","员工姓名","星期几","签到","签到时间",],
                titleForKey: list2,
            });
        }
    }
</script>
</body>
</html>
