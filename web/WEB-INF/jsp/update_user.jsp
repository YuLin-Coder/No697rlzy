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
        <a href="${pageContext.request.contextPath}/toUpdateUserView?id=${user.id}">修改员工信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/toUpdateUserView?id=${user.id}" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<%--个人信息模态框--%>
<div class="layui-row" id="findmyinfo">
    <div class="layui-col-md10">
        <form class="layui-form" id="findmyinforecpt" style="width: 50%;height: 500px">
            <br>
            <input type="hidden" value="${user.id}" name="id">
            <div class="layui-form-item">
                <label class="layui-form-label">员工编号：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="eno"  value="${user.eno}" class="layui-input" placeholder="请输员工编号" readonly>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">员工姓名：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="realname" value="${user.realname}"  class="layui-input" placeholder="请输入员工姓名">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="pwd" value="${user.pwd}"  class="layui-input" placeholder="请输入密码">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">性别：</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男" <c:if test="${user.sex eq '男' }">checked="checked"</c:if>   >
                    <input type="radio" name="sex" value="女" title="女" <c:if test="${user.sex eq '女' }">checked="checked"</c:if>   >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">出生日期：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="birthday" value="${user.birthday}"  class="layui-input" placeholder="请输入出生日期">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">雇佣日期：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="hiredate" value="${user.hiredate}"  class="layui-input" placeholder="请输入雇佣日期">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">邮箱：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="email" value="${user.email}"  class="layui-input" placeholder="请输入邮箱">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">住址：</label>
                <div class="layui-input-block">
                    <textarea type="text" lay-verify="required" name="address"  placeholder="请输入家庭住址" class="layui-input">${user.address}</textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">籍贯：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="jg" value="${user.jg}"  class="layui-input" placeholder="请输入籍贯">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">手机号：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="phone" value="${user.phone}"  class="layui-input" placeholder="请输入手机号">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="deptname" value="${user.deptname}"  class="layui-input" readonly>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">岗位职责：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="gwzz" value="${user.gwzz}"  class="layui-input" placeholder="请输入岗位职责">
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
                url: '${pageContext.request.contextPath}/updateUser',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    layer.msg('修改成功', {icon: 1, time: 3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findUser';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/findUser';},2000);
                }
            });
        });
    });

</script>
</body>
</html>
