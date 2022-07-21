/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.company;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;




import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author pranjwal
 */
@MultipartConfig
public class Reg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws java.io.IOException
     * @throws javax.servlet.ServletException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
             {
        response.setContentType("text/html");
        
            /* TODO output your page here. You may use following sample code. */   
    
        String firstName=request.getParameter("fname");
        String lastName=request.getParameter("lname");
        String password=request.getParameter("pass");
        String email=request.getParameter("email");
        Part part=request.getPart("img");
       
     String filename= part.getSubmittedFileName();
        
        PrintWriter obj=response.getWriter();
    //  obj.print(part);
    //   obj.println(filename);
//connection,query,fire query
//load a driver class
try{

Thread.sleep(2000);
           
   Class.forName("com.mysql.jdbc.Driver");
Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Registration","root","Pranjwal@95");
//query
String q="insert into User(FirstName,LastName,password,Email,imageName) values(?,?,?,?,?)";
    PreparedStatement ps= cn.prepareStatement(q);
ps.setString(1,firstName );
ps.setString(2, lastName);
ps.setString(3, password);
ps.setString(4, email);
ps.setString(5, filename);
 



  //fire query
  ps.executeUpdate();
            //upload a file in images folder
            InputStream is = part.getInputStream();
             // obj.print(is);
              byte[]data=new byte[is.available()];
              is.read(data);
              String path;
              
            path = request.getRealPath("/")+"images"+File.separator+filename;
          // obj.print(path);
         FileOutputStream fos=new FileOutputStream(path);
              fos.write(data);
              fos.close();
              
  obj.println("done");
  
}
catch(  ClassNotFoundException | SQLException e){
  
   obj.println("Error");
   
    
    
}                catch (InterruptedException ex) {                
                     Logger.getLogger(Reg.class.getName()).log(Level.SEVERE, null, ex);
                 }                
//connection





}
    }
}