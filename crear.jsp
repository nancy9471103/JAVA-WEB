<%-- 
    Document   : Nancy Salinas
    Created on : 16-mar-2021, 12:20:28
    Author     : pc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                    
        <script src="encriptar/md5.js" type="text/javascript"></script>      
<script  type="text/javascript"> 
            function modificarClave(texto){
                var claveCifrada = hex_md5(texto);
                document.getElementById("idclave").value = claveCifrada;
            }
        
        </script>
            
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

         <title>Administrar Cliente</title>
         <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
     	<body>
            <div>
    
    
          <%
            if(request.getParameter("asignar")!=null){
           String codc=request.getParameter("txtcodigo");
           String nom=request.getParameter("txtnombre"); 
            String ident=request.getParameter("txtident");
             String tel=request.getParameter("txttel");
             String hab=request.getParameter("txthab");
             String ing=request.getParameter("datepicker");
             String sal=request.getParameter("datepicker2");
              
               try{
                   bdSegura bds1 = new bdSegura();
                   Connection conex1 = bds1.conSeg();
                   PreparedStatement ps = null;
                   String centinela = "n";
                   String consulta1 = "select id_cliente"
                                    +" from clientes"
                                    +" where id_cliente like ? ";
                   
                   ps = conex1.prepareStatement(consulta1);
                   ps.setString(1,codc);
                  
                   ResultSet rs1 = ps.executeQuery();
                   while(rs1.next()){
                       centinela = "s";
                   }
                   
                   if(centinela.equals("s")){
                        %>
                           <div class="alert alert-danger" role="alert" align="center">Ingresado con éxito</div>
                        <%    
                   } else{ 
                
                
                
                try{
                    bdSegura dbs = new bdSegura();
                    Connection conex = dbs.conSeg();
                    PreparedStatement pstmt = null;                    
                   int insertCorrecto = 0; 
                    String consulta = "INSERT INTO clientes (id_cliente,NombreCliente,identidad,telefono,id_habitacion1,fecha_ingreso,fecha_salida) VALUES (?,?,?,?,?,?,?)";
                                                           
                    pstmt = conex.prepareStatement(consulta);
                     pstmt.setString(1,codc);
                     pstmt.setString(2,nom);
                     pstmt.setString(3,ident);
                     pstmt.setString(4,tel);
                     pstmt.setString(5,hab);
                     pstmt.setString(6,ing);
                     pstmt.setString(7,sal);
                 
                    insertCorrecto = pstmt.executeUpdate();
                    
                    if(insertCorrecto >= 1){
                        %>
                           <div class="alert alert-success" role="alert" align="center">Vendedor ingresado exitosamente!!!</div>
                        <% request.getRequestDispatcher("cliente.jsp").forward(request, response);
                            
                    }else{
                        %>
                           <div class="alert alert-danger" role="alert" align="center">No se pudo ingresar!!!</div>
                        <%                  
                    }     
                    
                     
                    
                    
                    pstmt.close();
                    conex.close();
                }catch(Exception e){
                    %>
                        <div class="alert alert-danger" role="alert" align="center">Ingresar un número válido para su identidad</div>
                    <% 
                }
                
                 } 
                   ps.close();
                   conex1.close();
            }catch(Exception e){
                           e.printStackTrace();
                       }
               }
     
        
        
        
        %>
       <% 
   if(request.getParameter("asignar")!=null)
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
            <div class="container">
                <div class="row"> </div>
                    
                            <div class="text-center">
                                <div class="container">
  <div class="row">
    <div class="col-sm">
                                
           <table class="table">
                    <thead class="thead-light">





  <form class="form-signin" role="form" method="POST" action="crear.jsp" align="center" >

   
    <br>   
    <div class="form-group col-sm-9">
        <br>
     
                     
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Nombre del cliente:</label>
                      <div class="col-sm-7">
                        <input type="text" name="txtnombre" id="nombre" class="form-control" required="required" placeholder="escribir...." autocomplete="off" >
			</div>
                      
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Identidad del cliente:</label>
                      <div class="col-sm-7">
                        <input type="text" name="txtident" id="nombre" class="form-control" required="required" placeholder="escribir...." autocomplete="off" >
			</div>
                      
                     
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Teléfono del cliente:</label>
                      <div class="col-sm-7">
                        <input type="text" name="txttel" id="nombre" class="form-control" required="required" placeholder="escribir...." autocomplete="off" >
			</div>
                       
                      
                                           
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Id Habitación:</label>
                      <div class="col-sm-7">
                        <input type="number" name="txthab" id="nombre" class="form-control" required="required" placeholder="seleccionar" autocomplete="off" >
                      </div><br> 
                       
                          
                      <label style="color: #0062cc ; font-family: Nobile-bold;"class="col-sm-3 control-label" >Fecha de ingreso:</label>
                      <div class="col-sm-7">
                          <input type="date" name="datepicker"  required="" id="datepicker"  >
                      </div><br>
                    
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Fecha de salida:</label>
                      <div class="col-sm-7">
                        <input type="date" name="datepicker2" required="" id="datepicker2"  >
                        </div>
                      
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Id Usuario: </label>
                      <div class="col-sm-7">
                      <input type="text" class="form-control" id="idusuario" name="txtusuario" placeholder="escribir....">
                         </div>
                      
                       <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">contraseña: </label>
                      <div class="col-sm-7">
                          <input type="password" class="form-control" id="idclave" name="txtclave" placeholder="escribir....">
                        </div>
                       
                       <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Tipo de Usuario </label>
                      <div class="col-sm-7">
                          <input type="text" class="form-control" id="idtusuario" name="txttipou"  value="Cliente">
                     </div>
                     
                       
                       
                       
                       
                       
                       
                       
                       
                      
                      
                       <input " type="submit" name="asignar" onclick="modificarClave(document.getElementById('idclave').value)" value="Ingresar" class="btn btn-lg btn-warning"> <br><br>
    <a href="cliente.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-success">Atras</button></a>
                   
    </form>  
                    <a href="usuarioAdmin.jsp">
                      



 
 
                    </a></div></div></div></div></div></div>

      
    	
    </body>
</html>