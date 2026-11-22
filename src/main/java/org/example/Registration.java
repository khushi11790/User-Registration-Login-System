package org.example;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import static java.lang.System.out;

@WebServlet("/regForm")
public class Registration extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String myname = req.getParameter("name1");
        String myemail = req.getParameter("email1");
        String mypass = req.getParameter("pass1");
        String mygender = req.getParameter("gender1");
        String mycity = req.getParameter("city1");
        PrintWriter out = resp.getWriter();
        try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("database_url","user_name","your_password");

            PreparedStatement ps = con.prepareStatement("Insert into register values(?,?,?,?,?)");
            ps.setString(1,myname);
            ps.setString(2,myemail);
            ps.setString(3,mypass);
            ps.setString(4,mygender);
            ps.setString(5,mycity);

            int count = ps.executeUpdate();
            if(count>0){
//                resp.setContentType("text/html");
//                out.print("<h3 style='color:green'>User registered Successfully</h3>");
                req.setAttribute("message", "User registered Successfully");
                req.setAttribute("msgType", "success");
                RequestDispatcher rd = req.getRequestDispatcher("/registration.jsp");
                rd.include(req,resp);
            }else{
//                resp.setContentType("text/html");
//                out.print("<h3 style='color:red'>User not registered due to some error</h3>");
                req.setAttribute("message", "User not registered due to some error");
                req.setAttribute("msgType", "error");
                RequestDispatcher rd = req.getRequestDispatcher("/registration.jsp");
                rd.include(req,resp);

            }
        }catch(Exception e){
//            resp.setContentType("text/html");
//            out.print("<h3 style='color:red'> Exception Occured : "+e.getMessage()+"</h3>");
            req.setAttribute("message", "User not registered due to some error");
            req.setAttribute("msgType", "error");
            RequestDispatcher rd = req.getRequestDispatcher("/registration.jsp");
            rd.include(req,resp);
        }

    }
}
