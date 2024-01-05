<%@include file="../../db/db.jsp" %>

<%
String username = request.getParameter("username");
boolean active = Boolean.parseBoolean(request.getParameter("active"));

String sql = "update users set active=? where username=?";

try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setBoolean(1, active);
    pstmt.setString(2, username);
    
    int isSuccess = pstmt.executeUpdate();
    
    if (isSuccess != 0) {
        %>
        <script>
            alert("User suspended")
            window.location.replace("<%=request.getContextPath()%>/admin/manageUser/index.jsp")
        </script>
        <%
    }
} catch (Exception e) {
    System.out.print(e);
}
%>
