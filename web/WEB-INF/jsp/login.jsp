<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
            integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
            crossorigin="anonymous"></script>
    <title>人力资源管理系统</title>
</head>
<body style="background: url(${pageContext.request.contextPath}/images/bg1.png) no-repeat">
<div class="container" style="text-align: center">
    <form id="login-form" class="col-md-4 col-md-offset-4" action="${pageContext.request.contextPath}/login"
          method="post">
        <h1>人力资源管理系统登录</h1>
<%--        <div class="alert alert-danger alert-dismissable" id="check" >
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>      </div>--%>
           <span>${msg}</span>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon "><i class="glyphicon glyphicon-user"></i></span>
                <input type="email" name="email" class="form-control" placeholder="请输入邮箱账号"
                       aria-required="true">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                <input type="password" name="pwd" class="form-control" placeholder="请输入密码"
                       aria-required="true">
            </div>
        </div>
        <div class="form-group">
            <label class="radio-inline">
                <input type="radio" name="type" value="1" checked> 员工
            </label>
            <label class="radio-inline">
                <input type="radio" name="type" value="2"> 管理员
            </label>
        </div>

        <div class="form-group">
                    <span>
                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                    </span>
        </div>
    </form>
    <%--<div class="top">
        <p>账户登陆</p>
    </div>

    <div class="middle">
        <form action="${pageContext.request.contextPath}/login" method="post">

            <span class="erro">${msg}</span>
            <span class="s1"></span>
            <span class="s2"></span>
            <input type="text" name="email" value="" placeholder="请输入邮箱账号" class="iputs"/>
            <input type="password" name="pwd" value="" placeholder="请输入密码" class="iputs"/>
            <div class="example-box" style="margin-left: 60px;">
                <label class="lyear-radio radio-inline radio-primary" style="padding: 30px"> <input
                        type="radio" name="type" value="1" checked><span>工作人员</span>
                </label> <label class="lyear-radio radio-inline radio-primary"> <input
                    type="radio" name="type" value="2"><span>管理员</span>
            </label>
            </div>
            <input type="submit" value="人力资源系统登录"/>
        </form>
    </div>--%>
</div>
</body>
<script>
   const check=document.getElementById("check");
   $(document).ready(function () {
       if('${msg}'==='undefined'){
           check.style.display='none';
       }else {
           check.style.display=null;
       }
   });

</script>
</html>
