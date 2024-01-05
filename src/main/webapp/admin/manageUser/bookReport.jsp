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
        String username = request.getParameter("username");
            
        String sql = "select bb.id borrowId, b.id bookId, b.title, b.author, "
                + "b.category, "
                + "date_format(bb.date, '%m/%d/%Y %H:%i%p') borrowDate, "
                + "date_format(bb.returnDate, '%m/%d/%Y %H:%i%p') returnDate "
                + "from"
                + " `borrowedbooks` bb inner join books b on bb.bookId = b.id "
                + "where bb.borrower = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);

            res = pstmt.executeQuery();

            if (res.next()) {
            %>
            <form class="cd-form">
                <div class="error-message" id="error-message">
                    <p id="error"></p>
                </div>
                <h2 align='center'><%=username%>'s Book History</h2>
                <table width="100%" cellpadding="10" cellspacing="10">
                    <tbody>
                        <tr>
                            <th>No.<hr></th>
                            <th>Book Id<hr></th>
                            <th>Book Title<hr></th>
                            <th>Author<hr></th>
                            <th>Category<hr></th>
                            <th>Borrow Date<hr></th>
                            <th>Return Date<hr></th>
                        </tr> 
                        <%
                        res = pstmt.executeQuery();
                        int i = 1;
                        while(res.next()) {
                            int bookId = res.getInt("bookId");
                            String title = res.getString("title");
                            String author = res.getString("author");
                            String category = res.getString("category");
                            String borrowDate = res.getString("borrowDate");
                            String returnDate = res.getString("returnDate");
                            %>
                            <tr>
                                <td><%=i%></td>
                                <td><%=bookId%></td>
                                <td><%=title%></td>
                                <td><%=author%></td>
                                <td><%=category%></td>
                                <td><%=borrowDate%></td>
                                <td><%=returnDate%></td>
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
                <h2 align='center'>No record</h2>
                <%
            }
        } catch (Exception e) {
            System.out.print(e);
        }
        %>
    </body>
</html>
