<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LMS</title>
        <link rel="stylesheet" type="text/css" href="../static/css/admin/header_libiran_style.css" />
        <link rel="stylesheet" type="text/css" href="../static/css/admin/home_style.css" />
    </head>
    <body>
        <%@include file="../layout/header.jsp" %>
        <div id="allTheThings">
            <a href="book/add.jsp">
                <input type="button" value="Add Book" />
            </a><br />

            <a href="book/update.jsp">
                <input type="button" value="Update Book" />
            </a><br />

            <a href="book/delete.jsp">
                <input type="button" value="Delete Book" />
            </a><br />

            <a href="manageUser/index.jsp">
                <input type="button" value="Manage User" />
            </a><br />
        </div>
    </body>
</html>
