<%@include file="../../db/db.jsp" %>

<%
String bookId = request.getParameter("bookId");
String borrowId = request.getParameter("borrowId");
String sql = "select * from books where id=?";
String sql2 = "update books set stock=? where id=?";
String sql3 = "update borrowedbooks set returnDate=current_timestamp"
        + " where id=?";

try {
    // get stock
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(bookId));
    
    res = pstmt.executeQuery();
    if (res.next()) {
        int stock = res.getInt("stock");
        stock++;

        // update stock
        pstmt = conn.prepareStatement(sql2);
        pstmt.setInt(1, stock);
        pstmt.setInt(2, Integer.parseInt(bookId));

        int isUpdated = pstmt.executeUpdate();

        if (isUpdated != 0) {
            pstmt = conn.prepareStatement(sql3);
            pstmt.setInt(1, Integer.parseInt(borrowId));
            pstmt.executeUpdate();

            response.sendRedirect(request.getContextPath() 
            + "/user/book/returnHistory.jsp");
        } else {
        %>
        <script>
            alert("Failed");
            window.location.replace("<%=request.getContextPath()%>/user/userDashboard.jsp");
        </script>
        <%
        }
    }
} catch (Exception e) {
    System.out.println(e);
}
%>