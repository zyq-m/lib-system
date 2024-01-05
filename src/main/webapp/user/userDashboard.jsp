<%@include file="../db/db.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LMS</title>
        <link rel="stylesheet" type="text/css" href="../static/css/user/header_member_style.css" />
        <link rel="stylesheet" type="text/css" href="../static/css/global_styles.css">
        <link rel="stylesheet" type="text/css" href="../static/css/user/home_style.css">
        <link rel="stylesheet" type="text/css" href="../static/css/custom_radio_button_style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    </head>
    <body>
        <%@include file="../layout/header.jsp" %>
        <%
        try {
            pstmt = conn.prepareStatement("SELECT * FROM books");

            res = pstmt.executeQuery();

            if (res.next()) {
            %>
            <form class="cd-form">
                <div class="error-message" id="error-message">
                    <p id="error"></p>
                </div>
                <table width="100%" cellpadding="10" cellspacing="10">
                    <tbody>
                        <tr>
                            <th>Book Id<hr></th>
                            <th>Book Title<hr></th>
                            <th>Author<hr></th>
                            <th>Category<hr></th>
                            <th>Stock<hr></th>
                            <th>Action<hr></th>
                        </tr> 
                        <%
                        res = pstmt.executeQuery();
                        while(res.next()) {
                            int id = res.getInt("id");
                            String title = res.getString("title");
                            String author = res.getString("author");
                            String category = res.getString("category");
                            int stock = res.getInt("stock");
                            String redirect = request.getContextPath() 
                            + "/action/book/borrow.jsp?id=" + id;
                            
                            if (stock > 0) {
                                %>
                                <tr>
                                    <td><%=id%></td>
                                    <td><%=title%></td>
                                    <td><%=author%></td>
                                    <td><%=category%></td>
                                    <td><%=stock%></td>
                                    <td>
                                        <div class="text-center">
                                            <a href="<%=redirect%>" 
                                               style="color:#F66; 
                                               text-decoration:none;">Borrow</a>
                                        </div>
                                    </td>
                                </tr>
                                <%
                            }
                        }
                        %>
                    </tbody>
                </table>
            </form>
            <%
            }else {
                %>
                <h2 align='center'>No books available</h2>
                <%
            }
        } catch (Exception e) {
            System.out.print(e);
        }
        %>
    </body>
</html>
