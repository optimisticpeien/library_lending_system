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
                    <li><a href="${pageContext.request.contextPath}/admin/adminBorrow">借书</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/adminReturn">还书续借</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">图书管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/admin/book/select">查询图书</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/admin/book/add">增加图书</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/book/change">变更图书</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">人员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/admin/student/select">学生查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/admin/student/add">增加学生</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/student/change">变更学生</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/admin/teacher/select">教师查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/admin/teacher/add">增加教师</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/teacher/change">变更教师</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">记录<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/admin/log/overdue">超期信息</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="${pageContext.request.contextPath}/admin/log/log">借阅日志</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/password">修改密码</a></li>
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

    <div class="jumbotron animated fadeInDown">
        <h2 id="screenTitle">加载中……</h2>
        <p id="screenBody">加载中……</p>
        <p><a class="btn btn-primary" id="more" href="announcement" role="button">了解更多</a></p>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <div class="panel panel-info animated fadeInUp">
                <div class="panel-heading">个人信息</div>
                <ul class="panel-body list-group">
                    <li class="list-group-item">${"工号:".concat(sessionScope.user.ID)}</li>
                    <li class="list-group-item">${"姓名:".concat(sessionScope.user.name)}</li>
                    <li class="list-group-item">${"最后登陆:".concat(sessionScope.lastDate)}</li>
                </ul>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <div class="panel panel-info animated fadeInUp">
                <div class="panel-heading">人员信息</div>
                <ul class="panel-body list-group">
                    <li class="list-group-item">管理员人数：${sessionScope.adminNumber}</li>
                    <li class="list-group-item">教师人数：${sessionScope.teacherNumber}</li>
                    <li class="list-group-item">学生人数：${sessionScope.studentNumber}</li>
                </ul>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
            <div class="panel panel-info animated fadeInUp">
                <div class="panel-heading">服务器信息</div>
                <ul class="panel-body list-group">
                    <li class="list-group-item">服务器：<%=application.getServerInfo()%>
                    </li>
                    <li class="list-group-item">在线人数：<%=session.getAttribute("userNumber")%>
                    </li>
                    <li class="list-group-item">网站访问量：<%=session.getAttribute("sum")%>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $.post(
            "${pageContext.request.contextPath}/announcementPage",
            {page: 0},
            function (announcement) {
                $("#screenTitle").html(announcement.title);
                $("#screenBody").html(announcement.content.substring(0, 100) + "……");
                $("#more").attr("href", "${pageContext.request.contextPath}/announcement?title=" + announcement.title);
            }
        );
    })
</script>
</body>
</html>
