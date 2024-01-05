<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <%@include file="unauthHeader.jsp" %>
    <%
    String role = (String)session.getAttribute("role");
    String sessionId = (String)session.getAttribute("sessionId");
    System.out.println(role);

    if (role != null && sessionId != null) {
        if (role.equals("user")) {
        %>
        <div class="dropdown">
            <button class="dropbtn">
                <p id="librarian-name"><%=sessionId%></p>
            </button>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/user/userDashboard.jsp">Dashboard</a>
                <a href="<%=request.getContextPath()%>/user/account/update.jsp">My Account</a>
                <a href="<%=request.getContextPath()%>/user/book/borrowedHistory.jsp" target="_self">Borrowed Books</a>
                <a href="<%=request.getContextPath()%>/user/book/returnHistory.jsp" target="_self">Return Book History</a>
                <a href="<%=request.getContextPath()%>/action/auth/logout.jsp">Logout</a>
            </div>
        </div>
        <%
        }

        if (role.equals("admin")) {
        %>
        <div class="dropdown">
            <button class="dropbtn">
                <p id="librarian-name"><%=sessionId%></p>
            </button>
            <div class="dropdown-content">
                <a href="<%=request.getContextPath()%>/admin/adminDashboard.jsp">Dashboard</a>
                <a href="<%=request.getContextPath()%>/action/auth/logout.jsp">Logout</a>
            </div>
        </div>
        <%
        }
    } else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
    %>

</header>