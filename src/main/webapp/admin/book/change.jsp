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
                    <li class="dropdown animated flipInX">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">图书管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="select">查询图书</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="add">增加图书</a></li>
                            <li class="active"><a href="change">变更图书</a></li>
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
                            <li><a href="../log/overdue">超期信息</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../log/log">借阅日志</a></li>
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
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-md-offset-1 col-lg-offset-2 animated fadeInUp">
        <div class="panel panel-success">
            <div class="panel-heading">变更图书信息</div>
            <div class="panel-body">
                <form class="form-horizontal">
                    <div class="form" id="form">
                        <div class="input-group book">
                            <div class="input-group-addon">图书编号</div>
                            <input type="text" class="form-control" id="ISBN" value="${requestScope.book.ISBN}"
                                   placeholder="ISBN号" aria-describedby="basic-addon1">
                            <span class="input-group-btn">
                            <button class="btn btn-default" id="inquiry" type="button">查找</button>
                        </span>
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&emsp;书名&emsp;</div>
                            <input type="text" class="form-control" id="name" value="${requestScope.book.name}"
                                   placeholder="书名" aria-describedby="basic-addon1">
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&emsp;作者&emsp;</div>
                            <input type="text" class="form-control" id="author" value="${requestScope.book.author}"
                                   placeholder="作者" aria-describedby="basic-addon1">
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&ensp;出版社&ensp;</div>
                            <input type="text" class="form-control" id="press" value="${requestScope.book.press}"
                                   placeholder="出版社" aria-describedby="basic-addon1">
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&emsp;类别&emsp;</div>
                            <input type="text" class="form-control" id="type" value="${requestScope.book.type}"
                                   placeholder="类别" aria-describedby="basic-addon1">
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&emsp;定价&emsp;</div>
                            <input type="text" class="form-control" id="pricing" value="${requestScope.book.pricing}"
                                   placeholder="定价" aria-describedby="basic-addon1">
                        </div>
                        <br>
                        <div class="input-group book">
                            <div class="input-group-addon">&ensp;总本数&ensp;</div>
                            <input type="text" class="form-control" id="number" value="${requestScope.book.number}"
                                   placeholder="总本数" aria-describedby="basic-addon1">
                        </div>
                        <br>
                        <div class="input-group">
                            <div class="input-group-addon">能否借阅</div>
                            <div class="form-control">
                                <div class="row">
                                    <label class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <input type="checkbox" id="borrow"
                                               name="borrow" ${requestScope.book.borrow?"checked":""}>可借阅
                                    </label>
                                </div>
                            </div>
                        </div>
                        <br>
                        <label>内容简介</label>
                        <textarea class="form-control" id="introduction" placeholder="内容简介"
                                  rows="5">${requestScope.book.introduction}</textarea>
                        <br class="bookbr">
                    </div>
                    <div class="form-group text-center">
                        <div class="btn-group" role="group">
                            <button type="button" id="delete" class="btn btn-danger">删除</button>
                            <p class="btn"></p>
                            <button type="reset" class="btn btn-warning">重置</button>
                            <p class="btn"></p>
                            <button type="button" id="tijiao" class="btn btn-success">提交</button>
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
<div class="modal fade bs-example-modal-sm" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="deleteLabel">删除确认</h4>
            </div>
            <div class="modal-body" id="deleteBody">
                确认要删除此图书信息？
            </div>
            <div class="modal-footer">
                <button type="button" id="deleteCancel" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="deleteOK" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#inquiry").click(function () {
            const ISBN = $("#ISBN").val();
            if (ISBN == "") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("图书编号(ISBN)不能为空！");
                $('#modal').modal();
                return;
            }
            $.post(
                "changeBook/select",
                {"ISBN": ISBN},
                function (back) {
                    if (back.modalTitle == "错误") {
                        $("#modalLabel").html("错误");
                        $("#modalBody").html(back.modalPoint);
                        $('#modal').modal({backdrop: "static"});
                        return;
                    }
                    $("#name").val(back.book.name);
                    $("#author").val(back.book.author);
                    $("#press").val(back.book.press);
                    $("#type").val(back.book.type);
                    $("#pricing").val(back.book.pricing);
                    $("#number").val(back.book.number);
                    $("#borrow").prop("checked", back.book.borrow);
                    $("#introduction").val(back.book.introduction);
                }
            );
        });
        $("#tijiao").click(function () {
            const ISBN = $("#ISBN").val();
            const name = $("#name").val();
            const author = $("#author").val();
            const press = $("#press").val();
            const type = $("#type").val();
            const pricing = $("#pricing").val();
            const number = $("#number").val();
            let borrow = true;
            $("input[type='checkbox']").each(function () {
                borrow = $(this).is(':checked') == true;
            });
            const introduction = $("#introduction").val();
            if (ISBN != "" || name != "" || author != "" || press != "" || type != "" || pricing != "" || number != "" || introduction != "") {
                $.post(
                    "updateBook",
                    {
                        "ISBN": ISBN,
                        "name": name,
                        "author": author,
                        "press": press,
                        "type": type,
                        "pricing": pricing,
                        "number": number,
                        "borrow": borrow,
                        "introduction": introduction
                    },
                    function (modal) {
                        $("#modalLabel").html(modal.modalTitle);
                        $("#modalBody").html(modal.modalPoint);
                        $('#modal').modal({backdrop: "static"});
                    }
                );
            } else {
                $("#modalLabel").html("错误！");
                $("#modalBody").html("数据填写不完整！");
                $('#modal').modal({backdrop: "static"});
            }
        });
        $("#deleteCancel").click(function () {
            $("#deleteModal").modal('hide');
        });
        $("#deleteOK").click(function () {
            const ISBN = $("#ISBN").val();
            $.post(
                "deleteBook",
                {"ISBN": ISBN},
                function (modal) {
                    $("#deleteModal").modal('hide');
                    $("#modalLabel").html(modal.modalTitle);
                    $("#modalBody").html(modal.modalPoint);
                    $('#modal').modal({backdrop: "static"});
                }
            );
        });
        $("#delete").click(function () {
            const ISBN = $("#ISBN").val();
            if (ISBN == "") {
                $("#modalLabel").html("错误");
                $("#modalBody").html("请输入要删除的图书编号(ISBN)！");
                $('#modal').modal({backdrop: "static"});
                return;
            }
            $('#deleteModal').modal();
        });
    });
</script>
</body>
</html>
