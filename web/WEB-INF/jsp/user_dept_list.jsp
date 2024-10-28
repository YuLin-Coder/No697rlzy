<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<table class="layui-table">
    <thead>
    <tr>
        <th>员工姓名</th>
        <th>性别</th>
        <th>雇佣日期</th>
        <th>邮箱</th>
        <th>住址</th>
        <th>籍贯</th>
        <th>手机号</th>
    </thead>
    <tbody>
    <c:forEach items="${userdept}" var="dept">
        <tr>
            <td>${dept.realname}</td>
            <td>${dept.sex}</td>
            <td>${dept.hiredate}</td>
            <td>${dept.email}</td>
            <td>${dept.address}</td>
            <td>${dept.jg}</td>
            <td>${dept.phone}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="javascript:history.go(-1)">返回上一页</a>
</body>
</html>
