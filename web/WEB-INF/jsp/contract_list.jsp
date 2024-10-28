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
        <a href="/findContract">合同信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/findContract" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<xblock>
 <%--   <button class="layui-btn layui-btn-normal">
        <a style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/toAddContract">添加合同</a></button>--%>
    <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
</xblock>
<div class="x-body">
    <div class="layui-row">

        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/findContract" >
            <input class="layui-input" placeholder="请输入合同详情" name="note" id="note">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <input class="layui-input" type="hidden" name="pageSize" value="4">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>


    </div>
    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>工资</th>
            <th>雇佣日期</th>
            <th>详情</th>
            <th>文件</th>
            <th>签订时间</th>
           <%-- <th>操作</th>--%>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="contract">
            <tr>
                <td>${contract.eno}</td>
                <td>${contract.ename}</td>
                <td>${contract.salary}</td>
                <td><fmt:formatDate value="${contract.hireDate}" pattern="yyyy-MM-dd"/> </td>
                <td>${contract.note}</td>
                <td><a href="${pageContext.request.contextPath }/download?name=${contract.file}">
                        ${contract.file}</a>
                        </td>
                <td><fmt:formatDate value="${contract.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
               <%-- <td>
                    <a title="编辑"    id= "updateAttendance"    href="${pageContext.request.contextPath }/toUpdateContract?contractId=${contract.id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${contract.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>--%>
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

<script>

    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });


    layui.use(['jquery', 'excel','form','layer','laydate','upload'], function(){
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;
            upload = layui.upload;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

    });

    /*删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                url: '${pageContext.request.contextPath}/deleteContract',
                type: "get",
                data: {"contractId":id},
                contentType: "application/json; charset=utf-8",
                success:function(){
                    layer.msg('删除成功', {icon: 1, time: 3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findContract';},2000);

                },
                error:function(){
                    layer.msg('删除失败',{icon:0,time:3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findContract';},2000);

                }
            });
        });
    }


</script>
</body>
</html>
