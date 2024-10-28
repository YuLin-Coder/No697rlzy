<%--
  Created by IntelliJ IDEA.
  User: ywj
  Date: 2021/3/23
  Time: 21:03
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
        <a href="${pageContext.request.contextPath}/toupdateAttendanceView?id=${model.id}">修改考勤信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/toupdateAttendanceView?id=${user.id}" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<%--个人信息模态框--%>
<div class="layui-row" id="findmyinfo">
    <div class="layui-col-md10">
        <form class="layui-form" id="findmyinforecpt" style="height: 500px;width: 30%">
            <br>
            <input type="hidden" value="${attendance.id}" name="id">
            <div class="layui-form-item">
                <label class="layui-form-label">员工编号：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="eno"  value="${attendance.eno}" class="layui-input" placeholder="请输员工编号" readonly>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">员工姓名：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="realname" value="${attendance.ename}"  class="layui-input" placeholder="请输入员工姓名">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">星期几：</label>
                <div class="layui-input-block">
                    <select class="form-control" id="weekday" name="weekday" size="1">
                        <option value="星期一" <c:if test="${attendance.weekday=='星期一'}">selected</c:if> >星期一</option>
                        <option value="星期二" <c:if test="${attendance.weekday=='星期二'}">selected</c:if> >星期二</option>
                        <option value="星期三" <c:if test="${attendance.weekday=='星期三'}">selected</c:if> >星期三</option>
                        <option value="星期四" <c:if test="${attendance.weekday=='星期四'}">selected</c:if> >星期四</option>
                        <option value="星期五" <c:if test="${attendance.weekday=='星期五'}">selected</c:if> >星期五</option>
                        <option value="星期六" <c:if test="${attendance.weekday=='星期六'}">selected</c:if> >星期六</option>
                        <option value="星期日" <c:if test="${attendance.weekday=='星期日'}">selected</c:if> >星期日</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">打卡状态：</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="已打卡" <c:if test="${attendance.status eq '1' }">checked="checked"</c:if>   >
                    &emsp;
                    <input type="radio" name="status" value="0" title="未打卡" <c:if test="${attendance.status eq '0' }">checked="checked"</c:if>   >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">签到时间：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="qdsj" value="${attendance.qdsj}"  class="layui-input" placeholder="请输入签到时间">
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
                url: '${pageContext.request.contextPath}/updateUserAttendance',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    layer.msg('修改成功', {icon: 1, time: 3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findUserAttendance';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findUserAttendance';},2000);
                }
            });
        });
    });

</script>
</body>
</html>
