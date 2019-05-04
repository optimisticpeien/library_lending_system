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
                    <li class="active"><a href="#">图书</a></li>
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

    <div class="animated fadeInDown">
        <div class="panel panel-info">
            <div class="panel-heading">查询图书</div>
            <div class="panel-body">
                <p>请填写一项或多项检索条件</p>
                <form action="" class="form-horizontal"
                      method="post"> <%--col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2--%>
                    <div class="row">
                        <div class="col-xs-12 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 ">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>ISBN</label>
                                    <input type="text" class="form-control" id="ISBN" placeholder="图书编号">
                                </div>
                            </div>
                        </div>
                        <div class=" col-xs-12 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-2 col-md-offset-0 col-lg-offset-0 ">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>书名</label>
                                    <input type="text" class="form-control" id="name" placeholder="书名">
                                </div>
                            </div>
                        </div>
                        <div class=" col-xs-12 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 ">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>作者</label>
                                    <input type="text" class="form-control" id="author" placeholder="作者">
                                </div>
                            </div>
                        </div>
                        <div class=" col-xs-12 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-2 col-md-offset-0 col-lg-offset-0 ">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>出版社</label>
                                    <input type="text" class="form-control" id="press" placeholder="出版社">
                                </div>
                            </div>
                        </div>
                        <div class=" col-xs-12 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 ">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>类别</label>
                                    <input type="text" class="form-control" id="type" placeholder="类别">
                                </div>
                            </div>
                        </div>
                        <div class=" col-xs-12 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-2 col-md-offset-0 col-lg-offset-0 ">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>简介</label>
                                    <input type="text" class="form-control" id="introduction" placeholder="简介">
                                </div>
                            </div>
                        </div>
                        <div class=" col-xs-12 col-sm-5 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 ">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>分页大小</label>
                                    <input type="text" class="form-control" id="pageSize" placeholder="每页数据条数"
                                           value="10">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2 col-xs-offset-0 col-sm-offset-3 col-md-offset-4 col-lg-offset-5">
                            <button type="button" id="select" class="btn btn-success btn-block">检索</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="animated fadeInUp">
        <div class="panel panel-success">
            <div class="panel-heading">图书信息</div>
            <div class="panel-body">
                <p id="bookNum"></p>
            </div>
            <table class="table" id="booksTable" style="cursor:pointer">
                <tbody>
                <tr class="books">
                    <th>ISBN</th>
                    <td>ISBN</td>
                    <th>书名</th>
                    <td colspan="3">书名</td>
                </tr>
                <tr class="books">
                    <th>作者</th>
                    <td>作者</td>
                    <th>出版社</th>
                    <td>出版社</td>
                    <th>类别</th>
                    <td>类别</td>
                </tr>
                <tr class="books">
                    <th>单价</th>
                    <td>单价</td>
                    <th>数量</th>
                    <td>数量</td>
                    <th>能否借阅</th>
                    <td>能否借阅</td>
                </tr>
                <tr class="books">
                    <th>简介</th>
                    <td colspan="4">简介</td>
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
<script>
    let ISBN = "";
    let name = "";
    let author = "";
    let press = "";
    let type = "";
    let introduction = "";
    let limit = 10;         //分页大小
    let page = 1;           //当前页
    let bookNumber = 0;     //数据条数
    let pageNumber = 0;     //总页数
    const pageLong = 5;       //分页栏长度-1
    let firstPage = 1;      //当前分页页首
    let lastPage = 6;       //当前分页页尾
    $(document).ready(function () {
        pageJmp(1);
        $("#select").click(function () {
            ISBN = $("#ISBN").val() + "";
            name = $("#name").val();
            author = $("#author").val();
            press = $("#press").val();
            type = $("#type").val();
            pricing = $("#pricing").val() == "" ? 0 : $("#pricing").val();
            number = $("#number").val() == "" ? 0 : $("#number").val();
            introduction = $("#introduction").val();
            limit = $("#pageSize").val();
            pageJmp(1);
        });
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
            "selectBook",
            {
                "ISBN": ISBN,
                "name": name,
                "author": author,
                "press": press,
                "type": type,
                "introduction": introduction,
                "page": page,
                "limit": limit
            },
            function (map) {
                bookNumber = map.bookNumber;
                pageNumber = map.pageNumber;
                lastPage = firstPage + pageLong > pageNumber ? pageNumber : firstPage + pageLong;
                $("#bookNum").html("共" + bookNumber + "本图书");
                $(".books").remove();
                const long = bookNumber - (page - 1) * limit > limit ? limit : bookNumber - (page - 1) * limit;
                for (let i = 0; i < long; i++) {
                    $("#booksTable").append("\n" +
                        "                <tbody>\n" +
                        "                <tr class=\"books info\">\n" +
                        "                    <th>ISBN</th>\n" +
                        "                    <td>" + map.books[i].isbn + "</td>\n" +
                        "                    <th>书名</th>\n" +
                        "                    <td colspan=\"3\">" + map.books[i].name + "</td>\n" +
                        "                </tr>\n" +
                        "                <tr class=\"books\">\n" +
                        "                    <th>作者</th>\n" +
                        "                    <td>" + map.books[i].author + "</td>\n" +
                        "                    <th>出版社</th>\n" +
                        "                    <td>" + map.books[i].press + "</td>\n" +
                        "                    <th>类别</th>\n" +
                        "                    <td>" + map.books[i].type + "</td>\n" +
                        "                </tr>\n" +
                        "                <tr class=\"books\">\n" +
                        "                    <th>简介</th>\n" +
                        "                    <td colspan=\"5\">" + map.books[i].introduction.substring(0, 50) + "……</td>\n" +
                        "                </tr>\n" +
                        "                </tbody>");
                }
                $("#booksTable tbody").click(function () {
                    const td = $(this).find("td");
                    const tdid = td.eq(0).html();
                    //    alert(tdid);
                    window.location.href = "book?ISBN=" + tdid;
                });
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
