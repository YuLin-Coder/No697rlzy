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
        <a href="/findLeave">请假信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/findLeave" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<xblock>
    <button id="addDaKaBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>请假</button>
    <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
</xblock>
<div class="x-body">
    <xblock>
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/findLeave" >
                <input class="layui-input" placeholder="请输入请假原因" name="reason" id="reason">
                <input class="layui-input" type="hidden" name="pageIndex" value="1">
                <input class="layui-input" type="hidden" name="pageSize" value="4">
                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            </form>
        </div>
    </xblock>
    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>请假原因</th>
            <th>开始日期</th>
            <th>结束日期</th>
            <th>申请时间</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="leave">
            <tr>
                <td>${leave.eno}</td>
                <td>${leave.ename}</td>
                <td>${leave.reason}</td>
                <td><fmt:formatDate value="${leave.startDate}" pattern="yyyy-MM-dd"/> </td>
                <td><fmt:formatDate value="${leave.endDate}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatDate value="${leave.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <c:if test="${leave.status==0}">
                        待审核
                    </c:if>
                    <c:if test="${leave.status==1}">
                        已审核
                    </c:if>
                    <c:if test="${leave.status==2}">
                        未审核
                    </c:if>

                </td>
                <td>
                    <a title="编辑"    id= "updateAttendance"    href="${pageContext.request.contextPath }/toUpdateLeave?leaveId=${leave.id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${leave.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

<%--    <div class="" >--%>
<%--        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>--%>
<%--        <c:import url="pageBtn.jsp">--%>
<%--            <c:param name="totalCount" value="${pi.totalCount}"/>--%>
<%--            <c:param name="currentPageNo" value="${pi.pageIndex}"/>--%>
<%--            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>--%>
<%--        </c:import>--%>
<%--    </div>--%>

    <div class="" >
        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${pi.totalCount}"/>
            <c:param name="currentPageNo" value="${pi.pageIndex}"/>
            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
        </c:import>
    </div>


</div>
<%--添加考勤记录模态框--%>
<div class="layui-row" id="test" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" id="addDaKaForm">
            <br>
            <div class="layui-form-item">
                <label class="layui-form-label">请假原因：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="reason"  class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">开始日期：</label>
                <div class="layui-input-block">
                    <input type="date" lay-verify="required" name="startDate"  class="layui-input" >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">结束日期：</label>
                <div class="layui-input-block">
                    <input type="date" lay-verify="required" name="endDate"  class="layui-input" >
                </div>
            </div>


            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">确认请假</button>
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
                title:"请假",
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
                    url: '${pageContext.request.contextPath}/addLeave',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('请假成功', {icon: 1, time: 3000});
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findLeave';},2000);

                    },
                    error:function(){
                        layer.msg('请假失败',{icon:0,time:3000});
                        setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findLeave';},2000);

                    }
                });
            });
        });
    });

    /*删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url: '${pageContext.request.contextPath}/deleteLeave',
                type: "get",
                data: {"leaveId":id},
                contentType: "application/json; charset=utf-8",
                success:function(){
                    layer.msg('删除成功', {icon: 1, time: 3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findLeave';},2000);

                },
                error:function(){
                    layer.msg('删除失败',{icon:0,time:3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findLeave';},2000);

                }
            });
        });
    }


</script>
</body>
</html>
