<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LMS</title>
        <link rel="stylesheet" type="text/css" href="static/css/global_styles.css">
        <link rel="stylesheet" type="text/css" href="static/css/form_styles.css">
        <link rel="stylesheet" type="text/css" href="static/css/index_style.css">
        <link rel="stylesheet" type="text/css" href="static/css/user/header_member_style.css" />
    </head>
    <body>
        <header>
            <%@include file="layout/unauthHeader.jsp" %>
        </header>
        <form class="cd-form" method="POST" action="action/auth/auth.jsp">

            <center><legend>Login</legend></center>

            <div class="error-message" id="error-message">
                <p id="error"></p>
            </div>

            <div class="icon">
                <input class="m-user" type="text" name="id" placeholder="Email or Username" required />
            </div>

            <div class="icon">
                <input class="m-pass" type="password" name="password" placeholder="Password" required />
            </div>

            <input type="submit" value="Login" name="m_login" />
            
            <br /><br /><br /><br />
			
            <p align="center">Don't have an account?&nbsp;<a href="<%=request.getContextPath()%>/user/register.jsp" style="text-decoration:none; color:red;">Register Now!</a>
        </form>
    </body>
</html>
