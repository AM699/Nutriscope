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


public class Register extends HttpServlet {


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
       
        int id = 0;

        
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            
            System.out.println("Connecting to a selected database...");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "angie", "1234");
            System.out.println("Connected database successfully...");
            
            System.out.println("Inserting records into the table...");
            
            
            String First = request.getParameter("fname");
            String Last = request.getParameter("lname");
            String Pwd = request.getParameter("pass");
            String Pwd1 = request.getParameter("pass1");
            String Age = request.getParameter("age");
            String Gender = request.getParameter("gender");
            String Phone = request.getParameter("phone");
            String Address = request.getParameter("address");
            String StreetNum = request.getParameter("street");
            String City = request.getParameter("city");
            
            System.out.println( First + Last + Pwd + Pwd1 + Age + Gender + Phone + Address + StreetNum + City);
            
            Class.forName(driver).newInstance();  
            conn = DriverManager.getConnection(url+db,"angie", "1234");
            
            Statement stmt = conn.createStatement();
            String sql;
            sql = "SELECT id FROM nutriscope.nutritionists";
            ResultSet rs = stmt.executeQuery(sql);
            
            
            PreparedStatement stmt1 =(PreparedStatement) conn.prepareStatement("insert into nutritionists (id, first, last, pass, pass1, age, gender, phone, address, streetNum, city) values(?,?,?,?,?,?,?,?,?,?,?)");
           

            while(rs.next())
            {
                    id = rs.getInt("id");
                        
                    System.out.println("database results:" +id );  
            }
            
            stmt1.setInt(1,id+1);
            stmt1.setString(2, First);
            stmt1.setString(3, Last);
            stmt1.setString(4, Pwd);
            stmt1.setString(5, Pwd1);
            stmt1.setString(6, Age);
            stmt1.setString(7, Gender);
            stmt1.setString(8, Phone);
            stmt1.setString(9, Address);
            stmt1.setString(10, StreetNum);
            stmt1.setString(11, City);

            int i= stmt1.executeUpdate();
     
            
            System.out.println("Inserted records into the table...");
            String msg=" ";
            if(i!=0)
            {  
                    msg="You have successfully signed up!";
                    pw.println("<font size='6' color=#43C5E6>" + msg + "</font>");  
            }  
            else
            {  
                    msg="failed to insert the data";
                    pw.println("<font size='6' color=#43C5E6>" + msg + "</font>");
            }  
            stmt1.close();
            RequestDispatcher req = request.getRequestDispatcher("register.html");
            req.include(request, response);
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
            } 
            catch (InstantiationException ex) 
            {
                     Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            } 
            catch (IllegalAccessException ex)
            {
                      Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
            }
            finally 
            {
                    pw.close();
            }
    }
}
