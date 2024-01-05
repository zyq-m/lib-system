<%@include file="../../db/db.jsp" %>

<%
String username = request.getParameter("username");
String name = request.getParameter("name");
String pass = request.getParameter("password");
String rePass = request.getParameter("re-password");

String sql = "INSERT INTO users(username, name, password) VALUES(?,?,?)";

if (!rePass.equals(pass)) {
    %>
    <script>
        alert("Retype password not match")
        window.history.back()
    </script>
    <%
}

try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, username);
    pstmt.setString(2, name);
    pstmt.setString(3, pass);
    
    int isSuccess = pstmt.executeUpdate();
    
    if (isSuccess != 0) {
        // success
        %>
        <script>
            alert("Account successfully registered")
            window.location.replace("<%=request.getContextPath()%>/index.jsp")
        </script>
        <%
    }
} catch (Exception e) {
    System.out.println(e);
    if (e.getMessage().equals("Duplicate entry 'user' for key 'users.PRIMARY'")) {
        %>
        <script>
            alert("Username has been used")
            window.history.back()
        </script>
        <%
    }
}
%>