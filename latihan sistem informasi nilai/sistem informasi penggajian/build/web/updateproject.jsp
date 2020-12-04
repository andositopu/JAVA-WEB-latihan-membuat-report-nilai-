<%-- 
    Document   : updateproject
    Created on : Nov 26, 2020, 7:14:12 PM
    Author     : rusak pecahkan
--%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            *{margin:auto;padding:0;}
            #con2{width: 500px;padding: 30px}
            p{margin-bottom: 10px;}
            label{display: inline-block;width: 150px;}
        </style>
    </head>
    <body>
        <div id="con2">
            <h3 align="center">Update Data</h3><p></p>
            <form action="" method="post"></form>
            <%
            try{
                String host="jdbc:mysql://localhost:3306/sisfodik";
                Connection conn=null;
                Statement s= null;
                ResultSet rs= null;
                Class.forName("com.mysql.jdbc.Driver");
                conn=DriverManager.getConnection(host,"root","");
                s= conn.createStatement();
                String num= request.getParameter("u");
                String data= "select * from mahasiswa where nim='"+num+"'";
                rs = s.executeQuery(data);
                while (rs.next()){
                    %>
                    <p><label>Nim</label><input type="hidden" name="nim" values='<%=rs.getString("nim")%>'/></p>
                    <p><label>Nama</label><input type="text" name="nama" values='<%=rs.getString("nama")%>'/></p>
                    <p><label>Angkatan</label><input type="text" name="angkatan" values='<%=rs.getString("angkatan")%>'/></p>
                    <p><label>Kelamin</label><input type="radio" name="jenis kelamin" values="Laki-laki"/>Laki-laki
                        <input type="radio" name="jenis kelamin" value="Perempuan"/>Perempuan</p>
                    <p><label></label><input type="submit" name="submit" value="Update"/>
                        <a href="index.jsp">Kembali</a></p>
                    <% }
                rs.close();
                s.close();
                conn.close();
                }
            catch (Exception ex){
                System.out.println("Tidak Dapat konek ke Database");
            }
            %>
        </div>
    </body>
</html>

<%
String a=request.getParameter("nim");
String b=request.getParameter("nama");
String c=request.getParameter("jenis kelamin");
String d=request.getParameter("angkatan");

//membuat akses ke sistem database
String url ="jdbc:mysql://localhost:3306/sisfodik";

//membuat koneksi jdbc ke database agar terkonek nantinya
Connection jdbc = null;
PreparedStatement mysql=null;//precompile ke mysql database

Class.forName("com.mysql.jdbc.Driver").newInstance();
//newIntance()=Creates a new instance of the class represented by this Class object. The class is instantiated as if by a new expression with an empty argument list. The class is initialized if it has not already been initialized.
int updateQuery=0;

//untuk membuat nama, kelamin, nim, angkatan supaya tidak kosong
if (a!=null && b!=null && c!=null && d!= null){
    try {
        jdbc=DriverManager.getConnection(url,"root","");
        String query="update mahasiswa set nama=?,jenis kelamin=?,angkatan=? where nim='"+a+"'";
        mysql=jdbc.prepareStatement(query);
        mysql.setString(1, a);
        mysql.setString(2, b);
        mysql.setString(3, c);
        mysql.setString(4, d);
        updateQuery=mysql.executeUpdate();//executeUpdate=Executes the SQL statement in this PreparedStatement object, which must be an SQL Data Manipulation Language (DML) statement, such as INSERT, UPDATE or DELETE; or an SQL statement that returns nothing, such as a DDL statement.
        if (updateQuery!=0){
            JOptionPane.showMessageDialog(null,"Berhasil Update Data");
            response.sendRedirect("index.jsp");
        }
    }
    catch (Exception ex){
        System.out.println("Koneksi gagal");
}
    finally{
        mysql.close();
        jdbc.close();
    }
       }

%>