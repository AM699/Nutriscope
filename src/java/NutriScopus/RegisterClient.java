/**
 *
 * @author Aggeliki Grigoropouloy
 */
package NutriScopus;

//import java.io.*;
import java.util.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;


public class RegisterClient extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        String driver = "com.mysql.jdbc.Driver";
        String db;
        db = "nutriscope";
        String url = "jdbc:mysql://127.0.0.1/";

        String user = "angie";
        String pass = "1234";
        Connection conn = null;
       
        int cid = 0;

        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "angie", "1234");
            System.out.println("Connected database successfully...");
            
            System.out.println("Inserting records into the table...");
            
            
            String First = request.getParameter("firstname");
            String Last = request.getParameter("lastname");
            String Pwd = request.getParameter("fitbitpass");
            String Pwd1 = request.getParameter("fitbitpass1");
            String Gender = request.getParameter("gender");
            String Age = request.getParameter("age");
            String Height = request.getParameter("height");
            String Weight = request.getParameter("weight");
            String Fat = request.getParameter("fat");
            String Water = request.getParameter("water");
            String Phone = request.getParameter("phone");
            String Address = request.getParameter("address");
            String City = request.getParameter("city");
            
            System.out.println( First + Last + Pwd + Pwd1 + Gender + Age + Height + Weight + Fat + Water + Phone + Address + City);
            
            Class.forName(driver).newInstance();  
            conn = DriverManager.getConnection(url+db,"angie", "1234");
            
            Statement stmt = conn.createStatement();
            String sql;
            sql = "SELECT cid FROM nutriscope.clients";
            ResultSet rs = stmt.executeQuery(sql);
            
            try
                (PreparedStatement stmt2 = (PreparedStatement) conn.prepareStatement("insert into nutriscope.clients (cid, firstname, lastname, fitbitpass, fitbitpass1, gender, age, height, weight, fat, water, phone, address, city) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)")) 
            {
                while(rs.next())
                {
                    cid = rs.getInt("cid");
                        
                    System.out.println("clients cid:" +cid );  
                }
                
                stmt2.setInt(1,cid+1);
                stmt2.setString(2, First);
                stmt2.setString(3, Last);
                stmt2.setString(4, Pwd);
                stmt2.setString(5, Pwd1);
                stmt2.setString(6, Gender);
                stmt2.setString(7, Age);
                stmt2.setString(8, Height);
                stmt2.setString(9, Weight);
                stmt2.setString(10, Fat);
                stmt2.setString(11, Water);
                stmt2.setString(12, Phone);
                stmt2.setString(13, Address);
                stmt2.setString(14, City);
                
                int i= stmt2.executeUpdate();
                
                
                System.out.println("Inserted records into the table...");
                String msg=" ";
                if(i!=0)
                {  
                    msg="You have successfully registered your client";
                    pw.println("<font size='4' color=#43C5E6>" + msg + "</font>");
                    RequestDispatcher req = request.getRequestDispatcher("newClient.html");
                    req.include(request, response);
                    
                }
                else
                {  
                    msg="failed to insert the data";
                    pw.println("<font size='6' color=#43C5E6>" + msg + "</font>");
                    RequestDispatcher req = request.getRequestDispatcher("newClient.html");
                    req.include(request, response);
                }
            }
            
            }
            catch (SQLException ex) 
            {
                    // handle any errors
                    System.out.println("SQLException: " + ex.getMessage());
                    System.out.println("SQLState: " + ex.getSQLState());
                    System.out.println("VendorError: " + ex.getErrorCode());
                    ex.printStackTrace();
            } 
            catch (ClassNotFoundException cnfe) 
            {
                    System.out.println("class not found");
            } catch (InstantiationException ex) { 
            Logger.getLogger(RegisterClient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(RegisterClient.class.getName()).log(Level.SEVERE, null, ex);
        } 

            finally 
            {
                    pw.close();
            }
    }
}
