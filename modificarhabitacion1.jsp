--%>
<%@include file="seguridadAdmin.jsp" %> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        
        <title>Modificar Usuario</title>
    </head>
    <body>
        <%  
            String codig2=request.getParameter("piduser");
            String pNombre=request.getParameter("pnombre");
      if(request.getParameter("modificar")!=null)
      {
      String codigon=request.getParameter("txtidusuario");
      String nombren=request.getParameter("txtnombre");
      
      try {
          
          bdSegura dbs=new bdSegura();
          Connection conex=dbs.conSeg();
          PreparedStatement pstmt=null;
          int correcto=0;
          String consulta="UPDATE habitaciones set nombre_hab=? where id_habitacion like ? ";
          pstmt=conex.prepareStatement(consulta);
          pstmt.setString(1,nombren);
          pstmt.setString(2,codigon);
        correcto=pstmt.executeUpdate();
        
        if(correcto>=1)
        {
       %>
       <div class="alert alert-danger" role="alert" align="center">Habitacion modificada</div>
       
      
       
      
       <%
           
      request.getRequestDispatcher("habitacion.jsp").forward(request, response);
    }else  { 
      
%>

<div class="alert alert-success" role="alert" align="center">La Habitacion no se pudo modificar!!</div>

<%
}

%>

<div class="alert alert-danger" role="alert" align="center">Habitacion No se pudo Modificar!!</div>

<%

pstmt.close();
conex.close();
}catch(Exception e)
{
e.printStackTrace();


       %>

<div class="alert alert-danger" role="alert" align="center">Habitacion No se Modifico!!</div>

<%
     } 
}
     
            %>
        
        
        
        <h1>Ingrese Informacion De Reservacion</h1>
         <form  method="POST" action="modificarhabitacion1.jsp">
             
  <div class="mb-3">
    <label  class="form-label">Codigo Habitacion</label>
    <input type="text" class="form-control" id="idusuario" name="txtidusuario" value="<%=codig2%>" readonly="">
      </div>
     
            
             <div class="mb-3">
    <label  class="form-label">Nombre Habitacion</label>
    <input type="text" class="form-control" id="idnombre" name="txtnombre" value="<%=pNombre%>" >
      </div>
            
            
 
 
  
  <button type="submit" class="btn btn-outline-info" name="modificar"  value="modificar">Modificar</button>
  
</form>
        
    </body>
</html>
