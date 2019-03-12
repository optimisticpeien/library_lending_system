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
                    <li><a href="../adminBorrow">借书</a></li>
                    <li><a href="../adminReturn">还书续借</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">图书管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../book/select">查询图书</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../book/add">增加图书</a></li>
                            <li><a href="../book/change">变更图书</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">人员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="select">学生查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="add">增加学生</a></li>
                            <li><a href="change">变更学生</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../teacher/select">教师查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../teacher/add">增加教师</a></li>
                            <li><a href="../teacher/change">变更教师</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">记录<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../log/overdue">超期信息</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../log/log">借阅日志</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../admin">个人信息</a></li>
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
    <div class="col-xs-12 col-sm-8 col-md-6 col-lg-6 col-sm-offset-2 col-md-offset-3 col-lg-offset-3 animated fadeInUp">
        <div class="panel panel-info">
            <!-- Default panel contents -->
            <div class="panel-heading">添加学生</div>
            <div class="panel-body">
                <form action="" method="post">
                    <div class="input-group">
                        <div class="input-group-addon">学号</div>
                        <input type="text" id="id" class="form-control" placeholder="学号"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon">姓名</div>
                        <input type="text" id="name" class="form-control" placeholder="姓名"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon">密码</div>
                        <input type="password" id="password" class="form-control" placeholder="密码"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon">密码</div>
                        <input type="password" id="pwdagain" class="form-control" placeholder="再次输入密码"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon">性别</div>
                        <div class="form-control">
                            <div class="row">
                                <label class="col-xs-5 col-sm-5 col-md-5 col-lg-5 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                    <input type="radio" name="sex" value="0" checked>男
                                </label>
                                <label class="col-xs-5 col-sm-5 col-md-5 col-lg-5 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                    <input type="radio" name="sex" value="1">女
                                </label>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon">系别</div>
                        <input type="text" id="department" class="form-control" placeholder="系别"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon">班级</div>
                        <input type="text" id="grade" class="form-control" placeholder="班级"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="form-group text-center">
                        <div class="btn-group" role="group">
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
<script>
    $(document).ready(function () {
        $("#tijiao").click(function () {
            const id = $("#id").val();
            const name = $("#name").val();
            const password = $("#password").val();
            const pwdagain = $("#pwdagain").val();
            const sex = $("input[name='sex']:checked").val() == 1;
            const department = $("#department").val();
            const grade = $("#grade").val();
            if (password == pwdagain) {
                $.post(
                    "addStudent",
                    {
                        "ID": id,
                        "name": name,
                        "password": password,
                        "sex": sex,
                        "department": department,
                        "grade": grade
                    },
                    function (modal) {
                        $("#modalLabel").html(modal.modalTitle);
                        $("#modalBody").html(modal.modalPoint);
                        $('#modal').modal({backdrop: "static"});
                    }
                );
            } else {
                $("#modalLabel").html("错误！");
                $("#modalBody").html("两次输入的密码不一致！");
                $('#modal').modal({backdrop: "static"});
            }
        });
    });
</script>
</body>
</html>
