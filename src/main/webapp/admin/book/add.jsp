<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LMS</title>
        <link rel="stylesheet" type="text/css" href="../../static/css/admin/header_libiran_style.css" />        
        <link rel="stylesheet" type="text/css" href="../../static/css/global_styles.css" />
        <link rel="stylesheet" type="text/css" href="../../static/css/form_styles.css" />
        <link rel="stylesheet" type="text/css" href="../../static/css/admin/insert_book_style.css">
    </head>
    <body>
        <%@include file="../../layout/header.jsp" %>
        <form class="cd-form" method="POST" action="../../action/book/add.jsp">
            <center><legend>Add New Book Details</legend></center>

            <div class="error-message" id="error-message">
                <p id="error"></p>
            </div>

            <div class="icon">
                <input class="b-title" type="text" name="title" placeholder="Book Title" required />
            </div>

            <div class="icon">
                <input class="b-author" type="text" name="author" placeholder="Author Name" required />
            </div>

            <div>
            <h4>Category</h4>

                <p class="cd-select icon">
                    <select class="b-category" name="category">
                        <option>Choose...</option>
                        <option>History</option>
                        <option>Comics</option>
                        <option>Fiction</option>
                        <option>Non-Fiction</option>
                        <option>Biography</option>
                        <option>Medical</option>
                        <option>Fantasy</option>
                        <option>Education</option>
                        <option>Sports</option>
                        <option>Technology</option>
                        <option>Literature</option>
                    </select>
                </p>
            </div>

            <div class="icon">
                <input class="b-copies" type="number" name="stock" placeholder="Stock" required />
            </div>

            <br />
            <input class="b-isbn" type="submit" name="b_add" value="Add book" />
        </form>
    <body/>
</html>
