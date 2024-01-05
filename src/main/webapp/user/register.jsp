<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LMS</title>
        <link rel="stylesheet" type="text/css" href="../static/css/global_styles.css">
        <link rel="stylesheet" type="text/css" href="../static/css/form_styles.css">
        <link rel="stylesheet" type="text/css" href="../static/css/index_style.css">
        <link rel="stylesheet" type="text/css" href="../static/css/user/header_member_style.css" />
    </head>
    <body>
        <header>
            <%@include file="../layout/unauthHeader.jsp" %>
        </header>
        <form class="cd-form" method="" action="../action/auth/register.jsp">

            <center><legend>Register</legend></center>

            <div class="error-message" id="error-message">
                <p id="error"></p>
            </div>

            <div class="icon">
                <input class="m-user" type="text" name="username" placeholder="Username" required />
            </div>
            
            <div class="icon">
                <input class="m-user" type="text" name="name" placeholder="Name" required />
            </div>

            <div class="icon">
                <input class="m-pass" type="password" name="password" placeholder="Password" required />
            </div>
            
            <div class="icon">
                <input class="m-pass" type="password" name="re-password" placeholder="Retype Password" required />
            </div>

            <input type="submit" value="Register" name="m_login" />
        </form>
    </body>
</html>
