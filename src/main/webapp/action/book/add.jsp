<%@include file="../../db/db.jsp" %>

<%
String title = request.getParameter("title");
String author = request.getParameter("author");
String category = request.getParameter("category");
int stock = Integer.parseInt(request.getParameter("stock"));

String sql = "INSERT INTO books(title, author, category, stock) VALUES(?,?,?,?)";

try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, author);
    pstmt.setString(3, category);
    pstmt.setInt(4, stock);
    
    int isSuccess = pstmt.executeUpdate();
    
    if (isSuccess != 0) {
        // success
        response.sendRedirect(request.getContextPath() + "/admin/adminDashboard.jsp");
    }
} catch (Exception e) {
    System.out.print(e);
}
%>