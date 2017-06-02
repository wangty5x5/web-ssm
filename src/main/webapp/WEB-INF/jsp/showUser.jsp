<%--
  Created by IntelliJ IDEA.
  User: Zhangxq
  Date: 2016/7/16
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户信息列表</title>
    <script type="text/javascript">
        function webLogin() {
            var loginname = $('#u').val();
            var password = $('#p').val();

            if(loginname == ""){
                $("#u").tips({
                    side:2,
                    msg:'用户名不得为空',
                    bg: '#AE81FF',
                    time: 3
                });
                $("#u").focus;
                return false;
            }

            if(password == ""){
                $("#p").tips({
                    side:2,
                    msg:"密码不得为空",
                    bg: '#AE81FF',
                    time: 3
                });
                $("#p").focus;
                return false;
            }

            $.ajax({
                type: "POST",
                url: "/user/login",
                data:{loginId: loginname, pwd: password},
                dataType: 'json',
                cache: false,
                success: function (data) {
                    if(data.code == 1){
                        window.location.href = "/dashboard";
                    }else{
                        alert(data.msg);
                        $("#u").focus;
                    }
                }
            });
        }
    </script>

</head>
<body>


    <c:if test="${!empty userList}">
        <c:forEach var="user" items="${userList}">
            姓名：${user.userName} &nbsp;&nbsp; 密码：${user.userPwd} &nbsp;&nbsp;手机号：${user.userPhone} &nbsp;&nbsp;邮箱：${user.userEmail} &nbsp;&nbsp;<br>
        </c:forEach>
    </c:if>

    <form action=""
          name = "loginform"
          accept-charset="utf-8"
          id = "login_form"
          <%--class = ""--%>
          method = "post"
    >
        <input type="hidden" name = "did" value = "0"/>
        <input type="hidden" name = "to" value = "log"/>

        <div class="uinArea" id = "uinArea">
            <label class="input-tips" for="u"> 账号：</label>
            <div class="inputOuter" id = "uArea">
                <input type="text" id = "u" name = "loginId"/>
            </div>
        </div>

        <div class="pwdArea" id="pwdArea">
            <label class="input-tips" for="p">密码：</label>
            <div class="inputOuter" id="pArea">
                <input type="password" id="p" name="pwd"/>
            </div>
        </div>

        <div style="padding-left:50px;margin-top:20px;">
            <input type="button"
                   id="btn_login"
                   value="登 录"
                   onclick="webLogin();"
            style="width:150px;"
            <%--class="button_blue"/>--%>
        </div>

    </form>

</body>
</html>
