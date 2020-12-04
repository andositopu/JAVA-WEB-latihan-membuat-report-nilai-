<%-- 
    Document   : galau
    Created on : Nov 30, 2020, 9:02:09 PM
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
            <a href="perintahproject2.jsp">Tambahan Data</a><p></p>
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
                String data= "select * from nilai";
                rs = s.executeQuery(data);
                %>
                <table border="1" cellspasing="0" cellpadding="0" width="100%">
                    <tr>
                        <th>Id</th>
                        <th>Tanggal Nilai</th>
                        <th>Nim</th>
                        <th>Kode Matakuliah</th>
                        <th>Nilai</th>
                        <th>Keterangan</th>
                        <th>Aksi</th>
                    </tr>
                    <%
                    while (rs.next()){
                        %>
                        <tr>
                            <td><%=rs.getString("id") %></td>
                            <td><%=rs.getString("tglnilai") %></td>
                            <td><%=rs.getString("nim") %></td>
                            <td><%=rs.getString("kodemk") %></td>
                            <td><%=rs.getString("nilai") %></td>
                            <td><%=rs.getString("keterangan") %></td>
                            <td>
                                <a href="updateproject2.jsp?u=<%=rs.getString("id")%>">Edit</a>
                                <a href="deleteproject2.jsp?d=<%=rs.getString("id")%>">Hapus</a>
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

