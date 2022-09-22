<%-- 
    Document   : registrarUsuario
    Created on : 11-mar-2021, 12:53:12
    Author     : GISSEL RODRIGUEZ
--%>
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

        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
     	<body>
            <div>
    


        

        

<header id="header">
  <div class="intro">
      
  <div class="container">
  <div class="row">
  <div class="intro-text">
      <table class="table">
           
        </table>
  
  <script src="encriptar/md5.js" type="text/javascript"></script>      
<script  type="text/javascript"> 
            function modificarClave(texto){
                var claveCifrada = hex_md5(texto);
                document.getElementById("idclave").value = claveCifrada;
            }
        
        </script>   
      
        <title>Crear Usuario</title>
    </head>
    <body>
        
        
        
        
        <%  
       if(request.getParameter("guardar")!=null)
       {
       String iduser=request.getParameter("txtidusuario");
       String user=request.getParameter("txtusuario");
       String clave=request.getParameter("txtclave");
       String tipou=request.getParameter("txttipou");
       
       try
       {
       bdSegura bds1=new bdSegura();
       Connection conex1=bds1.conSeg();
       PreparedStatement ps=null;    
       String centinela="n";
       String consulta1="Select Id_usuario  "
                        +"from usuarios "
                        +" where Id_usuario like ? ";
       ps=conex1.prepareStatement(consulta1);
       ps.setString(1, iduser);
       ResultSet rs1=ps.executeQuery();
       while(rs1.next())
       {
       centinela="s";
       }
       if(centinela.equals("s"))
       {
       %>
       <div class="alert alert-danger" role="alert" align="center">Ya existe un usuario con este codigo</div>
       
       <%
           
       }else{
       
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="INSERT INTO usuarios (Id_usuario,Usuario,Clave,TipoUsuario) VALUES (?,?,?,?)";
       pstmt=conex.prepareStatement(consulta);
       pstmt.setString(1,iduser);
pstmt.setString(2,user);
pstmt.setString(3,clave);
pstmt.setString(4,tipou);
insertCorrecto=pstmt.executeUpdate();

if(insertCorrecto>=1)
{
%>

<div class="alert alert-success" role="alert" align="center">Usuario ingresado exitosamente!!</div>

<%
}else{

%>

<div class="alert alert-danger" role="alert" align="center">Usuario No se pudo Crear!!</div>

<%
}

pstmt.close();
conex.close();
       
       }catch(Exception e){
       %>

<div class="alert alert-danger" role="alert" align="center">Usuario No se pudo Crear!!</div>

<%
       
       }
}
ps.close();
conex1.close();
}catch(Exception e){
e.printStackTrace();
}}
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
            
        
 <div class="card">
                     
                            <div class="text-center">
                                <div class="container">
 

    <form class="form-signin" role="form" method="POST" action="crearHabitacion.jsp" align="center" >
        <br>
   
                                <div class="banner-text">
                                 <h2>Ingresar tus datos </h2>
                                </div>
              
           
                        
        
         <form  method="POST" action="registrarUsuario.jsp">
  

         <div class="mb-3">
    <label  class="form-label">Usuario</label>
    <input type="text" class="form-control" id="idusuario" name="txtusuario">
      </div>    
            
  <div class="mb-3">
    <label  class="form-label">clave</label>
    <input type="password" class="form-control" id="idclave" name="txtclave">
      </div>
 
 
 <div class="mb-3">
     
    <input type="text" class="form-control" id="idtusuario" name="txttipou" value="cliente" readonly="" hidden="" >
      </div>
             
           
    
          
 
             <br>
             <center><button type="submit" class="btn btn-outline-info" name="guardar" onclick="modificarClave(document.getElementById('idclave').value)" value="Guardar">Guardar</button> </center>
            
                    
  
  
  
  <!--botones-->
  <br>
         </form></form></div></div></div></div>
      
            
            
            
              <div class="text-center">
                            
         <td><a href="login.jsp"> <input type="submit" name="salir" value="salir" class="btn btn-lg btn-danger btn-block"></a></td> 
        
   </div>
    </body>
</html>
