<%-- 
    Document   : ando
    Created on : Nov 29, 2020, 10:16:43 PM
    Author     : rusak pecahkan
--%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Utama Page</title>
    </head>
    <body>
        <div id="con">
            <h3 align="center">Aplikasi Pembuatan Web Informasi Nilai</h3>
            <a href="perintahproject1.jsp">Tambahan Data</a><p></p>
            <%
            try {
                String host="jdbc:mysql://localhost:3306/sisfodik";
                Connection conn=null;
                Statement s= null;
                ResultSet rs= null;
                Class.forName("com.mysql.jdbc.Driver");
                conn=DriverManager.getConnection(host,"root","");
                s= conn.createStatement();
                String num= request.getParameter("u");
                String data= "select * from `mata kuliah`";
                rs = s.executeQuery(data);
                %>
                <table border="1" cellspasing="0" cellpadding="0" width="100%">
                    <tr>
                        <th>Kode Matakuliah</th>
                        <th>Nama Matakuliah</th>
                        <th>SKS</th>
                        <th>Semester</th>
                        <th>Keterangan</th>
                    </tr>
                    <%
                    while (rs.next()){
                        %>
                        <tr>
                            <td><%=rs.getString("kodemk") %></td>
                            <td><%=rs.getString("namamk") %></td>
                            <td><%=rs.getString("SKS") %></td>
                            <td><%=rs.getString("semester") %></td>
                            <td>
                                <a href="updateproject1.jsp?u=<%=rs.getString("kodemk")%>">Edit</a>
                                <a href="deleteproject1.jsp?d=<%=rs.getString("kodemk")%>">Hapus</a>
                            </td>
                        </tr>
                        <%
                    }
                %>
                </table>
                <%
                rs.close();
                s.close();
                conn.close();
            }
            catch (Exception ex){
                System.out.println("Tidak dapat konek ke database");
            }
            %>
        </div>
    </body>
</html>
