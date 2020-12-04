<%-- 
    Document   : deleteproject2
    Created on : Nov 30, 2020, 8:54:10 PM
    Author     : rusak pecahkan
--%>

<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String id=request.getParameter("d");
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sisfodik","root","");  
            Statement st= conn.createStatement();
            st.executeUpdate("DELETE FROM nilai WHERE id='"+id+"'");
            response.sendRedirect("galau.jsp");
        }
        catch(Exception e){}
        %>
    </body>
</html>