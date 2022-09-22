<%-- 
    Document   : eliminarhabitacion
    Created on : 19-mar-2021, 14:30:12
    Author     : GISSEL RODRIGUEZ
--%>
<%@include file="seguridadAdmin.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Habitacion</title>
    </head>
    <body>
            <%  

       String idv=request.getParameter("pidv");
      
       
  try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="DELETE FROM vendedores where id_vendedor like ?";
       pstmt=conex.prepareStatement(consulta);
       pstmt.setString(1,idv);
insertCorrecto=pstmt.executeUpdate();

 request.getRequestDispatcher("vendedor.jsp").forward(request, response);
pstmt.close();
conex.close();
       }catch(Exception e){
       e.printStackTrace();
       }
       %>
    </body>
</html>