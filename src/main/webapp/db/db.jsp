<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<% 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet res = null;
try {
    /* Create string of connection url within specified format with machine name, 
    port number and database name. Here machine name id localhost and 
    database name is usermaster. */ 
    String connectionURL = "jdbc:mysql://localhost:3306/lib_db"; 

    // declare a connection by using Connection interface 
    conn = null; 

    // Load JBBC driver "com.mysql.jdbc.Driver" 
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance(); 

    /* Create a connection by using getConnection() method that takes parameters of 
    string type connection url, user name and password to connect to database. */ 
    conn = DriverManager.getConnection(connectionURL, "root", "");

    // check weather connection is established or not by isClosed() method 
    if(!conn.isClosed())
        System.out.println("Successfully connected to " + "MySQL server using TCP/IP...");
}
catch(Exception ex){
    System.out.println("Unable to connect to database.");
}
%>