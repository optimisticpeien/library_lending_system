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
                    <li class="active"><a href="#">续借</a></li>
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
                <div class="panel-heading">续借图书</div>
                <div class="panel-body">
                    <form>
                        <table class="table">
                            <tr>
                                <th></th>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                        <input type="hidden" name="nu" value="0">
                        <div class="form-group text-center">
                            <div class="btn-group" role="group">
                                <button type="reset" class="btn btn-warning x">重置</button>
                                <p class="btn"></p>
                                <button type="button" class="btn btn-danger x" id="tijiao">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-sm" id="modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="modalLabel"></h4>
            </div>
            <div class="modal-body" id="modalBody">
            </div>
            <div class="modal-footer">
                <button type="button" id="modalOK" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $.post(
            "selectBorrowBooks",
            function (list) {
                $("tr").remove();
                if (list.length == 0) {
                    $("table").append("<tr>\n" +
                        "                            <td class='isbn'>没有借阅图书</td>\n" +
                        "                        </tr>\n"
                    );
                    $(".x").attr("disabled", true);
                }
                for (let i = 0; i < list.length; i++) {
                    $("table").append("<tr class=\"info\">\n" +
                        "                            <th>ISBN</th>\n" +
                        "                            <td class='isbn'>" + list[i].isbn + "</td>\n" +
                        "                            <td><label><input type=\"checkbox\" name=\"renew\">续借</label></td>\n" +
                        "                        </tr>\n" +
                        "                        <tr>\n" +
                        "                            <th>书名</th>\n" +
                        "                            <td colspan=\"2\">" + list[i].name + "</td>\n" +
                        "                        </tr>");
                }
            }
        );
        $("#tijiao").click(function () {
            const renewBooks = [];
            $(":checkbox[name='renew']:checked").each(function () {
                renewBooks.push($(this).parents("td").siblings(".isbn").html());
            });
            $.ajax({
                type: "POST",
                url: "renewBook",

                traditional: true,
                data: {"renewBooks": renewBooks},
                dataType: "json",
                async: false,
                success: function (modal) {
                    $("#modalLabel").html(modal.modalTitle);
                    $("#modalBody").html(modal.modalPoint);
                    $('#modal').modal({backdrop: "static"});
                }
            });
        });
    });
</script>
</body>
</html>
