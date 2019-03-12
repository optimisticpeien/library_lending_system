<%--
  User: CZC
  Date: 2019/2/1
  Time: 15:39
--%>
<%@ page import="bean.BorrowingBookInformation" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
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
                    <li class="active"><a href="#">已借书籍</a></li>
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

    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 animated fadeInLeft">
            <div class="panel panel-info animated fadeInLeft">
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
        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 animated fadeInRight">
            <div class="panel panel-success">
                <div class="panel-heading">已借图书</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <th>ISBN</th>
                            <th>书名</th>
                            <th>借书日期</th>
                            <th>到期日期</th>
                            <th></th>
                        </tr>
                        <%
                            List<BorrowingBookInformation> borrowedBooks = (List<BorrowingBookInformation>) session.getAttribute("borrowedBooks");
                            int m = borrowedBooks.size() < 5 ? borrowedBooks.size() : 5;
                            if (m == 0) {
                        %>
                        <tr>
                            <td>无</td>
                            <td>无</td>
                            <td>无</td>
                            <td>无</td>
                            <td></td>
                        </tr>

                        <%
                            }
                            for (int i = 0; i < m; i++) {
                                Calendar returnDate = Calendar.getInstance();
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日");
                                returnDate.setTime(borrowedBooks.get(i).getReturnDate());
                                Calendar after7days = Calendar.getInstance();
                                after7days.add(Calendar.DATE, 7);
                                String a = null;
                                if (after7days.compareTo(returnDate) > 0) {
                                    a = "<a href=\"renew?renew=" + borrowedBooks.get(i).getISBN() + "\">续借</a>";
                                }
                        %>
                        <tr>
                            <td><%=borrowedBooks.get(i).getISBN()%>
                            </td>
                            <td><%=borrowedBooks.get(i).getName()%>
                            </td>
                            <td><%=dateFormat.format(borrowedBooks.get(i).getBorrowingDate())%>
                            </td>
                            <td><%=dateFormat.format(borrowedBooks.get(i).getReturnDate())%>
                            </td>
                            <td><%=a != null ? a : ""%>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 animated fadeInRight">
            <div class="panel panel-success">
                <div class="panel-heading">借阅记录</div>
                <div class="panel-body">
                    <p id="logNum"></p>
                </div>
                <table class="table table-condensed" id="logTable">
                    <tbody>
                    <tr class="borrowing">
                        <th>图书编号</th>
                        <td colspan="3">图书编号</td>
                    </tr>
                    <tr class="borrowing">
                        <th>书名</th>
                        <td colspan="3">书名</td>
                    </tr>
                    <tr class="borrowing">
                        <th>借阅时间</th>
                        <th></th>
                        <td>还书时间</td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
                <nav aria-label="Page navigation" class="text-center">
                    <ul class="pagination" id="pagination">
                        <li id="previous">
                            <a href="javascript:void(0);" onclick="pageJmp(-1)" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li id="next">
                            <a href="javascript:void(0);" onclick="pageJmp(-2)" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<script>
    const limit = 8;          //分页大小
    let page = 1;           //当前页
    let logNumber = 0;    //数据条数
    let pageNumber = 0;     //总页数
    const pageLong = 5;       //分页栏长度-1
    let firstPage = 1;      //当前分页页首
    let lastPage = 6;       //当前分页页尾
    $(document).ready(function () {
        pageJmp(1);
    });

    function pageJmp(p) {
        if (p == -1) {
            if (page != 1)
                page--;
        } else if (p == -2) {
            if (page != pageNumber)
                page++;
        } else
            page = p - 0;
        $.post(
            "borrowingLog",
            {"page": page, "limit": limit},
            function (map) {
                logNumber = map.borrowingNumber;
                pageNumber = map.pageNumber;
                lastPage = firstPage + pageLong > pageNumber ? pageNumber : firstPage + pageLong;
                $("#logNum").html("共" + logNumber + "条借阅记录");
                $("#logTable").empty();
                const long = logNumber - (page - 1) * limit > limit ? limit : logNumber - (page - 1) * limit;
                for (let i = 0; i < long; i++) {
                    $("#logTable").append("<tbody>\n" +
                        "                    <tr class=\"borrowing info\">\n" +
                        "                        <th>图书编号</th>\n" +
                        "                        <td colspan=\"3\">" + map.borrowing[i].isbn + "</td>\n" +
                        "                    </tr>\n" +
                        "                    <tr class=\"borrowing\">\n" +
                        "                        <th>书名</th>\n" +
                        "                        <td colspan=\"3\">" + map.borrowing[i].name + "</td>\n" +
                        "                    </tr>\n" +
                        "                    <tr class=\"borrowing\">\n" +
                        "                        <th>借阅时间</th>\n" +
                        "                        <td>" + map.borrowing[i].borrowingDate + "</td>\n" +
                        "                        <th>还书时间</th>\n" +
                        "                        <td>" + map.borrowing[i].returnDate + "</td>\n" +
                        "                    </tr>\n" +
                        "                    </tbody>");
                }
                $(".pageNumber").remove();
                if (pageNumber != 0) {
                    if (page == 1) {
                        $("#previous").addClass("disabled");
                    } else {
                        $("#previous").removeClass("disabled");
                    }
                    if (page == pageNumber) {
                        $("#next").addClass("disabled");
                    } else {
                        $("#next").removeClass("disabled");
                    }
                    if (page <= firstPage && page != 1) {
                        firstPage -= pageLong;
                        lastPage = firstPage + pageLong;
                    } else if (page >= lastPage && page != pageNumber) {
                        firstPage += pageLong;
                        lastPage = lastPage + pageLong > pageNumber ? pageNumber : lastPage + pageLong;
                    }
                    for (let i = firstPage; i <= lastPage; i++) {
                        if (i != page) {
                            $("#next").before("<li class=\"pageNumber\"><a href=\"javascript:void(0);\" onclick=\"pageJmp(" + i + ")\">" + i + "</a></li>");
                        } else {
                            $("#next").before("<li class=\"pageNumber active\"><a href=\"javascript:void(0);\" onclick=\"pageJmp(" + i + ")\">" + i + "</a></li>");
                        }
                    }
                } else {
                    $("#previous").addClass("disabled");
                    $("#next").addClass("disabled");
                }
            }
        );
    }
</script>
</body>
</html>
