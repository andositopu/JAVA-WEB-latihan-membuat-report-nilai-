<%-- 
    Document   : deleteproject1
    Created on : Nov 29, 2020, 10:13:06 PM
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
            st.executeUpdate("DELETE FROM `mata kuliah` WHERE kodemk='"+id+"'");
            response.sendRedirect("ando.jsp");
        }
        catch(Exception e){}
        %>
    </body>
</html>
