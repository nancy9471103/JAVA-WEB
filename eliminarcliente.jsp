<%-- 
    Document   : eliminarcliente
    Created on : 19-mar-2021, 14:52:02
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
        <title>Eliminar Cliente</title>
    </head>
    <body>
            <%  

       String idcli=request.getParameter("pidcli");
      
       
  try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="DELETE FROM clientes where id_cliente like ?";
       pstmt=conex.prepareStatement(consulta);
       pstmt.setString(1,idcli);
insertCorrecto=pstmt.executeUpdate();

 request.getRequestDispatcher("cliente.jsp").forward(request, response);
pstmt.close();
conex.close();
       }catch(Exception e){
       e.printStackTrace();
       }
       %>
    </body>
</html>

