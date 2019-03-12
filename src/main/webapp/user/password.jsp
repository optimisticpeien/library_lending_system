<%--
  User: CZC
  Date: 2019/1/31
  Time: 21:53
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
                    <li><a href="borrowedBooks">已借书籍</a></li>
                    <li><a href="renew">续借</a></li>
                    <li><a href="books">图书</a></li>
                </ul>
                <form action="book" class="navbar-form navbar-left">
                    <div class="input-group">
                        <input type="text" class="form-control" name="ISBN" placeholder="ISBN号">
                        <span class="input-group-btn">
                            <button type="submit" class="btn btn-default">查找</button>
                        </span>
                    </div>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="user">个人信息</a></li>
                            <li class="active"><a href="#">修改密码</a></li>
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
                <h3 class="panel-title">修改密码</h3>
            </div>
            <div class="panel-body">
                <form action="changePassword" method="post">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                        <p class="form-control" aria-describedby="basic-addon1">${sessionScope.user.ID}</p>
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                        <input type="text" name="oldpwd" id="oldpwd" onblur="validate()" class="form-control"
                               placeholder="原密码" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                        <input type="password" name="newpwd" id="newpwd" class="form-control" placeholder="新密码"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                        <input type="password" name="pwdagain" onkeyup="validate()" onkeydown="validate()"
                               onblur="validate()" id="pwdagain" class="form-control" placeholder="再次输入密码"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <p id="tishi" class="text-center"></p>
                    <button type="submit" onclick=" return validate()" id="queding" class="btn btn-success btn-block">
                        确定
                    </button>
                    <button type="reset" class="btn btn-success btn-block">重置</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function validate() {
        const oldpwd = $("#oldpwd").val();
        const newpwd = $("#newpwd").val();
        const pwdagain = $("#pwdagain").val();
        if (oldpwd == "") {
            $("#tishi").html("未填写原密码");
            $("#queding").attr("disabled", "disabled");
        } else if (newpwd == "") {
            $("#tishi").html("新密码为空");
            $("#queding").attr("disabled", "disabled");
        } else if (newpwd != pwdagain) {
            $("#tishi").html("两次密码不相同");
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
