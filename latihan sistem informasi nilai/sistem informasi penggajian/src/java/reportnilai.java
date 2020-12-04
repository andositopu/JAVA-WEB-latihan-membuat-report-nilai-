/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.HashMap;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author rusak pecahkan
 */
@WebServlet(name = "reportnilai", urlPatterns = {"/reportnilai"})
public class reportnilai extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/sisfodik";
            Connection conn = DriverManager.getConnection(url,"root","");
            String SQL = "SELECT * FROM nilai";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(SQL);
            response.setContentType("aplication/pdf");
            ServletOutputStream sos = response.getOutputStream();
            InputStream reportStream = getServletConfig().getServletContext().getResourceAsStream("report/reportnilai.jrxml");
            JRResultSetDataSource ds = new JRResultSetDataSource(rs);
            try {
                JasperRunManager.runReportToPdfStram(reportStream, sos, new HashMap(), ds);
                sos.flush();
                sos.close();
            }
            catch (JRException e){
                System.out.println(e.toString());
            }
        }
            catch (Exception e){
                System.out.println(e.toString()); //toString = Returns a short description of this throwable
            }
        }
    

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
