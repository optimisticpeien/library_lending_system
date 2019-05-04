<%--
  User: CZC
  Date: 2019/2/1
  Time: 15:39
--%>
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
                            <li><a href="../announcement/select">公告记录</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="add">增加公告</a></li>
                            <li><a href="../announcement/change">变更公告</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">管理员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="select">查询管理员</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="add">增加管理员</a></li>
                            <li class="active"><a href="#">变更管理员</a></li>
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

    <div class="col-xs-12 col-sm-8 col-md-6 col-lg-4 col-sm-offset-2 col-md-offset-3  col-lg-offset-4 animated fadeInUp login">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">修改管理员</h3>
            </div>
            <div class="panel-body">
                <form action="" method="post">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                        <input type="text" class="form-control" id="ID" placeholder="管理员号"
                               value="${requestScope.admin.ID}" aria-describedby="basic-addon1">
                        <span class="input-group-btn">
                            <button class="btn btn-default" id="inquiry" type="button">查找</button>
                        </span>
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                        <input type="text" class="form-control" id="name" onblur="validate()" placeholder="管理员名"
                               value="${requestScope.admin.name}" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                        <input type="password" class="form-control" id="password" onkeydown="validate()"
                               placeholder="新密码" value="${requestScope.admin.password}" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                        <input type="password" class="form-control" id="pwdagain" onkeyup="validate()"
                               onkeydown="validate()" onblur="validate()" value="${requestScope.admin.password}"
                               placeholder="再次输入密码"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <p id="tishi" class="text-center"></p>
                    <button type="button" id="queding" class="btn btn-success btn-block">确定</button>
                    <button type="button" id="delete" class="btn btn-success btn-block">删除</button>
                    <button type="reset" class="btn btn-success btn-block">重置</button>
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
                确认要删除此管理员？
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
            const ID = $("#ID").val();
            if (ID == "") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("管理员号不能为空！");
                $('#modal').modal({backdrop: "static"});
                return;
            }
            if (ID == "root") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("禁止修改超级管理员！");
                $('#modal').modal({backdrop: "static"});
                return;
            }
            $.post(
                "changeAdmin/select",
                {"ID": ID},
                function (back) {
                    if (back.modalTitle == "错误") {
                        $("#modalLabel").html("错误");
                        $("#modalBody").html(back.modalPoint);
                        $('#modal').modal({backdrop: "static"});
                        return;
                    }
                    $("#name").val(back.name);
                    $("#password").val(back.password);
                }
            );
        });
        $("#queding").click(function () {
            if (validate() == false)
                return;
            const ID = $("#ID").val();
            const name = $("#name").val();
            const password = $("#password").val();
            const pwdagain = $("#pwdagain").val();
            $.post(
                "changeAdmin",
                {"ID": ID, "name": name, "password": password, "pwdagain": pwdagain},
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
            const ID = $("#ID").val();
            $.post(
                "deleteAdmin",
                {"ID": ID},
                function (modal) {
                    $("#deleteModal").modal('hide');
                    $("#modalLabel").html(modal.modalTitle);
                    $("#modalBody").html(modal.modalPoint);
                    $('#modal').modal({backdrop: "static"});
                }
            );
        });
        $("#delete").click(function () {
            const ID = $("#ID").val();
            if (ID == "") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("管理员号不能为空！");
                $('#modal').modal({backdrop: "static"});
                return;
            } else if (ID == "root") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("禁止删除超级管理员！");
                $('#modal').modal({backdrop: "static"});
                return;
            }
            $('#deleteModal').modal({backdrop: "static"});
        });
    });

    function validate() {
        const ID = $("#ID").val();
        const name = $("#name").val();
        const password = $("#password").val();
        const pwdagain = $("#pwdagain").val();
        if (ID == "") {
            $("#tishi").html("未填写管理员号");
            $("#queding").attr("disabled", "disabled");
        } else if (name == "") {
            $("#tishi").html("管理员名为空");
            $("#queding").attr("disabled", "disabled");
        } else if (password == "") {
            $("#tishi").html("密码为空");
            $("#queding").attr("disabled", "disabled");
        } else if (password != pwdagain) {
            $("#tishi").html("两次密码输入不一致");
            $("#queding").attr("disabled", "disabled");
        } else {
            $("#tishi").html("");
            $("#queding").removeAttr("disabled");
            return true;
        }
        return false;
    }
</script>
</body>
</html>
