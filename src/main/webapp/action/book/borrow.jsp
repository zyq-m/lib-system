<%@include file="../../db/db.jsp" %>

<%
String bookId = request.getParameter("id");
String sql = "select * from books where id = ?";
String sql2 = "update books set stock=? where id=?";
String sql3 = "insert into borrowedbooks(bookId, borrower) values(?,?)";
String sessionId = (String)session.getAttribute("sessionId");

try {
    // stock decrement
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(bookId));
    
    res = pstmt.executeQuery();
    if (res.next()) {
        int stock = res.getInt("stock");
        if (stock > 0) {
            stock--;
            
            // update stock
            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, stock);
            pstmt.setInt(2, Integer.parseInt(bookId));
            
            int isUpdated = pstmt.executeUpdate();
            
            if (isUpdated != 0) {
                pstmt = conn.prepareStatement(sql3);
                pstmt.setInt(1, Integer.parseInt(bookId));
                pstmt.setString(2, sessionId);
                pstmt.executeUpdate();

                response.sendRedirect(request.getContextPath() 
                + "/user/book/borrowedHistory.jsp");
            } else {
            %>
            <script>
                alert("This book out of stock");
                window.location.replace("<%=request.getContextPath()%>/user/userDashboard.jsp");
            </script>
            <%
            }
        }
    }
} catch (Exception e) {
    System.out.println(e);
}
%>