<%-- 
    Document   : index
    Created on : Nov 26, 2020, 5:01:10 PM
    Author     : rusak pecahkan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Utama Sistem Informasi Database Nilai </title>
        <style type="text/css">
            *{
                padding:0 px;
                margin : 0 px;              
            }
            #header {
                margin : auto;
                width: 50 px;
                font-family: Arial,Helvetica, sans-serif;
                
            }
            u1,ol {
                list-style: none;
            }
            .nav l1 a {
                text-decoration: none;
                background-color: #000;
                color: #fff;
                padding: 10 px 14 px;
                display: block;
            }
            .nav l1 a:hover {
                background-color: #434343;
            }
            .nav > l1 {
                float:left;
            }
            .nav l1 u1{
                display: none;
                position: absolute;
                min-width: 140px;
            }
            .nav l1:hover>u1{
                display: block;
            }
            .nav l1 u1 l1{
                position: relative;
            }
            .nav li u1 li u1{
                rigth:-140px;
                top:0px;
            }
        </style>
            
    </head>
    <body>
        <div id="header">
            <u1 class="nav">
                <l1><a href="utama.jsp">Mahasiswa</a></l1>
                <l1><a href="utama1.jsp">Matakuliah</a></l1>
                <l1><a href="utama2.jsp">Nilai</a></l1>
                <l1><a href="">Laporan</a></l1>
            <u1>
            <l1><a href="http://localhost:8080/Sistem_Informasi_Database_Nilai/report mahasiswa">Laporan Mahasiswa</a></l1>
           <l1><a href="http://localhost:8080/Sistem_Informasi_Database_Nilai/report matakuliah">Laporan Matakuliah</a></l1>
           <l1><a href="http://localhost:8080/Sistem_Informasi_Database_Nilai/report nilai">Laporan Nilai</a></l1>
        </u1>
           
            <l1><a hreff="kontak.jsp">Kontak</a></l1>
            </u1>
        </div>
        
    </body>
</html>
