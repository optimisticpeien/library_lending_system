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
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="../book/select">查询图书</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../book/add">增加图书</a></li>
                            <li><a href="../book/change">修改图书</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">人员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="../student/select">学生查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../student/add">增加学生</a></li>
                            <li><a href="../student/change">变更学生</a></li>
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
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="overdue">超期信息</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="active"><a href="log">借阅日志</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
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

    <div class="row">
        <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4 animated fadeInLeft">
            <div class="panel panel-info">
                <div class="panel-heading">查询借阅记录</div>
                <div class="panel-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" id="id" placeholder="学号或教师工号">
                        </div>
                        <div class="form-group">
                            <label>分页大小</label>
                            <input type="text" class="form-control" id="pageSize" placeholder="每页数据条数" value="5">
                        </div>
                        <button type="button" id="select" class="btn btn-success btn-block">检索</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-7 col-md-8 col-lg-8 animated fadeInRight">
            <div class="panel panel-success">
                <div class="panel-heading">当前借阅</div>
                <div class="panel-body">
                    <p id="logNum">请输入相关查询条件</p>
                </div>
                <table class="table table-condensed" id="logTable">
                </table>
                <nav aria-label="Page navigation" class="text-center">
                    <ul class="pagination" id="pagination">
                        <li class="disabled" id="previous">
                            <a href="javascript:void(0);" onclick="pageJmp1(-1)" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="disabled" id="next">
                            <a href="javascript:void(0);" onclick="pageJmp1(-2)" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading">借阅记录</div>
                <div class="panel-body">
                    <p id="logNuml">请输入相关查询条件</p>
                </div>
                <table class="table table-condensed" id="logTablel">
                </table>
                <nav aria-label="Page navigation" class="text-center">
                    <ul class="pagination" id="paginationl">
                        <li class="disabled" id="previousl">
                            <a href="javascript:void(0);" onclick="pageJmp2(-1)" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="disabled" id="nextl">
                            <a href="javascript:void(0);" onclick="pageJmp2(-2)" aria-label="Next">
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
    let ID = "";            //查询ID
    let limit = 5;          //分页大小

    let page = 1;           //当前页
    let logNumber = 0;    //数据条数
    let pageNumber = 0;     //总页数
    const pageLong = 5;       //分页栏长度-1
    let firstPage = 1;      //当前分页页首
    let lastPage = 6;       //当前分页页尾

    let pagel = 1;           //当前页
    let logNumberl = 0;    //数据条数
    let pageNumberl = 0;     //总页数
    const pageLongl = 5;       //分页栏长度-1
    let firstPagel = 1;      //当前分页页首
    let lastPagel = 6;       //当前分页页尾

    $(document).ready(function () {
        $("#select").click(function () {
            ID = $("#id").val();
            limit = $("#pageSize").val();
            pageJmp1(1);
            pageJmp2(1);
        });
    });

    function pageJmp1(p) {
        if (p == -1) {
            if (page != 1)
                page--;
        } else if (p == -2) {
            if (page != pageNumber)
                page++;
        } else
            page = p - 0;
        $.post(
            "borrowing",
            {"ID": ID, "page": page, "limit": limit},
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
                            $("#next").before("<li class=\"pageNumber\"><a href=\"javascript:void(0);\" onclick=\"pageJmp1(" + i + ")\">" + i + "</a></li>");
                        } else {
                            $("#next").before("<li class=\"pageNumber active\"><a href=\"javascript:void(0);\" onclick=\"pageJmp1(" + i + ")\">" + i + "</a></li>");
                        }
                    }
                } else {
                    $("#previous").addClass("disabled");
                    $("#next").addClass("disabled");
                }
            }
        );
    }

    function pageJmp2(q) {
        if (q == -1) {
            if (pagel != 1)
                pagel--;
        } else if (q == -2) {
            if (pagel != pageNumberl)
                pagel++;
        } else
            pagel = q - 0;
        $.post(
            "borrowed",
            {"ID": ID, "page": pagel, "limit": limit},
            function (map) {
                logNumberl = map.borrowedNumber;
                pageNumberl = map.pageNumber;
                lastPagel = firstPagel + pageLongl > pageNumberl ? pageNumberl : firstPagel + pageLongl;
                $("#logNuml").html("共" + logNumberl + "条借阅记录");
                $("#logTablel").empty();
                const longl = logNumberl - (pagel - 1) * limit > limit ? limit : logNumberl - (pagel - 1) * limit;
                for (let i = 0; i < longl; i++) {
                    $("#logTablel").append("<tbody>\n" +
                        "                    <tr class=\"borrowing info\">\n" +
                        "                        <th>图书编号</th>\n" +
                        "                        <td colspan=\"3\">" + map.borrowed[i].isbn + "</td>\n" +
                        "                    </tr>\n" +
                        "                    <tr class=\"borrowing\">\n" +
                        "                        <th>书名</th>\n" +
                        "                        <td colspan=\"3\">" + map.borrowed[i].name + "</td>\n" +
                        "                    </tr>\n" +
                        "                    <tr class=\"borrowing\">\n" +
                        "                        <th>借阅时间</th>\n" +
                        "                        <td>" + map.borrowed[i].borrowingDate + "</td>\n" +
                        "                        <th>还书时间</th>\n" +
                        "                        <td>" + map.borrowed[i].returnDate + "</td>\n" +
                        "                    </tr>\n" +
                        "                    </tbody>");
                }
                $(".pageNumberl").remove();
                if (pageNumberl != 0) {
                    if (pagel == 1) {
                        $("#previousl").addClass("disabled");
                    } else {
                        $("#previousl").removeClass("disabled");
                    }
                    if (pagel == pageNumberl) {
                        $("#nextl").addClass("disabled");
                    } else {
                        $("#nextl").removeClass("disabled");
                    }
                    if (pagel <= firstPagel && pagel != 1) {
                        firstPagel -= pageLongl;
                        lastPagel = firstPagel + pageLongl;
                    } else if (pagel >= lastPagel && pagel != pageNumberl) {
                        firstPagel += pageLongl;
                        lastPagel = lastPagel + pageLongl > pageNumberl ? pageNumberl : lastPagel + pageLongl;
                    }
                    for (let i = firstPagel; i <= lastPagel; i++) {
                        if (i != pagel) {
                            $("#nextl").before("<li class=\"pageNumberl\"><a href=\"javascript:void(0);\" onclick=\"pageJmp2(" + i + ")\">" + i + "</a></li>");
                        } else {
                            $("#nextl").before("<li class=\"pageNumberl active\"><a href=\"javascript:void(0);\" onclick=\"pageJmp2(" + i + ")\">" + i + "</a></li>");
                        }
                    }
                } else {
                    $("#previousl").addClass("disabled");
                    $("#nextl").addClass("disabled");
                }
            }
        );
    }
</script>
</body>
</html>
