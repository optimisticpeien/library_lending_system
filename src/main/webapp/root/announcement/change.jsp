<%--
  User: CZC
  Date: 2019/2/1
  Time: 15:39
--%>
<%@ page import="entity.Announcement" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>图书馆借阅系统</title>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/animate.css/3.5.2/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<div class="container">
    <!--导航条-->
    <nav class="navbar navbar-default navbar-fixed-top animated fadeInDown">
        <div class="container">
            <!-- 导航条展开按钮 -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!--项目名-->
                <a class="navbar-brand" href="#">图书馆借阅系统</a>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">公告<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="select">公告记录</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="add">增加公告</a></li>
                            <li class="active"><a href="change">变更公告</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">管理员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="../admin/select">查询管理员</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../admin/add">增加管理员</a></li>
                            <li><a href="../admin/change">变更管理员</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="../root">个人信息</a></li>
                            <li><a href="../password">修改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="" data-toggle="modal" data-target="#myModal">关于</a></li>
                            <li><a href="exit">退出</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">欢迎使用！</h4>
                </div>
                <div class="modal-body text-center">
                    制作者：<br>
                    河北工业大学<br>
                    计算机电子系<br>
                    计S171<br>
                    175858<br>
                    陈子超<br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-md-offset-1 col-lg-offset-2 animated fadeInUp">
        <div class="panel panel-success">
            <div class="panel-heading">修改公告</div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <div class="input-group">
                        <div class="input-group-addon">标题</div>
                        <input type="text" class="form-control" id="title" placeholder="标题"
                               value="${requestScope.announcement.title}" aria-describedby="basic-addon1">
                        <span class="input-group-btn">
                            <button class="btn btn-default" id="inquiry" type="button">查找</button>
                        </span>
                    </div>
                    <br>
                    <textarea class="form-control" id="content"
                              rows="10">${requestScope.announcement.content}</textarea>
                    <br>
                    <div class="checkbox text-center">
                        <label>公告可见性：</label>
                        <%
                            String[] checkeds = new String[3];
                            if (request.getAttribute("announcement") != null) {
                                Announcement announcement = (Announcement) request.getAttribute("announcement");
                                byte visibility = announcement.getVisibility();
                                if (visibility >= 4) {
                                    checkeds[0] = "checked";
                                    visibility -= 4;
                                } else {
                                    checkeds[0] = "";
                                }
                                if (visibility >= 2) {
                                    checkeds[1] = "checked";
                                    visibility -= 2;
                                } else {
                                    checkeds[1] = "";
                                }
                                if (visibility >= 1) {
                                    checkeds[2] = "checked";
                                } else {
                                    checkeds[2] = "";
                                }
                            }
                        %>
                        <label>
                            <input type="checkbox" name="visibility" <%=checkeds[0]%> value="4">管理员
                        </label>
                        <label>
                            <input type="checkbox" name="visibility" <%=checkeds[1]%> value="2">教师
                        </label>
                        <label>
                            <input type="checkbox" name="visibility" <%=checkeds[2]%> value="1">学生
                        </label>
                    </div>
                    <br>
                    <div class="form-group text-center">
                        <div class="btn-group" role="group">
                            <button type="button" id="delete" class="btn btn-danger">删除</button>
                            <p class="btn"></p>
                            <button type="reset" class="btn btn-warning">重置</button>
                            <p class="btn"></p>
                            <button type="button" id="tijiao" class="btn btn-success">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-sm" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modalLabel"></h4>
            </div>
            <div class="modal-body" id="modalBody">
            </div>
            <div class="modal-footer">
                <button type="button" id="modalOK" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-sm" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="deleteLabel">删除确认</h4>
            </div>
            <div class="modal-body" id="deleteBody">
                确认要删除此公告？
            </div>
            <div class="modal-footer">
                <button type="button" id="deleteCancel" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="deleteOK" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#inquiry").click(function () {
            const title = $("#title").val();
            if (title == "") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("标题不能为空！");
                $('#modal').modal({backdrop: "static"});
                return;
            }
            $.post(
                "changeAnnouncement/select",
                {"title": title},
                function (back) {
                    if (back.modalTitle == "错误") {
                        $("#modalLabel").html("错误");
                        $("#modalBody").html(back.modalPoint);
                        $('#modal').modal({backdrop: "static"});
                        return;
                    }
                    $("#content").val(back.content);
                    let visibility = parseInt(back.visibility);
                    if (visibility - 4 >= 0) {
                        visibility -= 4;
                        $(":checkbox[value=4]").prop("checked", true);
                    } else {
                        $(":checkbox[value=4]").prop("checked", false);
                    }
                    if (visibility - 2 >= 0) {
                        visibility -= 2;
                        $(":checkbox[value=2]").prop("checked", true);
                    } else {
                        $(":checkbox[value=2]").prop("checked", false);
                    }
                    if (visibility - 1 >= 0) {
                        $(":checkbox[value=1]").prop("checked", true);
                    } else {
                        $(":checkbox[value=1]").prop("checked", false);
                    }
                }
            );
        });
        $("#tijiao").click(function () {
            const title = $("#title").val();
            const content = $("#content").val();
            let visibility = 0;
            if (title == "" || content == "") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("标题或内容不能为空！");
                $('#modal').modal({backdrop: "static"});
                return;
            }
            $("input[type='checkbox']").each(function () {
                if ($(this).is(':checked') == true) {
                    visibility += parseInt($(this).attr("value"));
                }
            });
            $.post(
                "changeAnnouncement",
                {"title": title, "visibility": visibility, "content": content},
                function (modal) {
                    $("#modalLabel").html(modal.modalTitle);
                    $("#modalBody").html(modal.modalPoint);
                    $('#modal').modal({backdrop: "static"});
                }
            );
        });
        $("#deleteCancel").click(function () {
            $("#deleteModal").modal('hide');
        });
        $("#deleteOK").click(function () {
            const title = $("#title").val();
            $.post(
                "deleteAnnouncement",
                {"title": title},
                function (modal) {
                    $("#deleteModal").modal('hide');
                    $("#modalLabel").html(modal.modalTitle);
                    $("#modalBody").html(modal.modalPoint);
                    $('#modal').modal({backdrop: "static"});
                }
            );
        });
        $("#delete").click(function () {
            const title = $("#title").val();
            if (title == "") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("请输入要删除的公告标题！");
                $('#modal').modal({backdrop: "static"});
                return;
            }
            $('#deleteModal').modal({backdrop: "static"});
        });
    });
</script>
</body>
</html>
