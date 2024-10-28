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
        <a href="${pageContext.request.contextPath}/toupdateAttendanceView?id=${model.id}">修改合同信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/toUpdateContract?contractId=${contract.id}" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<%--个人信息模态框--%>
<div class="layui-row" id="findmyinfo">
    <div class="layui-col-md10">
        <form class="layui-form" id="findmyinforecpt" style="height: 500px;width: 30%">
            <br>
            <input type="hidden" value="${contract.id}" name="id">
            <div class="layui-form-item">
                <label class="layui-form-label">员工编号：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="eno"  value="${contract.eno}" class="layui-input" placeholder="请输员工编号" readonly>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">员工姓名：<font class="text-danger">(不可修改)</font></label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="ename" value="${contract.ename}"  class="layui-input" placeholder="请输入员工姓名" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">工资：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="salary" value="${contract.salary}" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">雇佣日期：</label>
                <div class="layui-input-block">
                    <input type="date" lay-verify="required" name="hireDate"
                           value='<fmt:formatDate value="${contract.hireDate}" pattern="yyyy-MM-dd"/>' class="layui-input"  >
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">详情：</label>
                <div class="layui-input-block">
                    <input type="text" lay-verify="required" name="note" value="${contract.note}" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">文件：</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
                    <button type="button" class="layui-btn" id="test9">开始上传</button>
                    <input type="hidden" name="file" id="file" value="${contract.file}" class="layui-input" >
                </div>
            </div>


            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">合同确认</button>
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
            $.ajax({
                url: '${pageContext.request.contextPath}/updateContract',
                type: "post",
                data:JSON.stringify(param),
                contentType: "application/json; charset=utf-8",
                success:function(){
                    layer.msg('修改成功', {icon: 1, time: 3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/adminFindContract';},2000);

                },
                error:function(){
                    layer.msg('修改失败',{icon:0,time:3000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath}/adminFindContract';},2000);
                }
            });
        });
    });

    layui.use('upload', function () {
        var $ = layui.jquery,upload = layui.upload;
        upload.render({
            elem: '#test8',
            url: '${pageContext.request.contextPath}/upload',
            accept: 'file',
            acceptMime: 'application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            auto: false,
            bindAction: '#test9',
            done: function(res){
                //如果上传失败
                if(res.code != 200){
                    return layer.msg('上传失败');
                }
                //上传成功
                layer.msg('上传成功', {icon: 1, time: 3000});
                $("#file").val(res.name);
            },
            error: function(){
                layer.msg('上传失败', {icon: 1, time: 3000});
            }
        });
    })

</script>
</body>
</html>
