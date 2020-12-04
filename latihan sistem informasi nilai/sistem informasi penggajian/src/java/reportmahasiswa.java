/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;//Provides an output stream for sending binary data to the client. A ServletOutputStream object is normally retrieved via the ServletResponse#getOutputStream method.
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperRunManager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

/**
 *
 * @author rusak pecahkan
 */
@WebServlet(name = "reportmahasiswa", urlPatterns = {"/reportmahasiswa"})
public class reportmahasiswa extends HttpServlet {
   

    public static class JRResultSetDataSource {

        public JRResultSetDataSource() {
        }

        public JRResultSetDataSource(ResulSet rs) {
            throw new UnsupportedOperationException("Not yet implemented");
        }
    }

    public static class ResulSet {

        public ResulSet() {
        }
    }


    private static class JasperRunManager {

        private static void runReportToPdfStream(InputStream reportStream, ServletOutputStream servletOutputStream, HashMap hashMap, JRResultSetDataSource dataSource) {
            throw new UnsupportedOperationException("Not yet implemented");
        }

        public JasperRunManager() {
        }
    }

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet reportmahasiswa</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet reportmahasiswa at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/sisfodik";
            Connection conn= DriverManager.getConnection(url,"root","");
            String sql="SELECT * FROM mahasiswa";
            Statement st= conn.createStatement();
            ResulSet rs= (ResulSet) st.executeQuery(sql);
            
            response.setContentType("aplication/pdf");
/** ets the content type of the response being sent to the client, if the response has not been committed yet. The given content type may include a character encoding specification, for example, text/html;charset=UTF-8. The response's character encoding is only set from the given content type if this method is called before getWriter is called.
This method may be called repeatedly to change content type and character encoding. This method has no effect if called after the response has been committed. It does not set the response's character encoding if it is called after getWriter has been called or after the response has been committed.*/
            ServletOutputStream servletOutputStream= response.getOutputStream();
            InputStream reportStream= getServletConfig().getServletContext().getResourceAsStream("/report/reportmahasiswa.jrmxl");                    
//getservletconfig=Returns a ServletConfig object, which contains initialization and startup parameters for this servlet. The ServletConfig object returned is the one passed to the init method.
//getservletcontext=Returns a reference to the ServletContext in which the caller is executing.
//getresourceasstream=he data in the InputStream can be of any type or length. The path must be specified according to the rules given in getResource. This method returns null if no resource exists at the specified path.
            JRResultSetDataSource dataSource = new JRResultSetDataSource(rs);
            try {
                JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, new HashMap(), dataSource);
                servletOutputStream.flush();
                servletOutputStream.close();
            }
            catch (JRException e){
                System.out.println(e.toString());
            }
        }
        catch (Exception e){
            System.out.println(e.toString());
        }    
    }

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
