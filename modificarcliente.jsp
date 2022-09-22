<%-- 
    Document   : modificarReservacion
    Created on : 17-mar-2021, 16:40:34
    Author     : GISSEL RODRIGUEZ
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
            
                      
            
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0">
    <title>Hotel</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    
     
    <link rel="shortcut icon" href="recursos/images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="recursos/images/apple-touch-icon.png">
    <link rel="stylesheet" href="recursos/css/bootstrap.min.css">
    <link rel="stylesheet" href="recursos/css/style.css">
    <link rel="stylesheet" href="recursos/css/responsive.css">
    <link id="" rel="stylesheet" href="recursos/css/colors/orange.css" />


    <script src="recursos/js/modernizer.js"></script>
<link rel="stylesheet" type="text/css"  href="recursos/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="recursos/fonts/font-awesome/css/font-awesome.css">

<link rel="stylesheet" type="text/css"  href="recursos/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rochester" rel="stylesheet">

        <title>Modificar Clientes</title>
    </head>
    <body>
          
        <%  
            String pidc=request.getParameter("pidc");
            String pnom=request.getParameter("pnom");
            String pident=request.getParameter("pident");
            String ptel=request.getParameter("ptel");
            String pidh=request.getParameter("pidh");
           String pfing=request.getParameter("fing");
           String pfins=request.getParameter("pfins");
           
            
       if(request.getParameter("modificar")!=null)
       {
       String id_cliente=request.getParameter("txtidc");
       String nombre=request.getParameter("txtnombre");
       String identidad=request.getParameter("txtidentidad");
       String id_hab=request.getParameter("txtidhab");
       String fechaing=request.getParameter("txtfing");
       String fechaSal=request.getParameter("txtfsal");
       
       
       try
      {
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="UPDATE reservacion set id_cliente=?,NombreCliente=?,identidad=?,telefono=?,id_habitacion1=?, fecha_ingreso=?, fecha_salida=?, where id_cliente like ?";
        
       
       pstmt=conex.prepareStatement(consulta);

pstmt.setString(1,id_cliente);
pstmt.setString(2,nombre);
pstmt.setString(3,identidad);
pstmt.setString(4,id_hab);
pstmt.setString(5,fechaing);
pstmt.setString(6,fechaSal);

insertCorrecto=pstmt.executeUpdate();

if(insertCorrecto>=1)
{
%>

<div class="alert alert-success" role="alert" align="center">Reservacion Modificado exitosamente</div>

<%
    request.getRequestDispatcher("cliente.jsp").forward(request, response);
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
        
           <div class="footer-box pad-top-70">
            <div class="container">
                <div class="row">
                    <div class="footer-in-main">
                        <div class="footer-logo">
                            <div class="text-center">
                                <img src="recursos/images/CasaMar.png"  width="350" height="200" alt="" >
                            </div>
                        </div>      
                            </div>
                        </div>
                    </div>
                </div>
             <div class="container">
                <div class="row"> </div>
                <br>
                  <div class="banner-text">
                                 <h2>Modificar datos del cliente </h2>
                  </div><br>
                            
                                <div class="container">
  <div class="row">
    <div class="col-sm">
        
         <form  method="POST" action="modificarcliente.jsp">
  
                <div class="mb-3">
    <label  class="form-label">Codigo Cliente</label>
    <input type="text" class="form-control" id="idcliente" name="txtidc" value="<%=pidc%>">
      </div>
    
     
                <div class="mb-3">
    <label  class="form-label">Nombre</label>
    <input type="text" class="form-control" id="nombre" name="txtnombre" value="<%=pnom%>">
      </div>
            
             <div class="mb-3">
    <label  class="form-label">Identidad</label>
    <input type="text" class="form-control" id="identidad" name="txtidentidad" value="<%=pident%>">
      </div>
            
            
            <div class="mb-3">
    <label  class="form-label">Codigo Habitacion</label>
    <input type="text" class="form-control" id="idha" name="txtcliente" value="<%=ptel%>">
      </div>
     
           <div class="mb-3">
    <label  class="form-label">Codigo Cliente</label>
    <input type="text" class="form-control" id="idcclie" name="txtidhab" value="<%=pidh%>">
      </div>
      
        <div class="mb-3">
    <label  class="form-label">Fecha Ingreso</label>
    <input type="text" class="form-control" id="fingreso" name="txtfing" value="<%=pfing%>">
      </div>
      
        <div class="mb-3">
    <label  class="form-label">Fecha Salida</label>
    <input type="text" class="form-control" id="fsali" name="txtfsal" value="<%=pfins%>">
      </div>
      
      
    </div></div>
      </select>
      
      
      
      <br>
           
      <center>
  
          <button type="submit" class="btn btn-danger" name="modificar"  value="Modificar">Modificar</button>
 
  
   <a href="cliente.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-warning">Cancelar Modificasion</button></a>
                   
      </center>
      
      <br>
</form>
    <link href="recursos/dist/style.css" rel="stylesheet" type="text/css"/>
    
   
    </body>
   
</html>

