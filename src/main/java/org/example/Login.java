package org.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/loginForm")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           String myemail = req.getParameter("email1");
           String mypass = req.getParameter("pass1");
           try{
             Class.forName("com.mysql.cj.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database_name","user_name","your_password");

               PreparedStatement ps = con.prepareStatement("select * from register where email=? and password=?");
               ps.setString(1,myemail);
               ps.setString(2,mypass);

               ResultSet rs = ps.executeQuery();
               if(rs.next()){
                   HttpSession session = req.getSession();
                   session.setAttribute("userEmail", myemail);

                   resp.sendRedirect("home.jsp");
               }else{
                   req.setAttribute("message",
                           "Email ID and Password didn't match!");

                   RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
                   rd.include(req,resp);
               }
           }catch (Exception e){
               req.setAttribute("message",
                       "Exception Occured : "+e.getMessage());

               RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
               rd.include(req,resp);
           }
    }
}
