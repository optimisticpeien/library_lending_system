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
                    <li class="active"><a href="./">登录</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="" data-toggle="modal" data-target="#myModal">关于</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="col-xs-12 col-sm-8 col-md-6 col-lg-4 col-sm-offset-2 col-md-offset-3  col-lg-offset-4 animated zoomIn login">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">欢迎使用！</h3>
            </div>
            <div class="panel-body">
                <form action="main" method="post">
                    <div class="input-group">
                        <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                        <input type="text" name="ID" class="form-control" placeholder="账号"
                               aria-describedby="basic-addon1">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false"><span id="shenfen">学生</span><span
                                    class="caret"></span></button>
                            <ul class="dropdown-menu dropdown-menu-right animated flipInX">
                                <li><a href="javascript:void(0);" onclick="xuesheng()">学生</a></li>
                                <li><a href="javascript:void(0);" onclick="jiaoshi()">教师</a></li>
                                <li><a href="javascript:void(0);" onclick="guanliyuan()">管理员</a></li>
                            </ul>
                        </div>
                        <!-- /btn-group -->
                        <%--                        <div class="input-group-btn">--%>
                        <%--                            <select name="identity" class="btn btn-default" id="logintitle1">--%>
                        <%--                                <option value="student">学生</option>--%>
                        <%--                                <option value="teacher">教师</option>--%>
                        <%--                                <option value="admin">管理员</option>--%>
                        <%--                            </select>--%>
                        <%--                        </div>--%>
                    </div>
                    <input type="hidden" name="identity" value="student"/>
                    <br>
                    <div class="input-group">
                        <div class="input-group-addon" id="logintitle2"><i class="glyphicon glyphicon-lock"></i></div>
                        <input type="password" name="password" class="form-control" placeholder="密码"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success btn-block" id="login">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
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
</body>
<script>
    function xuesheng() {
        $("input[name='identity']").attr("value", "student");
        $("#shenfen").text("学生");
    }

    function jiaoshi() {
        $("input[name='identity']").attr("value", "teacher");
        $("#shenfen").text("教师");
    }

    function guanliyuan() {
        $("input[name='identity']").attr("value", "admin");
        $("#shenfen").text("管理员");
    }
</script>
</html>
