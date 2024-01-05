<%@include file="../../db/db.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LMS</title>
        <link rel="stylesheet" type="text/css" href="../../static/css/global_styles.css">
        <link rel="stylesheet" type="text/css" href="../../static/css/form_styles.css">
        <link rel="stylesheet" type="text/css" href="../../static/css/index_style.css">
        <link rel="stylesheet" type="text/css" href="../../static/css/user/header_member_style.css" />
    </head>
    <body>
        <%@include file="../../layout/header.jsp" %>
        <%
        String pass = null;
        try {
            pstmt = conn.prepareStatement("select * from users where username=?");
            pstmt.setString(1, sessionId);
            
            res = pstmt.executeQuery();
            
            if (res.next()) {            
                String username = res.getString("username");
                String name = res.getString("name");
                pass = res.getString("password");
        %>
        <form class="cd-form" method="POST" action="?isUpdate=true">

            <center><legend>My Account</legend></center>

            <div class="error-message" id="error-message">
                <p id="error"></p>
            </div>

            <div class="icon">
                <h4>Username</h4>
                <input class="m-user" type="text" name="username" 
                       placeholder="Username" required
                       value="<%=username%>"/>
            </div>
            
            <div class="icon">
                <h4>Name</h4>
                <input class="m-user" type="text" name="name" 
                       placeholder="Name" required
                       value="<%=name%>"/>
            </div>

            <div class="icon">
                <h4>Old Password</h4>
                <input class="m-pass" type="password" 
                       name="old-password" placeholder="Old Password" required />
            </div>
            
            <div class="icon">
                <h4>New password</h4>
                <input class="m-pass" type="password" 
                       name="new-password" placeholder="New Password" required />
            </div>

            <input type="submit" value="Update Account" />
        <%
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        try {
            // Update account
            String isUpdate = request.getParameter("isUpdate");

            if (isUpdate != null && isUpdate.equals("true")) {
                String newUsername = request.getParameter("username");
                String newName  = request.getParameter("name");
                String oldPass = request.getParameter("old-password");
                String newPass = request.getParameter("new-password");
                String sql = "update users set username=?, name=?, password=?"
                + " where username=?";

                if (pass.equals(oldPass)) {
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, newUsername);
                    pstmt.setString(2, newName);
                    pstmt.setString(3, newPass);
                    pstmt.setString(4, sessionId);

                    pstmt.executeUpdate();
                } else {
                    %>
                    <script>alert("Wrong password")</script>
                    <%
                }                
            }    
        } catch (Exception e) {
            System.out.println(e);
        }
        %>
        </form>
    </body>
</html>
