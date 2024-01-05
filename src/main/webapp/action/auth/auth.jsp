<%@include file="../../db/db.jsp" %>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");

String sql = "SELECT * FROM users WHERE username = ? AND password = ?"
        + "AND active = 1";
String sql2 = "SELECT * FROM admin WHERE email = ? AND password = ?";
String redirect = null;

try {
    boolean found = false;
    
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, password);
    
    res = pstmt.executeQuery();
    
    if (res.next()) {
        session.setAttribute("role", "user");
        redirect = "/user/userDashboard.jsp";
        found = true;
    }
    
    pstmt = conn.prepareStatement(sql2);
    pstmt.setString(1, id);
    pstmt.setString(2, password);
    
    res = pstmt.executeQuery();
    if (res.next()) {
        session.setAttribute("role", "admin");
        redirect = "/admin/adminDashboard.jsp";
        found = true;
    }
    
    if (found) {
        // set session
        session.setAttribute("sessionId", id);

        response.sendRedirect(request.getContextPath() + redirect);
    } else {
        %>
        <script>
            alert("Invalid credentials")
            window.history.back()
        </script>
        <%
    }
} catch (Exception e) {
    System.out.println(e);
}
%>