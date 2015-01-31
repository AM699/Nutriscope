package NutriScopus;

import java.util.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class LogIn extends HttpServlet
{
    
  @Override
  public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
  {
        String driver = "com.mysql.jdbc.Driver";
        String db;
        db = "nutriscope";
        String url = "jdbc:mysql://127.0.0.1/";
      
        String user = "angie";
        String pass = "1234";
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        Connection conn = null;
        
        //response.setContentType("text/html");
       
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/",user,pass);
            System.out.println("Connected database successfully...");
            
            Statement stmt = conn.createStatement();
            String sql;
            sql = "SELECT  first, last, pass FROM nutriscope.nutritionists";
            ResultSet rs = stmt.executeQuery(sql);
            HttpSession session = request.getSession();
           
            
            String first=request.getParameter("fname");
            String last=request.getParameter("lname");
            String pwd=request.getParameter("pass");
            System.out.println(first + last + pwd );
            
          
            int found = 0;
            while(rs.next())
            {
                        
                    String fname = rs.getString("first");
                    String lname = rs.getString("last");             
                    String pwd1 = rs.getString("pass");
                        
                    System.out.println("database results:"+fname + lname + pwd1 );
                    if(first.equals(fname)&& last.equals(lname) && pwd.equals(pwd1))
                    { 
                          session.setAttribute("first", fname);
                          session.setAttribute("last", lname);
                          session.setAttribute("pwd", pwd1);
                          Cookie userName = new Cookie("first", fname);
                          
                            
                          System.out.println("database results:"+fname + lname + pwd1 );
                      //  pw.println("<font size='6' color=#43C5E6> welcome <br> " + first +" "+ last+ "</font>");
                          found = 1;
                          
                          
                          response.addCookie(userName);
                          String encodedURL = response.encodeRedirectURL("Intro.jsp");
                          response.sendRedirect(encodedURL);
                      //  response.sendRedirect("/Nutriscope/Intro.jsp");
                        
                    }           
            }
            if(found == 0)
            {   
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
                    pw.println("<font color=#43C5E6>Either user name or password is wrong.</font>");
                    rd.include(request, response);
            }   
            
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request,response);
            rs.close();
            stmt.close();
            conn.close();
            } 
            catch (SQLException ex)
            {
                Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, ex);
            }    
            catch (ClassNotFoundException ex)
            {
                Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, ex);
            }   
  }
}
