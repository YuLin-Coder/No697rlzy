<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ywj
  Date: 2018/10/15
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <%--<meta http-equiv="Cache-Control" content="no-siteapp" />--%>

    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/layui_exts/excel.js"></script>
    <script src="${pageContext.request.contextPath}/js/timeago.min.js"></script>

    <style>
        /*.o_span{
            display: block;
            text-align: center;
            font-size: 20px;
            letter-spacing:8px
        }*/
    </style>
</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="">人力资源管理系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>

    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <c:if test="${sessionScope.type=='1'}">
                <a href="javascript:;">${sessionScope.ad.realname}</a>
            </c:if>
            <c:if test="${sessionScope.type=='2'}">
                <a href="javascript:;">${sessionScope.ad.nickname}</a>
            </c:if>
            <dl class="layui-nav-child">
                <dd><a href="${pageContext.request.contextPath}/loginOut">退出</a></dd>
            </dl>
        </li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <c:if test="${sessionScope.type=='1'}">
            <ul id="nav">
                <li>
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe613;</i>
                        <cite>部门列表</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/findDept">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>部门信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe723;</i>
                        <cite>员工考勤</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="" id="addStudnetBtn">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>我要打卡</cite>
                            </a>
                            <a href="${pageContext.request.contextPath}/FindMyAttendance?eno" +${sessionScope.ad.eno}>
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>个人最近七次打卡详情</cite>
                            </a>
                        </li>
                    </ul>

                </li>


                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59095;</i>
                        <cite>个人薪资</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/getMySal?eno" +${sessionScope.ad.eno}>
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>我的薪资</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59042;</i>
                        <cite>公告栏</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/findAllBoard">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>公告信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59042;</i>
                        <cite>员工请假</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/findLeave">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>我的请假</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59042;</i>
                        <cite>员工合同</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/findContract">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>我的合同</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6b8;</i>

                        <cite>个人信息管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="" id="myinfo">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>我的信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </c:if>
        <c:if test="${sessionScope.type=='2'}">
            <ul id="nav">
                <li>
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe613;</i>
                        <cite>员工信息管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/findUser">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>员工信息列表</cite>
                            </a>
                        </li>
                    </ul>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/addUserView">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>添加员工</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="layui-icon">&#xe613;</i>
                        <cite>部门管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/adminFindDept">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>部门信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe723;</i>
                        <cite>员工考勤管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/findUserAttendance">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>考勤信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59095;</i>
                        <cite>员工薪资管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/getAllSal">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>薪资列表</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59042;</i>
                        <cite>公告管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/adminFindAllBoard">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>公告信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59042;</i>
                        <cite>员工请假管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/adminFindLeave">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>请假信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#59042;</i>
                        <cite>员工合同管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>

                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/adminFindContract">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>合同信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6b8;</i>

                        <cite>个人信息管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="" id="adminInfo">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>我的信息</cite>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </c:if>
    </div>
</div>

<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show o_div">
                <c:if test="${sessionScope.type=='1'}">
                    <div style="text-align: center;">
                        <span class="o_span"
                              style="font-size:60px "><b>欢迎${sessionScope.ad.realname}来到人力资源管理系统！</b></span>
                    </div>
                    <div style="text-align: center;">
                        <span id="current-time" style="color:#FF0000; font-size:24px"></span>
                    </div>
                    <div style="text-align: center;">
                        <img src="${pageContext.request.contextPath}/images/登录图.png" style="width: 2100px;height: 800px" alt="主页">
                    </div>
                    <%--各种模态框--%>
                    <%--添加考勤记录模态框--%>
                    <div class="layui-row" id="test" style="display: none;">
                        <div class="layui-col-md10">
                            <form class="layui-form" id="addEmployeeForm">
                                <br>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">员工编号：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="eno"
                                               value="${sessionScope.ad.eno}" class="layui-input" placeholder="请输员工编号">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">员工姓名：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="ename"
                                               value="${sessionScope.ad.realname}" class="layui-input"
                                               placeholder="请输入员工姓名">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">星期几：</label>
                                    <div class="layui-input-block">
                                        <select class="form-control" id="weekday" name="weekday" size="1">
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
                                        <button type="button" class="layui-btn layui-btn-normal" lay-submit
                                                lay-filter="formDemo">确认打卡
                                        </button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <%--个人信息模态框--%>
                    <div class="layui-row" id="findmyinfo" style="display: none;">
                        <div class="layui-col-md10">
                            <form class="layui-form" id="findmyinforecpt" style="height: 500px">
                                <br>
                                <input type="hidden" value="${sessionScope.ad.id}" name="id">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">员工编号：<font class="text-danger">(不可修改)</font></label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="eno"
                                               value="${sessionScope.ad.eno}" class="layui-input" placeholder="请输员工编号"
                                               readonly>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">员工姓名：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="realname"
                                               value="${sessionScope.ad.realname}" class="layui-input"
                                               placeholder="请输入员工姓名">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">密码：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="pwd"
                                               value="${sessionScope.ad.pwd}" class="layui-input" placeholder="请输入密码">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">性别：</label>
                                    <div class="layui-input-block">
                                        <input type="radio" name="sex" value="男" title="男"
                                               <c:if test="${sessionScope.ad.sex eq '男' }">checked="checked"</c:if>   >
                                        <input type="radio" name="sex" value="女" title="女"
                                               <c:if test="${sessionScope.ad.sex eq '女' }">checked="checked"</c:if>   >
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">出生日期：</label>
                                    <div class="layui-input-block">
                                        <input type="date" lay-verify="required" name="birthday"
                                               value="${sessionScope.ad.birthday}" class="layui-input"
                                               placeholder="请输入出生日期">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">雇佣日期：<font class="text-danger">(不可修改)</font></label>
                                    <div class="layui-input-block">
                                        <input type="date" lay-verify="required" name="hiredate"
                                               value="${sessionScope.ad.hiredate}" class="layui-input"
                                               placeholder="请输入雇佣日期" readonly>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">邮箱：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="email"
                                               value="${sessionScope.ad.email}" class="layui-input" placeholder="请输入邮箱">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">住址：</label>
                                    <div class="layui-input-block">
                                        <textarea type="text" lay-verify="required" name="address" placeholder="请输入家庭住址"
                                                  class="layui-input">${sessionScope.ad.address}</textarea>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">籍贯：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="jg" value="${sessionScope.ad.jg}"
                                               class="layui-input" placeholder="请输入籍贯">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">手机号：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="phone"
                                               value="${sessionScope.ad.phone}" class="layui-input"
                                               placeholder="请输入手机号">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">所属部门：<font class="text-danger">(不可修改)</font></label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="deptname"
                                               value="${sessionScope.ad.deptname}" class="layui-input" readonly>
                                    </div>

                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">岗位职责：<font class="text-danger">(不可修改)</font></label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="gwzz"
                                               value="${sessionScope.ad.gwzz}" class="layui-input" placeholder="请输入岗位职责"
                                               readonly>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn layui-btn-normal" lay-submit
                                                lay-filter="userInfoformDemo">修改
                                        </button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                </c:if>
                <c:if test="${sessionScope.type=='2'}">
                    <span class="o_span">欢迎${sessionScope.ad.nickname}管理员来到力资源管理系统！</span>
                    <%--个人信息模态框--%>
                    <div class="layui-row" id="findAdminInfo" style="display: none;">
                        <div class="layui-col-md10">
                            <form class="layui-form" id="findAdminInfoRecpt" style="height: 230px;width: 300px">
                                <br>
                                <input type="hidden" value="${sessionScope.ad.id}" name="id">

                                <div class="layui-form-item">
                                    <label class="layui-form-label">员工昵称：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="nickname"
                                               value="${sessionScope.ad.nickname}" class="layui-input"
                                               placeholder="请输入员工姓名">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">密码：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="pwd"
                                               value="${sessionScope.ad.pwd}" class="layui-input" placeholder="请输入员工姓名">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">邮箱：</label>
                                    <div class="layui-input-block">
                                        <input type="text" lay-verify="required" name="email"
                                               value="${sessionScope.ad.email}" class="layui-input" placeholder="请输入邮箱">
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button type="button" class="layui-btn layui-btn-normal" lay-submit
                                                lay-filter="userInfoformDemo">修改
                                        </button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>


<script>
    layui.config({
        base: 'layui_exts/',
    }).extend({
        excel: 'excel',
    });


    layui.use(['jquery', 'excel', 'form', 'layer', 'laydate'], function () {
        var form = layui.form,
            $ = layui.jquery,
            laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });


        /*添加弹出框*/
        $("#addStudnetBtn").click(function () {
            layer.open({
                type: 1,
                title: "考勤打卡",
                skin: "myclass",
                area: ["30%"],
                anim: 2,
                content: $("#test").html()
            });
            $("#addEmployeeForm")[0].reset();
            form.on('submit(formDemo)', function (data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param = data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '${pageContext.request.contextPath}/addAttendance',
                    type: "post",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success: function () {
                        layer.msg('打卡成功', {icon: 1, time: 3000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/toHomePageView';
                        }, 2000);

                    },
                    error: function () {
                        layer.msg('打卡失败', {icon: 0, time: 3000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/toHomePageView';
                        }, 2000);
                    }
                });
            });
        });

        /*添加弹出框*/
        $("#myinfo").click(function () {
            layer.open({
                type: 1,
                title: "我的信息",
                skin: "myclass",
                area: ["50%"],
                anim: 2,
                content: $("#findmyinfo").html()
            });
            $("#findmyinforecpt")[0].reset();
            form.on('submit(userInfoformDemo)', function (data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param = data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '${pageContext.request.contextPath}/updateUserInfo',
                    type: "post",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success: function () {
                        layer.msg('更新成功', {icon: 1, time: 3000});
                        /*setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/toHomePageView';
                        }, 2000);*/

                    },
                    error: function () {
                        layer.msg('更新失败', {icon: 0, time: 3000});
                        /*setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/toHomePageView';
                        }, 2000);*/
                    }
                });
            });
        });

        /*管理员我的信息弹出框*/
        $("#adminInfo").click(function () {
            layer.open({
                type: 1,
                title: "我的信息",
                skin: "myclass",
                area: ["25%"],
                anim: 2,
                content: $("#findAdminInfo").html()
            });
            $("#findAdminInfoRecpt")[0].reset();
            form.on('submit(userInfoformDemo)', function (data) {
                // layer.msg('aaa',{icon:1,time:3000});
                var param = data.field;
                // console.log(JSON.stringify(param));
                $.ajax({
                    url: '${pageContext.request.contextPath}/updateAdminById',
                    type: "post",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success: function () {
                        layer.msg('更新成功', {icon: 1, time: 3000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/toHomePageView';
                        }, 2000);

                    },
                    error: function () {
                        layer.msg('更新失败', {icon: 0, time: 3000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath}/toHomePageView';
                        }, 2000);
                    }
                });
            });
        });

    });


    $(document).ready(function () {
        setInterval(function () {
            const now = (new Date()).toLocaleString();
            $('#current-time').text(now);
        }, 10);
    })

</script>
</body>
</html>
