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
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">公告<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../announcement/select">公告记录</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../announcement/add">增加公告</a></li>
                            <li><a href="../announcement/change">变更公告</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">管理员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="active"><a href="#">查询管理员</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="add">增加管理员</a></li>
                            <li><a href="change">变更管理员</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../root">个人信息</a></li>
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
                <div class="panel-heading">查询管理员</div>
                <div class="panel-body">
                    <p>请填写一项或多项检索条件</p>
                    <form action="" method="post">
                        <div class="form-group">
                            <label>管理员号</label>
                            <input type="text" class="form-control" id="id" placeholder="管理员号">
                        </div>
                        <div class="form-group">
                            <label>管理员名</label>
                            <input type="text" class="form-control" id="name" placeholder="管理员名">
                        </div>
                        <div class="form-group">
                            <label>分页大小</label>
                            <input type="text" class="form-control" id="pageSize" placeholder="每页数据条数" value="10">
                        </div>
                        <button type="button" id="select" class="btn btn-success btn-block">检索</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-7 col-md-8 col-lg-8 animated fadeInRight">
            <div class="panel panel-info">
                <div class="panel-heading">管理员信息</div>
                <div class="panel-body">
                    <p id="adminNum"></p>
                </div>
                <table class="table" id="adminsTable">
                    <tr id="adminTitle">
                        <th>管理员号</th>
                        <th>管理员名</th>
                        <th>变更</th>
                    </tr>
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
    let ID = "";            //查询ID
    let name = "";          //查询name
    let limit = 10;          //分页大小
    let page = 1;           //当前页
    let adminNumber = 0;    //数据条数
    let pageNumber = 0;     //总页数
    const pageLong = 5;       //分页栏长度-1
    let firstPage = 1;      //当前分页页首
    let lastPage = 6;       //当前分页页尾
    $(document).ready(function () {
        pageJmp(1);
        $("#select").click(function () {
            ID = $("#id").val();
            name = $("#name").val();
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
            "selectAdmin",
            {"ID": ID, "name": name, "page": page, "limit": limit},
            function (map) {
                adminNumber = map.adminNumber;
                pageNumber = map.pageNumber;
                lastPage = firstPage + pageLong > pageNumber ? pageNumber : firstPage + pageLong;
                $("#adminNum").html("共" + adminNumber + "位管理员");
                $(".admins").remove();
                const long = adminNumber - (page - 1) * limit > limit ? limit : adminNumber - (page - 1) * limit;
                for (let i = 0; i < long; i++) {
                    $("#adminsTable").append("<tr class=\"admins\">\n" +
                        "                        <td>" + map.admins[i].id + "</td>\n" +
                        "                        <td>" + map.admins[i].name + "</td>\n" +
                        "                        <td><a href=\"change?id=" + map.admins[i].id + "\">变更</a></td>\n" +
                        "                    </tr>");
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
