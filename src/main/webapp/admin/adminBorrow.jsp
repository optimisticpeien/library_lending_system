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
                    <li class="active"><a href="adminBorrow">借书</a></li>
                    <li><a href="adminReturn">还书续借</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">图书管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="book/select">查询图书</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="book/add">增加图书</a></li>
                            <li><a href="book/change">变更图书</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">人员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="student/select">学生查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="student/add">增加学生</a></li>
                            <li><a href="student/change">变更学生</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="teacher/select">教师查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="teacher/add">增加教师</a></li>
                            <li><a href="teacher/change">变更教师</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">记录<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="log/overdue">超期信息</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="log/log">借阅日志</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu animated flipInX">
                            <li><a href="admin">个人信息</a></li>
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
            <div class="panel-heading">借书单</div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <div class="input-group">
                        <%--                        <div class="input-group-btn">--%>
                        <%--                            <select class="btn btn-default" id="identity">--%>
                        <%--                                <option value="student">学生</option>--%>
                        <%--                                <option value="teacher">教师</option>--%>
                        <%--                            </select>--%>
                        <%--                        </div>--%>
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false"><span id="shenfen">学生</span>&emsp;<span
                                    class="caret"></span></button>
                            <ul class="dropdown-menu animated flipInX">
                                <li><a href="javascript:void(0);" onclick="xuesheng()">学生</a></li>
                                <li><a href="javascript:void(0);" onclick="jiaoshi()">教师</a></li>
                            </ul>
                        </div>
                        <input type="hidden" id="identity" name="identity" value="student"/>
                        <input type="text" class="form-control" id="ID" placeholder="学生证号或教师工号"
                               aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <div class="form" id="form">
                        <div class="input-group book" id="book0">
                            <div class="input-group-addon">图书编号</div>
                            <input type="text" class="form-control isbn" placeholder="ISBN号"
                                   aria-describedby="basic-addon1">
                        </div>
                        <br class="bookbr">
                    </div>
                    <div class="form-group text-center">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-success" id="add">添加</button>
                            <p class="btn"></p>
                            <button type="button" class="btn btn-info" id="delete">删除</button>
                            <p class="btn"></p>
                            <button type="reset" class="btn btn-warning">重置</button>
                            <p class="btn"></p>
                            <button type="button" class="btn btn-danger" id="tijiao">提交</button>
                        </div>
                    </div>
                </form>
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
<script>
    function xuesheng() {
        $("input[name='identity']").attr("value", "student");
        $("#shenfen").text("学生");
    }

    function jiaoshi() {
        $("input[name='identity']").attr("value", "teacher");
        $("#shenfen").text("教师");
    }

    let i = 0;
    $(document).ready(function () {
        $("#add").click(function () {
            i++;
            $(".form").append("\n" +
                "                            <div class=\"input-group book\" id=\"book" + i + "\">\n" +
                "                                <div class=\"input-group-addon\" id=\"logintitle1\">图书编号</div>\n" +
                "                                <input type=\"text\" class=\"form-control isbn\" placeholder=\"ISBN号\" aria-describedby=\"basic-addon1\">\n" +
                "                            </div>\n" +
                "                        <br class=\"bookbr\">");
        });
        $("#delete").click(function () {
            if (i > 0) {
                i--;
                $(".book:last").remove();
                $(".bookbr:last").remove();
            }
        });
        $("#reset").click(function () {
            while (i > 0) {
                i--;
                $(".book:last").remove();
                $(".bookbr:last").remove();
            }
        });
        $("#tijiao").click(function () {
            const isbnArray = [];
            $(".isbn").each(function () {
                isbnArray.push($(this).val());
            });
            const identity = $("#identity").val();
            const ID = $("#ID").val();
            $.ajax({
                type: "POST",
                url: "borrowBooks",

                traditional: true,
                data: {"identity": identity, "ID": ID, "isbns": isbnArray},
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
