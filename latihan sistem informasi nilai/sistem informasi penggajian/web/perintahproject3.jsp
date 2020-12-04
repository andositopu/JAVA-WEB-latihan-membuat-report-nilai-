<%-- 
    Document   : perintahproject3
    Created on : Nov 29, 2020, 10:50:55 PM
    Author     : rusak pecahkan
--%>

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
            <h3 align="center">Add Data</h3><p></p>
            <form action="" method="post"></form>
            <p><label>Id</label><input type="text" nama="id"/></p>
            <p><label>Tanggal Nilai</label><input type="text" nama="tglnilai"/></p>
            <p><label>Nim</label><input type="text" nama="nim"/></p>
            <p><label>Kode Matakuliah</label><input type="text" nama="kodemk"/></p>
            <p><label>Nilai</label><input type="text" nama="nilai"/></p>
            <p>
                <label>Keterangan</label><select nama="keterangan">
                    <option value="UTS">UTS</option>
                    <option value="UAS">UAS</option>
                    <option value="HERR">HERR</option>                 
                </select></p>
                <p><label></label><input type="submit" name="submit" value="Simpan"/>
                    <a href="galau.jsp">Kembali</a></p>
        </div>      
    </body>
</html>
<%
String a=request.getParameter("id");
String b=request.getParameter("tglnilai");
String c=request.getParameter("nim");
String d=request.getParameter("kodemk");
String e=request.getParameter("nilai");
String f=request.getParameter("keterangan");

//membuat akses ke sistem database
String url ="jdbc:mysql://localhost:3306/sisfodik";

//membuat koneksi jdbc ke database agar terkonek nantinya
Connection jdbc = null;
PreparedStatement mysql=null;//precompile ke mysql database

Class.forName("com.mysql.jdbc.Driver").newInstance();
//newIntance()=Creates a new instance of the class represented by this Class object. The class is instantiated as if by a new expression with an empty argument list. The class is initialized if it has not already been initialized.
int updateQuery=0;

//untuk membuat namamk,kodemk, sks, semester supaya tidak kosong
if (a!=null && b!=null && c!=null && d!= null && e!=null && f!=null){
    if (a!="" && b!="" && c!="" && d!="" && e!="" && f!=null){
    try {
        jdbc=DriverManager.getConnection(url,"root","");
        String query="Insert into nilai(id,tglnilai,nim,kodemk,nilai,keterangan) values(?,?,?,?,?,?)";
        mysql=jdbc.prepareStatement(query);
        mysql.setString(1, a);
        mysql.setString(2, b);
        mysql.setString(3, c);
        mysql.setString(4, d);
        mysql.setString(5, e);
        mysql.setString(6, f);
        updateQuery=mysql.executeUpdate();//executeUpdate=Executes the SQL statement in this PreparedStatement object, which must be an SQL Data Manipulation Language (DML) statement, such as INSERT, UPDATE or DELETE; or an SQL statement that returns nothing, such as a DDL statement.
        if (updateQuery!=0){
            JOptionPane.showMessageDialog(null,"Berhasil Menambah Data");
            response.sendRedirect("galau.jsp");
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
       }
%>
