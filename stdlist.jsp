<%@page import="net.tutor.Student"%> 
<%@page import="java.util.ArrayList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
  <head> 
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
   <title>Student List</title> 
  </head> 
  <body> 
 
 <%-- Problem: data from servlet is always null, should connect to DataStudentServlet --%>
      <h1>Displaying Student List</h1> 
      <h2><%= request.getAttribute("name") %></h2>
      <table border ="1" width="500" align="center"> 
         <tr bgcolor="00FF7F"> 
          <th><b>Student Name</b></th> 
          <th><b>Student Age</b></th> 
          <th><b>Course Undertaken</b></th> 
         </tr> 
        <%-- Fetching the attributes of the request object 
             which was previously set by the servlet  
              "StudentServlet.java" 
        --%>  
       
        </table>  
        <hr/> 
    </body> 
</html> 