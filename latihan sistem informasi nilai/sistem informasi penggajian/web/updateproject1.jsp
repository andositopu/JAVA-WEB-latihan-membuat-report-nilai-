<%-- 
    Document   : updateproject1
    Created on : Nov 29, 2020, 9:25:32 PM
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
                String data= "select * from `mata kuliah` where kodemk='"+num+"'";
                rs = s.executeQuery(data);
                while (rs.next()){
                    %>
                    <p><label>KodeMK</label><input type="hidden" name="kodemk" values='<%=rs.getString("kodemk")%>'/></p>
                    <p><label>NamaMK</label><input type="text" name="namamk" values='<%=rs.getString("namamk")%>'/></p>
                    <p><label>SKS</label><input type="text" name="SKS" values='<%=rs.getString("SKS")%>'/></p>
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
                    <p><label></label><input type="submit" name="submit" value="Update"/>
                        <a href="ando.jsp">Kembali</a></p>
                    <% }
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

//untuk membuat kodemk, namamk, SKS, semester angkatan supaya tidak kosong
if (a!=null && b!=null && c!=null && d!= null){
    try {
        jdbc=DriverManager.getConnection(url,"root","");
        String query="update `mata kuliah` set namamk=?, SKS=?,semester=? where kodemk='"+a+"'";
        mysql=jdbc.prepareStatement(query);
        mysql.setString(1, a);
        mysql.setString(2, b);
        mysql.setString(3, c);
        mysql.setString(4, d);
        updateQuery=mysql.executeUpdate();//executeUpdate=Executes the SQL statement in this PreparedStatement object, which must be an SQL Data Manipulation Language (DML) statement, such as INSERT, UPDATE or DELETE; or an SQL statement that returns nothing, such as a DDL statement.
        if (updateQuery!=0){
            JOptionPane.showMessageDialog(null,"Berhasil Update Data");
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