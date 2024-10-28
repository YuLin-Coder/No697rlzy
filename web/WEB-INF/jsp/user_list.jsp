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
        <a href="/findUser">员工信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/findUser" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/findUser" >
            <input class="layui-input" placeholder="请输入员工名称" name="realname" id="realname">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <a class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" id="test2" onclick="daoChu()" lay-submit=""><i class="layui-icon">&#xe67c;</i>导出</a>
        <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
    </xblock>
    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>登录密码</th>
            <th>性别</th>
            <th>出生日期</th>
            <th>雇佣日期</th>
            <th>邮箱</th>
            <th>住址</th>
            <th>籍贯</th>
            <th>手机号</th>
            <th>所属部门</th>
            <th>岗位职责</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="user">
            <tr>
                <td>${user.eno}</td>
                <td>${user.realname}</td>
                <td>${user.pwd}</td>
                <td>${user.sex}</td>
                <td>${user.birthday}</td>
                <td>${user.hiredate}</td>
                <td>${user.email}</td>
                <td>${user.address}</td>
                <td>${user.jg}</td>
                <td>${user.phone}</td>
                <td>${user.deptname}</td>
                <td>${user.gwzz}</td>
                <td>
                    <a title="编辑"    id= "updateEdit"    href="${pageContext.request.contextPath }/toUpdateUserView?id=${user.id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${user.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

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
    /*删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("${pageContext.request.contextPath }/deleteUserByid",{"id":id},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findUser';},2000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='${pageContext.request.contextPath }/findUser';},2000);
                }
            });
        });
    }

    var list2 = [];
    function exportCsv(obj) {
        console.log(obj)
        var list = '';
        console.log($('input[name="path"]'));
        console.log($('input:radio[name="path"]:checked').val())
        var path_str = $('input:radio[name="path"]:checked').val();

        $.ajax({
            type: "post",
            dataType: 'text',
            url: '${pageContext.request.contextPath }/exportUserList',
            async: false,
            //cache: false,
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                list2.splice(0,list2.length);
                console.log("list2上"+list2)
                list = JSON.parse(result);
                $.each(list[0],function(key,value){
                    if (key=='d_id'){
                        delete list[key];
                    }
                    list2.push(key)
                })
                console.log("list2"+list2)
            }
        });
        //var title = list2;
        var titleForKey = list2;
        var data = list;
        var str = [];
        str.push(obj.title.join(",") + "\n");
        for(var i = 0; i < data.length; i++) {
            var temp = [];
            for(var j = 0; j < titleForKey.length; j++) {
                temp.push(data[i][titleForKey[j]]);
            }
            str.push(temp.join(",") + "\n");
        }
        var uri = 'data:text/csv;charset=utf-8,' + encodeURIComponent(str.join(""));
        var downloadLink = document.createElement("a");
        downloadLink.href = uri;
        downloadLink.download = "export.csv";
        document.body.appendChild(downloadLink);
        downloadLink.click();
        document.body.removeChild(downloadLink);
    }

    function daoChu() {
        document.getElementById("test2").onclick = function() {
            exportCsv({
                title: ["ID","员工编号","员工姓名","登录密码","性别","出生日期","雇佣日期","邮箱","住址","籍贯","手机号","所属部门ID","岗位职责","所属部门",],
                titleForKey: list2,
            });
        }
    }

</script>
</body>
</html>
