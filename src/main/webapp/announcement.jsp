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
                    <li class="active"><a href="#">公告</a></li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="书名或ISBN号">
                    </div>
                    <button type="submit" class="btn btn-default">查找</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="" data-toggle="modal" data-target="#myModal">关于</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-md-offset-1 col-lg-offset-2 animated fadeInUp">
        <div class="panel panel-success">
            <div class="panel-heading" id="annTitle">${requestScope.announcement.title}</div>
            <div class="panel-body">
                <textarea class="form-control" id="annText" readonly="readonly"
                          rows="20">${requestScope.announcement.content}</textarea>
                <br>
                <div class="form-group text-center">
                    <div class="btn-group" role="group">
                        <button type="button" id="before" class="btn btn-info">上一页</button>
                        <p class="btn"></p>
                        <a href="begin" class="btn btn-danger">确定</a>
                        <p class="btn"></p>
                        <button type="button" id="next" class="btn btn-info">下一页</button>
                    </div>
                </div>
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
<script>
    pageMax =${requestScope.announcementNumber};
    page = 0;
    $(document).ready(function () {
        $("#before").click(function () {
            if (page != 0) {
                page--;
                $.post("announcementPage", {page: page}, function (announcement) {
                    $("#annTitle").html(announcement.title);
                    $("#annText").html(announcement.content);
                });
            }
        });
        $("#next").click(function () {
            if (page != pageMax - 1) {
                page++;
                $.post("announcementPage", {page: page}, function (announcement) {
                    $("#annTitle").html(announcement.title);
                    $("#annText").html(announcement.content);
                });
            }
        });
    });
</script>
</body>
</html>
