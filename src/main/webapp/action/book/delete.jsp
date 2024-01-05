<%@include file="../../db/db.jsp" %>

<%
String bookId = request.getParameter("id");
String sql = "delete from books where id=?";

try {
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(bookId));
    
    int isSuccess = pstmt.executeUpdate();
    
    if (isSuccess != 0) {
        // success
        response.sendRedirect(request.getContextPath() + "/admin/book/delete.jsp");
    }
} catch (Exception e) {
    System.out.print(e);
}
%>
