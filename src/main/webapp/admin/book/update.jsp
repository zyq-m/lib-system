<%@include file="../../db/db.jsp" %>
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
        <div class="cd-form">
            <center><legend>Update A Book</legend></center>
        </div>
        <form class="cd-form" onchange="">
            <h4>Choose a book first</h4>
            <select name="id">
                <option>Choose</option>
                <%
                try {
                    pstmt = conn.prepareStatement("SELECT * FROM books");

                    res = pstmt.executeQuery();
                    while(res.next()) {
                        int id = res.getInt("id");
                        String title = res.getString("title");
                        %>
                        <option value="<%=id%>"><%=title%></option>
                        <%
                    }
                } catch (Exception e) {
                    System.out.print(e);
                }
                %>
            </select>
            <br/>
            <input class="b-isbn" type="submit" name="update" 
                   value="Choose Book" />
        </form>
            
            
        <%
        String isUpdate = request.getParameter("update");
        String bookId = request.getParameter("id");
        
        if (bookId != null && !bookId.equals("Choose") 
        && isUpdate != null && isUpdate.equals("Choose Book")) {
            try {
                pstmt = conn.prepareStatement("SELECT * FROM books WHERE id = ?");
                pstmt.setInt(1, Integer.parseInt(bookId));

                res = pstmt.executeQuery();
                while(res.next()) {
                    int id = res.getInt("id");
                    int stock = res.getInt("stock");
                    String title = res.getString("title");
                    String author = res.getString("author");
                    String category = res.getString("category");
                    %>
                    <form class="cd-form" method="" 
                          action="../../action/book/update.jsp">

                        <div class="error-message" id="error-message">
                            <p id="error"></p>
                        </div>
                        <div class="icon">
                            <h4>Title</h4>
                            <input class="b-title" type="text" name="title" 
                                   placeholder="Book Title" required 
                                   value="<%=title%>"/>
                            <input hidden name="bookId" value="<%=id%>"/>
                        </div>
                        <div class="icon">
                            <h4>Author Name</h4>
                            <input class="b-author" type="text" 
                                   name="author" 
                                   placeholder="Author Name" required
                                   value="<%=author%>"/>
                        </div>

                        <div>
                        <h4>Category</h4>
                            <p class="cd-select icon">
                                <select class="b-category" name="category" 
                                        value="<%=category%>">
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
                            <h4>Stock</h4>
                            <input class="b-copies" type="number" name="stock" 
                                   placeholder="Number of Copies" required
                                   value="<%=stock%>"/>
                        </div>

                        <br />
                        <input class="b-isbn" type="submit" name="b_add" 
                               value="Update Book" />
                    </form>
                    <%
                }
            } catch (Exception e) {
                System.out.print(e);
            }
        }
        %>
    <body/>
</html>
