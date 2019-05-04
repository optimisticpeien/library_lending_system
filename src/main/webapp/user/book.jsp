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
                    <li><a href="borrowedBooks">已借书籍</a></li>
                    <li><a href="renew">续借</a></li>
                    <li class="active"><a href="books">图书</a></li>
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
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="user">个人信息</a></li>
                            <li><a href="password">修改密码</a></li>
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
            <div class="panel-heading">图书信息</div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <div class="form" id="form">
                        <div class="input-group book">
                            <div class="input-group-addon">图书编号</div>
                            <p class="form-control">${requestScope.book.ISBN}</p>
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&emsp;书名&emsp;</div>
                            <p class="form-control">${requestScope.book.name}</p>
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&emsp;作者&emsp;</div>
                            <p class="form-control">${requestScope.book.author}</p>
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&ensp;出版社&ensp;</div>
                            <p class="form-control">${requestScope.book.press}</p>
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&emsp;类别&emsp;</div>
                            <p class="form-control">${requestScope.book.type}</p>
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon">能否借阅</div>
                            <p class="form-control">${requestScope.book.borrow?"可借阅":"不可借阅"}</p>
                        </div>
                        <br>
                        <label>内容简介</label>
                        <textarea class="form-control" id="introduction" readonly="readonly" placeholder="内容简介"
                                  rows="5">${requestScope.book.introduction}</textarea>
                        <br class="bookbr">
                    </div>
                    <div class="form-group text-center">
                        <div class="btn-group" role="group">
                            <a id="确定" class="btn btn-success" href="books">确定</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
