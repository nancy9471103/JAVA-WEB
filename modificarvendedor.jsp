[4:31 p. m., 21/3/2021] Nancy UMH: <%@include file="seguridadAdmin.jsp" %> 
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
            String id=request.getParameter("pidpiso");
            String nomb=request.getParameter("ppiso");
            String iden=request.getParameter("pidentidad");
            String telef=request.getParameter("ptelefono");
      if(request.getParameter("modificar")!=null)
      {
      String codigon=request.getParameter("txtidusuario");
      String nombren=request.getParameter("txtnombre");
      String identida=request.getParameter("txtidentidad");
      String tele=request.getParameter("txttele");
      
      try {
          
          bdSegura dbs=new bdSegura();
          Connection conex=dbs.conSeg();
          PreparedStatement pstmt=null;
          int correcto=0;
          String consulta="UPDATE vendedores set nombrev=?,identidad=?,telefono=? where id_vendedor like ? ";
          pstmt=conex.prepareStatement(consulta);
          pstmt.setString(1,nombren);
          pstmt.setString(2,codigon);
          pstmt.setString(3,identida);
          pstmt.setString(4,tele);
          
        correcto=pstmt.executeUpdate();
        
        if(correcto>=1)
        {
       %>
       <div class="alert alert-danger" role="alert" align="center">Usuario modificado</div>
       
      
       
      
       <%
           
      request.getRequestDispatcher("vendedor.jsp").forward(request, response);
    }else  { 
      
%>

<div class="alert alert-success" role="alert" align="center">Usuario no se pudo modificar!!</div>

<%
}

%>

<div class="alert alert-danger" role="alert" align="center">Usuario No se pudo Modificar!!</div>

<%

pstmt.close();
conex.close();
}catch(Exception e)
{
e.printStackTrace();


       %>

<div class="alert alert-danger" role="alert" align="center">Usuario No se modificar usuario!!</div>

<%
     } 
}
     
            %>
        
        
        
        <h1>Ingrese Datos</h1>
         <form  method="POST" action="modificarvendedor.jsp">
             
  <div class="mb-3">
    <label  class="form-label">Id Vendedor</label>
    <input type="text" class="form-control" id="idusuario" name="txtidusuario" value="<%=id%>" >
      </div>
     
            
             <div class="mb-3">
    <label  class="form-label">Nombre</label>
    <input type="text" class="form-control" id="idnombre" name="txtnombre" value="<%=nomb%>" >
      </div>
      
             <div class="mb-3">
    <label  class="form-label">Identidad</label>
    <input type="text" class="form-control" id="idind" name="txtidentidad" value="<%=iden%>" >
      </div>
            
             <div class="mb-3">
    <label  class="form-label">Telefono</label>
    <input type="text" class="form-control" id="idtel" name="txttele" value="<%=telef%>" >
      </div>
            
        
          
 
  
  <button type="submit" class="btn btn-outline-info" name="modificar"  value="modificar">Modificar</button>
  
</form>
        
    </body>
</html>
