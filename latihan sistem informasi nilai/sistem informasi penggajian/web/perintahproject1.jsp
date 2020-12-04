<%-- 
    Document   : perintahproject1
    Created on : Nov 29, 2020, 8:12:27 PM
    Author     : rusak pecahkan
--%>
//pada tahap ini untuk membuat perintah/coding tentang database "mata kuliah"

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
            <p><label>Mata Kuliah</label><input type="text" nama="kodemk"/></p>
            <p><label>Nama Matakuliah</label><input type="text" nama="namamk"/></p>
            <p><label>SKS</label><input type="text" nama="SKS"/></p>
            <p>
                <label>Semester</label><select nama="semester">
                    <option value="I">I</option>
                    <option value="II">II</option>
                    <option value="III">III</option>
                    <option value="IV">IV</option>
                    <option value="V">V</option>
                    <option value="VI">VI</option>
                    <option value="VII">VII</option>
                    <option value="VIII">VIII</option>
                    <option value="IX">IX</option>
                    <option value="X">X</option>
                </select></p>
                <p><label></label><input type="submit" name="submit" value="Simpan"/>
                    <a href="ando.jsp">Kembali</a></p>
        </div>      
    </body>
</html>
<%
String a=request.getParameter("kodemk");
String b=request.getParameter("namamk");
String c=request.getParameter("SKS");
String d=request.getParameter("semester");

//membuat akses ke sistem database
String url ="jdbc:mysql://localhost:3306/sisfodik";

//membuat koneksi jdbc ke database agar terkonek nantinya
Connection jdbc = null;
PreparedStatement mysql=null;//precompile ke mysql database

Class.forName("com.mysql.jdbc.Driver").newInstance();
//newIntance()=Creates a new instance of the class represented by this Class object. The class is instantiated as if by a new expression with an empty argument list. The class is initialized if it has not already been initialized.
int updateQuery=0;

//untuk membuat namamk,kodemk, sks, semester supaya tidak kosong
if (a!=null && b!=null && c!=null && d!= null){
    try {
        jdbc=DriverManager.getConnection(url,"root","");
        String query="Insert into `mata kuliah`(kodemk,namamk,SKS,semester) values(?,?,?,?)";
        mysql=jdbc.prepareStatement(query);
        mysql.setString(1, a);
        mysql.setString(2, b);
        mysql.setString(3, c);
        mysql.setString(4, d);
        updateQuery=mysql.executeUpdate();//executeUpdate=Executes the SQL statement in this PreparedStatement object, which must be an SQL Data Manipulation Language (DML) statement, such as INSERT, UPDATE or DELETE; or an SQL statement that returns nothing, such as a DDL statement.
        if (updateQuery!=0){
            JOptionPane.showMessageDialog(null,"Berhasil Menambah Data");
            response.sendRedirect("ando.jsp");
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