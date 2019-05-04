<%--
  User: CZC
  Date: 2019/2/1
  Time: 15:39
--%>
<%@ page import="entity.Book" %>
<%@ page import="entity.BorrowingBookInformation" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
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
                    <li><a href="${pageContext.request.contextPath}/user/borrowedBooks">已借书籍</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/renew">续借</a></li>
                    <li><a href="${pageContext.request.contextPath}/user/books">图书</a></li>
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
                            <li class="active"><a href="#">个人信息</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/password">修改密码</a></li>
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
        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3">
            <div class="panel panel-info animated  flipInY">
                <div class="panel-heading">个人信息</div>
                <ul class="panel-body list-group">
                    <li class="list-group-item">${(sessionScope.identity=="student"?"学号:":"工号:").concat(sessionScope.user.ID)}</li>
                    <li class="list-group-item">${"姓名：".concat(sessionScope.user.name)}</li>
                    <li class="list-group-item">${"性别：".concat(sessionScope.user.sex?"女":"男")}</li>
                    <li class="list-group-item">${"系别：".concat(sessionScope.user.department)}</li>
                    ${sessionScope.identity=="student"?"<li class=\"list-group-item\">班级：".concat(sessionScope.user.grade.concat("</li>")):""}
                    <li class="list-group-item">${"剩余可借本数：".concat(sessionScope.user.bookNumber)}</li>
                </ul>
            </div>
        </div>
        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 animated  flipInY">
                    <div class="panel panel-success">
                        <div class="panel-heading">已借书籍</div>
                        <table class="table table-condensed">
                            <tr>
                                <th>书名</th>
                                <th>到期时间</th>
                            </tr>
                            <%

                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日");
                                List<BorrowingBookInformation> borrowedBooks = (List<BorrowingBookInformation>) session.getAttribute("borrowedBooks");
                                int m;
                                if (borrowedBooks == null) {
                                    m = 0;
                                } else
                                    m = borrowedBooks.size() < 5 ? borrowedBooks.size() : 5;
                                if (m == 0) {
                            %>
                            <tr>
                                <td>
                                    无
                                </td>
                                <td>
                                    无
                                </td>
                            </tr>
                            <%
                                }
                                for (int i = 0; i < m; i++) {
                            %>
                            <tr>
                                <td>
                                    <%=borrowedBooks.get(i).getName() %>
                                </td>
                                <td>
                                    <%=dateFormat.format(borrowedBooks.get(i).getReturnDate())%>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                        <div class="panel-footer"><a href="${pageContext.request.contextPath}/user/borrowedBooks">详情</a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 animated  flipInY">
                    <div class="panel panel-danger">
                        <div class="panel-heading">新增书籍</div>
                        <table class="table table-condensed">
                            <tr>
                                <th>书名</th>
                                <th>类别</th>
                            </tr>
                            <%
                                List<Book> books = (List<Book>) session.getAttribute("books");
                                int n;
                                if (books == null) {
                                    n = 0;
                                } else
                                    n = books.size() < 5 ? books.size() : 5;
                                if (n == 0) {
                            %>
                            <tr>
                                <td>
                                    无
                                </td>
                                <td>
                                    无
                                </td>
                            </tr>
                            <%
                                }
                                for (int i = 0; i < n; i++) {
                            %>
                            <tr>
                                <td>
                                    <%=books.get(i).getName() %>
                                </td>
                                <td>
                                    <%=books.get(i).getType() %>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                        <div class="panel-footer"><a href="${pageContext.request.contextPath}/user/books">更多</a>
                        </div>
                    </div>
                </div>
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
