<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/8/3
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>index.jsp</title>
    <%
        /**
         * bootstrap4.0+  要这样写路径${APP_PATH}/static/js/jquery-3.5.1.min.js
         * 下面的bootstrap也是一样
         */
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!--引入jquery-->
    　<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <!--引入bootstrap-->
    <!--css核心-->
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!--js核心-->
    <script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>



<!--学生数增加的模态框-->
<div class="modal fade" id="studentAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增学生</h4>
            </div>

            <div class="modal-body">
                <!------------------------------ 表单 ------------------------------>
                <form class="form-horizontal">
                    <!-- studentName -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">studentName</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentName" class="form-control" id="studentName_add_input" placeholder="studentName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <!--age-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">age</label>
                        <div class="col-sm-10">
                            <input type="text" name="studentAge" class="form-control" id="age_add_input" placeholder="18">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <!-- sex-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">sex</label>
                        <div class="col-sm-10">
                            <%-- 内联单选 --%>
                            <label class="radio-inline">
                                <input type="radio" name="studentSex" id="sex1_add_input" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="studentSex" id="sex2_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <!-- address -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">address</label>
                        <div class="col-sm-10">
                            <input type="text"  name="studentAddress" class="form-control" id="address_add_input" placeholder="北京">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="saveStudent_button">保存</button>
            </div>
        </div>
    </div>
</div>

<!--更新学生的模态框-->

<div class="modal fade" id="studentUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" >更新学生信息</h4>
        </div>

        <div class="modal-body">
            <!------------------------------ 表单 ------------------------------>
            <form class="form-horizontal">
                <!-- studentName -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">studentName</label>
                    <div class="col-sm-10">
                        <p class="form-control-static" id="studentName_update_static"></p>
                    </div>
                </div>
                <!--age-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">age</label>
                    <div class="col-sm-10">
                        <input type="text" name="studentAge" class="form-control" id="age_update_input" placeholder="18">
                        <span class="help-block"></span>
                    </div>
                </div>
                <!-- sex-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">sex</label>
                    <div class="col-sm-10">
                        <%-- 内联单选 --%>
                        <label class="radio-inline">
                            <input type="radio" name="studentSex" id="sex1_update_input" value="男" checked="checked"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="studentSex" id="sex2_update_input" value="女"> 女
                        </label>
                    </div>
                </div>
                <!-- address -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">address</label>
                    <div class="col-sm-10">
                        <input type="text"  name="studentAddress" class="form-control" id="address_update_input" placeholder="北京">
                        <span class="help-block"></span>
                    </div>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="update_student_button">更新</button>
        </div>
    </div>
</div>
</div>

<!--------------------------------------------------------------------->




<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>student-SSM</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id ="addStudentButton">新增</button>
            <button class="btn btn-danger" id = "delete_all_student_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table table-striped table-hover" id="student_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
                    <th>id</th>
                    <th>studentName</th>
                    <th>studentAge</th>
                    <th>studentSex</th>
                    <th>studentAddress</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>

                </tbody>

            </table>
        </div>
    </div>
    <!-- 分页信息-->
    <div class="row" >
        <!--分页文字信息-->
        <div class="col-md-6" id="pageInfo"></div>
        <!--显示分页条-->
        <div class="col-md-6" id="pageNav"></div>
    </div>
</div>

<script type="text/javascript">
    //总记录数
    let totalRecord;
    //当前页码
    let currentPage;
    $(function (){
        //去首页
        toPage(1);
    });

    function toPage(pageNumber){
        $.ajax({
            url:"${APP_PATH}/getStudent",
            data:"pageNumber="+pageNumber,
            type:"GET",
            success:function (result){
                //1,解析json
              build_student_table(result);
                //2，解析并显示分页信息
                buildPageIn(result);
                //3,解析分页条
                build_student_pageNavigate(result);
            }
        });
    }

    function build_student_table(result){
        //清空数据
        $("#student_table tbody").empty();
        //获取员工
        const students = result.map.pageInfo.list;

        $.each(students,function (index,item) {
            const checkBoxAll = $(" <td><input type='checkbox' class = 'check_item'/></td>");
            const id = $("<td></td>").append(item.id);
            const studentName = $("<td></td>").append(item.studentName);
            const studentAge = $("<td></td>").append(item.studentAge);
            const studentSex = $("<td></td>").append(item.studentSex);
            const studentAddress = $("<td></td>").append(item.studentAddress);

            //编辑和删除按钮
            const editButton = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-pencil")).append("编辑");

            //为编辑傻妞绑定一个自定义属性，方便获取id值
            editButton.attr("edit_id", item.id);

            const deleteButton = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮绑定一个自定义的属性，方便获取id值
            deleteButton.attr("delete_id", item.id);

            const buttons = $("<td></td>").append(editButton).append(" ").append(deleteButton);

            $("<tr></tr>").append(checkBoxAll)
                .append(id)
                .append(studentName)
                .append(studentAge)
                .append(studentSex)
                .append(studentAddress)
                .append(buttons).appendTo("#student_table tbody");
        });
    }

    //解析显示分页信息
    function buildPageIn(result){
        $("#pageInfo").empty();
        $("#pageInfo").append( "当前第"+result.map.pageInfo.pageNum+
            "页 ，总共"+result.map.pageInfo
                .pages+ "页，共计"+result.map.pageInfo.total+ "条记录");
        totalRecord = result.map.pageInfo.total;
        currentPage =  result.map.pageInfo.pageNum;
    }

    function build_student_pageNavigate(result) {
        $("#pageNav").empty();
        let ul=$("<ul></ul>").addClass("pagination");
        const firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        const nextPage=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        const previousPage=$("<li></li>").append($("<a></a>").append("&laquo;"));
        const lastPage= $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        //判断是否有前一页和下一页
        if(result.map.pageInfo.hasPreviousPage==false){
            firstPage.addClass("disabled");
            previousPage.addClass("disabled");
        }else {
            //为元素构建单击事件
            firstPage.click(function (){
                toPage(1);
            });
            previousPage.click(function (){
                toPage(result.map.pageInfo.pageNum-1);
            });
        }
        if (result.map.pageInfo.hasNextPage==false){
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        }else {
            nextPage.click(function (){
                toPage(result.map.pageInfo.pageNum+1);
            });
            lastPage.click(function (){
                toPage(result.map.pageInfo.pages)
            });
        }

        //构造添加首页和前一页
        ul.append(firstPage).append(previousPage);
        $.each(result.map.pageInfo.navigatepageNums,function (index,item){
            //页码号
            const pageNums=$("<li></li>").append($("<a></a>").append(item));
            //判断是否是当前页，如果是就显示高亮
            if(result.map.pageInfo.pageNum==item){
                pageNums.addClass("active");
            }
            //单击事件，点那一页去哪一页
            pageNums.click(function (){
                toPage(item);
            });
            //添加中间的页码
            ul.append(pageNums);
        });
        //添加下一页和末页
        ul.append(nextPage).append(lastPage);
        //把ul加入nav元素
        let navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#pageNav");
    }

    /**点击新增按钮，弹出模态框*/
    $("#addStudentButton").click(function (){
        //ajax请求，显示部门信息
        $("#studentAddModal").modal({
            backdrop:"static"
        });
    });


    //学生保存
    $("#saveStudent_button").click(function (){
        //发送Ajax请求保存员工
        $.ajax({
            url:"${APP_PATH}/saveStudent",
            type:"POST",
            data: $("#studentAddModal form").serialize(),
            success:function (result){
                //   alert(result.message);员工保存成功，关闭动态框，来到最后一页显示添加的信息
                $("#studentAddModal").modal('hide');
                //将总记录数当做页码
                alert(result.message);
                toPage(totalRecord);
            }
        });
    });

    //获取学生的信息
    function getStudent(id){
        $.ajax({
            url : "${APP_PATH}/getStudent/" + id,
            type :"GET",
            success : function (result){
                const studentData = result.map.student;
                $("#studentName_update_static").text(studentData.studentName);
                $("#age_update_input").val(studentData.studentAge);
                $("#studentUpdateModal input[name=studentSex]").val(studentData.studentSex);
                $("#address_update_input").val(studentData.studentAddress);
            }
        });
    }

    //更新学生的信息
    $(document).on("click", ".edit_btn", function () {
        //查出员工信息，显示员工信息
        getStudent($(this).attr("edit_id"));
        //把员工的id传递给模态框的更新按钮
        $("#update_student_button").attr("edit_id", $(this).attr("edit_id"));
        $("#studentUpdateModal").modal({
            backdrop: "static"
        });
    });

    //更新员工的更新按钮单击事件
    $("#update_student_button").click(function () {
        //发送ajax请求更新student
        $.ajax({
            url : "${APP_PATH}/updateStudent/" + $(this).attr("edit_id"),
            type : "PUT",
            data : $("#studentUpdateModal form").serialize() ,
            success : function (result) {
                //alert(result.message);
                //关闭模态框
                $("#studentUpdateModal").modal("hide");
                //回到本页面
                toPage(currentPage);
            }
        });
    });


    //完成全选个全不选功能
    $("#check_all").click(function () {
        //prop()来改变和读取dom原生的值
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    $(document).on("click", ".check_item", function () {
        //当前的元素的是不是一页上的总记录数
        const flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    //删除学生信息
    $(document).on("click", ".delete_btn", function () {
        //通过id删除学生(单个删除)
            //alert($(this).parents("tr").find("td:eq(1)").text());
            const studentName = $(this).parents("tr").find("td:eq(2)").text();
            const deleteId = $(this).attr("delete_id");
            if (confirm("确认删除[" + studentName + "]吗？")){
                $.ajax({
                    url: "${APP_PATH}/deleteStudent/" + deleteId,
                    type: "DELETE",
                    success: function (result) {
                        alert(result.message);
                        toPage(currentPage);
                    }
                });
            }
    });

    //批量删除
    //批量删除，删除选中的记录
    $("#delete_all_student_btn").click(function () {
        let studentName = "";
        let deleteId = "";
        $.each( $(".check_item:checked"), function () {
            //组装员工的姓名
            studentName += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id字符串
            deleteId += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //去除employeeName 拼接的多余逗号
        let newStudentName = studentName.substring(0, studentName.length - 1)
        //去除deleteId末尾多余的-
        let newDeleteId = deleteId.substring(0, deleteId.length - 1);
        if (confirm("确认删除[" + newStudentName + "]吗？")){
            //发送ajax请求
            $.ajax({
                url: "${APP_PATH}/deleteStudent/" + newDeleteId,
                type: "DELETE",
                success: function (result){
                    alert(result.message);
                    toPage(currentPage);
                }
            });
        }
    });

</script>
</body>
</html>
