<%-- 
    Document   : perintahproject
    Created on : Nov 26, 2020, 5:50:46 PM
    Author     : rusak pecahkan
--%>
//pada tahap ini untuk mengatur/membuat perintah database tentang "mahasiswa"
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            *{margin:auto;
              padding:0;
            }
            #con2{
                width:500px;
                padding: 30px;
            }
            p {
                margin-bottom: 10px;
            }
            label{
                width: 150px;
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <div id="con2">
            <h3 align="center">Tambah Data</h3><p></p>
            <form action="" method="post"></form>
            <p><label>Nama</label><input type="text" name="nama"/></p>
            <p><label>Jenis Kelamin</label><input type="radio" name="jenis kelamin" value="Laki-laki"/>Laki-laki<input type="radio" name="kelamin" value="perempuan"/>Perempuan</p>
            <p><label>Angkatan</label><input type="text" name="angkatann"/></p>
            <p><label></label><input type="submit" name="submit" value="Simpan"/>
                <a href="utama.jsp">Kembali</a></p>
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
        String query="Insert into mahasiswa(nim,nama,jenis kelamin,angkatan) values(?,?,?,?)";
        mysql=jdbc.prepareStatement(query);
        mysql.setString(1, a);
        mysql.setString(2, b);
        mysql.setString(3, c);
        mysql.setString(4, d);
        updateQuery=mysql.executeUpdate();//executeUpdate=Executes the SQL statement in this PreparedStatement object, which must be an SQL Data Manipulation Language (DML) statement, such as INSERT, UPDATE or DELETE; or an SQL statement that returns nothing, such as a DDL statement.
        if (updateQuery!=0){
            JOptionPane.showMessageDialog(null,"Berhasil Menambah Data");
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