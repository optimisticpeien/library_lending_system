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
                        <ul class="dropdown-menu">
                            <li><a href="../book/select">查询图书</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="../book/add">增加图书</a></li>
                            <li><a href="../book/change">变更图书</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">人员管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="select">学生查询</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="add">增加学生</a></li>
                            <li><a href="change">变更学生</a></li>
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
                        <ul class="dropdown-menu">
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
                        <ul class="dropdown-menu">
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
                <div class="panel-heading">查询学生</div>
                <div class="panel-body">
                    <p>请填写一项或多项检索条件</p>
                    <form action="" method="post">
                        <div class="form-group">
                            <label>学号</label>
                            <input type="text" class="form-control" id="id" placeholder="学号">
                        </div>
                        <div class="form-group">
                            <label>姓名</label>
                            <input type="text" class="form-control" id="name" placeholder="姓名">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" name="sexCheck" value="1">性别：
                            </label>
                            <div class="form-control">
                                <label class="col-xs-5 col-sm-5 col-md-5 col-lg-5 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                    <input type="radio" name="sex" checked value="0">男
                                </label>
                                <label class="col-xs-5 col-sm-5 col-md-5 col-lg-5 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                    <input type="radio" name="sex" value="1">女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>系别</label>
                            <input type="text" class="form-control" id="department" placeholder="系别">
                        </div>
                        <div class="form-group">
                            <label>班级</label>
                            <input type="text" class="form-control" id="grade" placeholder="班级">
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
            <div class="panel panel-success">
                <div class="panel-heading">学生信息</div>
                <div class="panel-body">
                    <p id="studentNum"></p>
                </div>
                <table class="table table-condensed" id="studentsTable">
                    <tbody>
                    <tr class="students">
                        <th>学号</th>
                        <td>学号</td>
                        <th>姓名</th>
                        <td>姓名</td>
                        <th>性别</th>
                        <td>性别</td>
                    </tr>
                    <tr class="students">
                        <th>系别</th>
                        <td>系别</td>
                        <th>班级</th>
                        <td>班级</td>
                        <th>可借本数</th>
                        <td>可借本数</td>
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
    let ID = "";            //查询ID
    let name = "";          //查询name
    let sexCheck = 0;       //查询sex选择
    let sex = false;        //查询sex
    let department = "";    //查询department
    let grade = "";         //查询grade
    let limit = 8;          //分页大小
    let page = 1;           //当前页
    let studentNumber = 0;  //数据条数
    let pageNumber = 0;     //总页数
    const pageLong = 5;       //分页栏长度-1
    let firstPage = 1;      //当前分页页首
    let lastPage = 6;       //当前分页页尾
    $(document).ready(function () {
        pageJmp(1);
        $("#select").click(function () {
            ID = $("#id").val();
            name = $("#name").val();
            $("input[name='sexCheck']").each(function () {
                if ($(this).is(':checked') == true) {
                    sexCheck = parseInt($(this).attr("value"));
                } else {
                    sexCheck = 0;
                }
            });
            if (sexCheck == 1) {
                sex = $("input[name='sex']:checked").val() == 1;
            }
            department = $("#department").val();
            grade = $("#grade").val();
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
            "selectStudent",
            {
                "ID": ID,
                "name": name,
                "sex": sex,
                "department": department,
                "grade": grade,
                "sexCheck": sexCheck,
                "page": page,
                "limit": limit
            },
            function (map) {
                studentNumber = map.studentNumber;
                pageNumber = map.pageNumber;
                lastPage = firstPage + pageLong > pageNumber ? pageNumber : firstPage + pageLong;
                $("#studentNum").html("共" + studentNumber + "位学生");
                $(".students").remove();
                const long = studentNumber - (page - 1) * limit > limit ? limit : studentNumber - (page - 1) * limit;
                for (let i = 0; i < long; i++) {
                    $("#studentsTable").append("\n" +
                        "                    <tbody>\n" +
                        "                    <tr class=\"students\">\n" +
                        "                        <th>工号</th>\n" +
                        "                        <td>" + map.students[i].id + "</td>\n" +
                        "                        <th>姓名</th>\n" +
                        "                        <td>" + map.students[i].name + "</td>\n" +
                        "                        <th>性别</th>\n" +
                        "                        <td>" + (map.students[i].sex ? '女' : '男') + "</td>\n" +
                        "                    </tr>\n" +
                        "                    <tr class=\"students\">\n" +
                        "                        <th>系别</th>\n" +
                        "                        <td>" + map.students[i].department + "</td>\n" +
                        "                        <th>班级</th>\n" +
                        "                        <td>" + map.students[i].grade + "</td>\n" +
                        "                        <th>可借本数</th>\n" +
                        "                        <td>" + map.students[i].bookNumber + "</td>\n" +
                        "                    </tr>\n" +
                        "                    </tbody>");
                }
                $("#studentsTable tbody").click(function () {
                    const td = $(this).find("td");
                    const tdid = td.eq(0).html();
                    //    alert(tdid);
                    window.location.href = "change?id=" + tdid;
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
