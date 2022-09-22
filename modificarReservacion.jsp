<%-- 
    Document   : modificarReservacion
    Created on : 17-mar-2021, 16:40:34
    Author     : GISSEL RODRIGUEZ
--%>


<%@include file="seguridadVendedor.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    
    <script src="recursos/dist/script.js" type="text/javascript"></script>
<link  rel="icon"   href="recursos/images/Wisnet2.png" type="image/png" />
<header id="header">
    
</header>
  <div class="intro">
      
 
  <div class="row">
  <div class="intro-text">
  
        
        <img src="recursos/images/Wisnet2.png" alt=""/>
        <title>Modificar Reservacion</title>
    </head>
    <body>
          
        <%  
            String pidr=request.getParameter("pidr");
            String pp=request.getParameter("pp");
            String pidh=request.getParameter("pidh");
            String pidc=request.getParameter("pidc");
            String pestado=request.getParameter("pestado");
           
           
            
       if(request.getParameter("modificar")!=null)
       {
       String idre=request.getParameter("txtidre");
       String piso=request.getParameter("txtpiso");
       String idha=request.getParameter("txthabitacion");
       String idcl=request.getParameter("txtcliente");
       String esta=request.getParameter("txtestado");
       
       
       try
      {
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="UPDATE reservacion set piso=?,id_habitacion=?,id_cliente=?,estado=? where id_reservacion like ?";
       pstmt=conex.prepareStatement(consulta);

pstmt.setString(1,piso);
pstmt.setString(2,idha);
pstmt.setString(3,idcl);
pstmt.setString(4,esta);
pstmt.setString(5,idre);

insertCorrecto=pstmt.executeUpdate();

if(insertCorrecto>=1)
{
%>

<div class="alert alert-success" role="alert" align="center">Reservacion Modificado exitosamente</div>

<%
    request.getRequestDispatcher("usuarioVendedor.jsp").forward(request, response);
}else{

%>

<div class="alert alert-danger" role="alert" align="center">reservacion No se pudo Modificar</div>

<%
}
%>
<div class="alert alert-danger" role="alert" align="center">Reservacion No se pudo Modificar!!</div>
<%

pstmt.close();
conex.close();
}catch(Exception e)
{
e.printStackTrace();

     } 
}
     
            %>
        
        
        
         <form  method="POST" action="modificarReservacion.jsp">
  <div class="mb-3">
      <h2> Registro de Planes</h2>
      
      </div>
                <div class="mb-3">
    <label  class="form-label">Codigo Reservacion</label>
    <input type="text" class="form-control" id="idhabitac" name="txtidre" value="<%=pidr%>">
      </div>
    
      </div>
                <div class="mb-3">
    <label  class="form-label">Piso</label>
    <input type="text" class="form-control" id="idpiso" name="txtpiso" value="<%=pp%>">
      </div>
            
             <div class="mb-3">
    <label  class="form-label">Codigo Habitacion</label>
    <input type="text" class="form-control" id="idchabi" name="txthabitacion" value="<%=pidh%>">
      </div>
            
            
            <div class="mb-3">
    <label  class="form-label">Codigo Cliente</label>
    <input type="text" class="form-control" id="idcclie" name="txtcliente" value="<%=pidc%>">
      </div>
     
         <div class="mb-3">
    <label  class="form-label">Estado</label>
    <select class="form-select" id="idest" name="txtestado" style="width:150px" value="<%=pestado%>">
      <option selected ><%=pestado%></option>
      <option value="Reservado">Reservado</option>
      <option value="Disponible">Disponible</option>
      
      </select>
      
      
      
      
           
 
  
  <button type="submit" class="btn btn-outline-info" name="modificar"  value="Modificar">Modificar</button>
  <br>
  <a href="usuarioVendedor.jsp">Regresar</a>
  
</form>
    <link href="recursos/dist/style.css" rel="stylesheet" type="text/css"/>
    
   
    </body>
   
</html>

