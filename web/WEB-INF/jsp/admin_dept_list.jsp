<%--
  Created by IntelliJ IDEA.
  User: ywj
  Date: 2018/10/31
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.rlzy.po.Dept" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>


    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" sizes="32x32"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.3.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="${pageContext.request.contextPath}/layui_exts/excel.js"></script>

    <style type="text/css">
        .layui-table {
            text-align: center;
        }

        .layui-table th {
            text-align: center;
        }
    </style>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findDept">部门信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="${pageContext.request.contextPath}/adminFindDept" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<xblock>
    <button id="addStudnetBtn" class="layui-btn layui-btn-normal"><i class="layui-icon">&#xe654;</i>添加</button>
    <button class="layui-btn layui-btn-warm" lay-filter="toolbarDemo" id="test2" onclick='daoChu()' lay-submit=""><i class="layui-icon">&#xe67c;</i>导出
    </button>
    <span class="x-right" style="line-height:40px">共有数据：${pi.totalCount} 条</span>
</xblock>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="${pageContext.request.contextPath }/adminFindDept">
            <input class="layui-input" placeholder="请输入部门名称" name="dname" id="dname">
            <input class="layui-input" type="hidden" name="pageIndex" value="1">
            <button class="layui-btn" lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <%--表格数据--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>部门名称</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${pi.list}" var="dept">
            <tr>
                <td>${dept.id}</td>
                <td><a href="${pageContext.request.contextPath}/FindUserByDept?Did=${dept.id}">${dept.dname}</a></td>
                <td>
                    <a title="编辑"    id="updateEdit"    href="${pageContext.request.contextPath}/toUpdateDeptView?id=${dept.id}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${dept.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="">
        <input type="hidden" id="totalPageCount" value="${pi.pageTotalCount}"/>
        <c:import url="pageBtn.jsp">
            <c:param name="totalCount" value="${pi.totalCount}"/>
            <c:param name="currentPageNo" value="${pi.pageIndex}"/>
            <c:param name="totalPageCount" value="${pi.pageTotalCount}"/>
        </c:import>
    </div>
</div>
<%--添加模态框--%>
<div class="layui-row" id="test" style="display: none">
    <div class="layui-col-md10">
        <form class="layui-form" id="addEmployeeForm">
            <div class="layui-form-item">
                <label class="layui-form-label">部门名称：</label>
                <div class="layui-input-block">
                    <input type="text" name="dname" class="layui-input" placeholder="请输入部门名称">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">确认添加
                    </button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
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
                title: "添加部门",
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
                    url: '${pageContext.request.contextPath }/addDept',
                    type: "post",
                    data: JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success: function () {
                        layer.msg('添加成功', {icon: 1, time: 3000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath }/adminFindDept';
                        }, 2000);

                    },
                    error: function () {
                        layer.msg('添加失败', {icon: 0, time: 3000});
                        setTimeout(function () {
                            window.location.href = '${pageContext.request.contextPath }/adminFindDept';
                        }, 2000);
                    }
                });
                // return false;
            });
        });
    });


    /*删除*/
    function member_del(obj, dept_id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $.get("${pageContext.request.contextPath }/deleteDept", {"dept_id": dept_id}, function (data) {
                if (data = true) {
                    layer.msg('删除成功!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath }/adminFindDept';
                    }, 2000);

                } else {
                    layer.msg('删除失败!', {icon: 1, time: 2000});
                    setTimeout(function () {
                        window.location.href = '${pageContext.request.contextPath }/adminFindDept';
                    }, 2000);
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
            type: "get",
            dataType: 'text',
            url: '${pageContext.request.contextPath }/daoChuDept',
            async: false,
            //cache: false,
            contentType: "application/json; charset=utf-8",
            success: function(result) {
                list2.splice(0,list2.length);
                console.log("list2上"+list2)
                list = JSON.parse(result);
                $.each(list[0],function(key,value){
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
                title: ["ID","部门名称"],
                titleForKey: list2,
            });
        }
    }

</script>
</body>
</html>
