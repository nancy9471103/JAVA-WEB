<%-- 
    Document   : eliminarReservacion
    Created on : 18-mar-2021, 22:33:59
    Author     : GISSEL RODRIGUEZ
--%>

<%@include file="seguridadVendedor.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Usuario</title>
    </head>
    <body>
            <%  

       String idr=request.getParameter("idreservacion");
      
       
  try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="DELETE FROM reservacion where id_reservacion like ?";
       pstmt=conex.prepareStatement(consulta);
       pstmt.setString(1,idr);
insertCorrecto=pstmt.executeUpdate();

 request.getRequestDispatcher("usuarioVendedor.jsp").forward(request, response);
pstmt.close();
conex.close();
       }catch(Exception e){
       e.printStackTrace();
       }
       %>
    </body>
</html>

