<%@include file="../../db/db.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LMS</title>
        <link rel="stylesheet" type="text/css" href="../../static/css/user/header_member_style.css" />
        <link rel="stylesheet" type="text/css" href="../../static/css/global_styles.css">
        <link rel="stylesheet" type="text/css" href="../../static/css/user/home_style.css">
        <link rel="stylesheet" type="text/css" href="../../static/css/custom_radio_button_style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    </head>
    <body>
        <%@include file="../../layout/header.jsp" %>
        <%
        String sql = "select * from users";
        try {
            pstmt = conn.prepareStatement(sql);

            res = pstmt.executeQuery();

            if (res.next()) {
            %>
            <form class="cd-form">
                <div class="error-message" id="error-message">
                    <p id="error"></p>
                </div>
                <h2 align='center'>User Management</h2>
                <table width="100%" cellpadding="10" cellspacing="10">
                    <tbody>
                        <tr>
                            <th>No.<hr></th>
                            <th>Username<hr></th>
                            <th>Name<hr></th>
                            <th>Status<hr></th>
                            <th colspan="2">Action<hr></th>
                        </tr> 
                        <%
                        res = pstmt.executeQuery();
                        int i = 1;
                        while(res.next()) {
                            String username = res.getString("username");
                            String name = res.getString("name");
                            int active  = res.getInt("active");
                            
                            String redirectSuspend = request.getContextPath() 
                            + "/action/userManagement/suspend.jsp?username=" 
                            + username + "&active=" + (active == 1 ? false : true);
                            
                            String redirectBook = request.getContextPath() 
                            + "/admin/manageUser/bookReport.jsp?username=" 
                            + username;
                            
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=username%></td>
                                <td><%=name%></td>
                                <td><%=active == 1 ? "true" : "false"%></td>
                                <td>
                                    <div class="text-center">
                                        <a href="<%=redirectSuspend%>" 
                                           style="color:#F66; 
                                           text-decoration:none;">
                                                <%=active == 1 ? "Suspend user" : "Unsuspend user"%>
                                        </a>
                                    </div>
                                </td>
                                <td>
                                    <div class="text-center">
                                        <a href="<%=redirectBook%>" 
                                           style="color:#F66; 
                                           text-decoration:none;">View book history</a>
                                    </div>
                                </td>
                            </tr>
                            <%
                            i++;
                        }
                        %>
                    </tbody>
                </table>
            </form>
            <%
            }else {
                %>
                <h2 align='center'>No user</h2>
                <%
            }
        } catch (Exception e) {
            System.out.print(e);
        }
        %>
    </body>
</html>
