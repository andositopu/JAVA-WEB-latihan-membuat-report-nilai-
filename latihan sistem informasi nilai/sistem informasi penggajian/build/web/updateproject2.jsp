<%-- 
    Document   : updateproject2
    Created on : Nov 30, 2020, 8:04:47 PM
    Author     : rusak pecahkan
--%>

<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="javax.swing.JOptionPane" %>
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
                String data= "select * from nilai where id='"+num+"'";
                rs = s.executeQuery(data);
                while (rs.next()){
                    %>
                    <p><label></label><input type="hidden" nama="id" value='<%=rs.getString("id")%>'/></p>
                    <p><label></label><input type="hidden" nama="tglnilai" value='<%=rs.getString("tglnilai")%>'/></p>
                    <p><label></label><input type="hidden" nama="nim" value='<%=rs.getString("nim")%>'/></p>
                    <p><label></label><input type="hidden" nama="kodemk" value='<%=rs.getString("kodemk")%>'/></p>
                    <p><label></label><input type="text" nama="nilai" value='<%=rs.getString("nilai")%>'/></p>
                     <p>
                <label>Keterangan</label><select nama="keterangan">
                    <option value="UTS">UTS</option>
                    <option value="UAS">UAS</option>
                    <option value="HERR">HERR</option>                 
                </select></p>
                <p><label></label><input type="submit" name="submit" value="Simpan"/>
                    <a href="galau.jsp">Kembali</a></p>
                <%
                }
                rs.close();
                s.close();
                conn.close();
                }
            catch (Exception ex){
                System.out.println("Tidak Dapat konek ke Database");
                }
            %>              
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

//untuk membuat kodemk, namamk, SKS, semester angkatan supaya tidak kosong
if (a!=null && b!=null && c!=null && d!= null && e!=null && f!=null){
    if (a!=null && b!="" && c!="" && d!="" && e!="" && f!=""){
    try {
        jdbc=DriverManager.getConnection(url,"root","");
        String query="update nilai set nilai=?, keterangan=? where id='"+a+"'";
        mysql=jdbc.prepareStatement(query);
        mysql.setString(1, e);
        mysql.setString(2, f);
        updateQuery=mysql.executeUpdate();//executeUpdate=Executes the SQL statement in this PreparedStatement object, which must be an SQL Data Manipulation Language (DML) statement, such as INSERT, UPDATE or DELETE; or an SQL statement that returns nothing, such as a DDL statement.
        if (updateQuery!=0){
            JOptionPane.showMessageDialog(null,"Berhasil Update Data");
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
