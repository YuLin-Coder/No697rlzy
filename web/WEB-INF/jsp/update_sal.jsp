<%--
  Created by IntelliJ IDEA.
  User: Zxj
  Date: 2021/12/3
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
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
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="${pageContext.request.contextPath}/toUpdateUserSal?id=${sal.id}">修改员工薪资</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/toUpdateUserSal?id=${sal.id}" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="layui-row" id="findmyinfo">
    <div class="layui-col-md10">
        <form class="layui-form" id="findmyinforecpt" style="height: 500px;width: 30%">
            <br>
            <input type="hidden" value="${sal.id}" name="id">
            <div class="layui-form-item">
                <label class="layui-form-label">员工编号：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="eno"  value="${sal.eno}" class="layui-input" placeholder="请输员工编号" readonly>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">员工姓名：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="ename" value="${sal.ename}"  class="layui-input" placeholder="请输入员工姓名">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">基本工资：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="sal" value="${sal.sal}"  class="layui-input" placeholder="请输入基本工资">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">绩效：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="jx" value="${sal.jx}"  class="layui-input" placeholder="请输入员工绩效">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">扣除社保：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="kcsb" value="${sal.kcsb}"  class="layui-input" placeholder="请输入员工扣除社保">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">旷工扣薪：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="kx" value="${sal.kx}"  class="layui-input" placeholder="请输入员工扣薪">
                </div>
            </div>


            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.on('submit(formDemo)', function(data) {
            // layer.msg('aaa',{icon:1,time:3000});
            var param=data.field;
            // console.log(JSON.stringify(param));
            $.ajax({
                url: '${pageContext.request.contextPath}/UpdateUserSal',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    layer.msg('修改成功', {icon: 1, time: 3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/getAllSal';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/getAllSal';},2000);
                }
            });
        });
    });

</script>
</body>
</html>
