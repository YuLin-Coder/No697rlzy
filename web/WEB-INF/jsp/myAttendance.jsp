<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.rlzy.po.Sal" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">


    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
    <title>部门员工具体信息</title>

</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/FindMyAttendance">打卡详情</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="${pageContext.request.contextPath}/FindMyAttendance" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <table class="layui-table">
        <thead>
        <tr>
            <th>员工姓名</th>
            <th>星期几</th>
            <th>签到状态</th>
            <th>时间</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="attendance">
            <tr>
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
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<a href="javascript:history.go(-1)">返回上一页</a>
</body>
</html>
