<%@include file="../../db/db.jsp" %>

<%
String bookId = request.getParameter("bookId");
String title = request.getParameter("title");
String author = request.getParameter("author");
String category = request.getParameter("category");
String stock = request.getParameter("stock");

String sql = "update books set title=?, author=?, "
        + "category=?, stock=? where id=?";

    System.out.println(bookId);
    System.out.println(title);
    System.out.println(author);
    System.out.println(category);
    System.out.println(stock);
try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, author);
    pstmt.setString(3, category);
    pstmt.setInt(4, Integer.parseInt(stock));
    pstmt.setInt(5, Integer.parseInt(bookId));
    
    int isSuccess = pstmt.executeUpdate();
    
    if (isSuccess != 0) {
        // success
        response.sendRedirect(request.getContextPath() + "/admin/adminDashboard.jsp");
    }
} catch (Exception e) {
    System.out.print(e);
}
%>
