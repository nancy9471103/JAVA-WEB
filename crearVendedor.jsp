<%-- 
    Document   : crearVendedor
    Created on : 03-17-2021, 08:44:10 PM
    Author     : NANCY SALINAS
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
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
<script src="encriptar/md5.js" type="text/javascript"></script>      
<script  type="text/javascript"> 
            function modificarClave(texto){
                var claveCifrada = hex_md5(texto);
                document.getElementById("idclave").value = claveCifrada;
            }
        
        </script>
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <div>
     <form class="form-signin" role="form" method="POST" action="crearVendedor.jsp" align="center" >

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
                                 <h2>Empleados ingresados en sistema </h2>
                                </div>
                
                <br>
                            <div class="text-center">
                                <div class="container">
  <div class="row">
    <div class="col-sm">


          <%
            if(request.getParameter("asignar")!=null){
           String codv=request.getParameter("txtcodigo");
           String nom=request.getParameter("txtnombre"); 
            String ident=request.getParameter("txtident");
             String tel=request.getParameter("txttel");
              
               try{
                   bdSegura bds1 = new bdSegura();
                   Connection conex1 = bds1.conSeg();
                   PreparedStatement ps = null;
                   String centinela = "n";
                   String consulta1 = "select id_vendedor "
                                    +" from vendedores"
                                    +" where id_vendedor like ? ";
                   
                   ps = conex1.prepareStatement(consulta1);
                   ps.setString(1,codv);
                  
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
                    String consulta = "INSERT INTO vendedores (id_vendedor,nombrev,identidad,telefono) VALUES (?,?,?,?)";
                                                           
                    pstmt = conex.prepareStatement(consulta);
                     pstmt.setString(1,codv);
                     pstmt.setString(2,nom);
                     pstmt.setString(3,ident);
                     pstmt.setString(4,tel);
                 
                    insertCorrecto = pstmt.executeUpdate();
                    
                    if(insertCorrecto >= 1){
                        %>
                           <div class="alert alert-success" role="alert" align="center">Vendedor ingresado exitosamente!!!</div>
                        <% request.getRequestDispatcher("vendedor.jsp").forward(request, response);
                            
                    }else{
                        %>
                           <div class="alert alert-danger" role="alert" align="center">No se pudo ingresar!!!</div>
                        <%                  
                    }     
                    
                     
                    
                    
                    pstmt.close();
                    conex.close();
                }catch(Exception e){
                    %>
                        <div class="alert alert-danger" role="alert" align="center">No se pudo ingresar!!!</div>
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
        
 

    <form class="form-signin" role="form" method="POST" action="crearVendedor.jsp" align="center" >

       <div class="form-group col-sm-9">
        <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label">Codigo:</label>
                      <div class="col-sm-7">
                          <input type="number" name="txtcodigo" id="codigo" class="form-control" required="required" placeholder="Ingrese el codigo del vendedor" autocomplete="off" > 
                      </div></div>
                      
                         <div class="form-group col-sm-9">
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Nombre del vendedor:</label>
                      <div class="col-sm-7">
                        <input type="text" name="txtnombre" id="nombre" class="form-control" required="required" placeholder="Ingrese el nombre" autocomplete="off" >
                      </div></div>
                      
                      <div class="form-group col-sm-9">
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Identidad del vendedor:</label>
                      <div class="col-sm-7">
                        <input type="text" name="txtident" id="nombre" class="form-control" required="required" placeholder="Número de identidad" autocomplete="off" >
                      </div></div>
                      
                      <div class="form-group col-sm-9">
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Teléfono del vendedor:</label>
                      <div class="col-sm-7">
                        <input type="text" name="txttel" id="nombre" class="form-control" required="required" placeholder="Número de telefono" autocomplete="off" >
			</div>
                         </div>
                       
      


<div class="form-group col-sm-9">
    <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label">Usuario</label>
     <div class="col-sm-7">
    <input type="text" class="form-control" id="idusuario" name="txtusuario">
     </div>  </div>  
            
   <div class="form-group col-sm-9">
    <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label">clave</label>
    <div class="col-sm-7">
    <input type="password" class="form-control" id="idclave" name="txtclave">
    </div></div>
 
 
  <div class="form-group col-sm-9">
     <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Tipo de Usuario</label>
     <div class="col-sm-7">
     <input type="text" class="form-control" id="idtusuario" name="txttipou" value="Vendedor">
     </div></div>
          
    </form>
                    
            <br>
       <div class="form-group col-sm-9">   
    <input  type="submit" name="asignar" onclick="modificarClave(document.getElementById('idclave').value)" value="Ingresar" class="btn btn-lg btn-warning"> 
       <a href="vendedor.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-primary">Regresar </button></a>
            
       </div>
            
                  
    </body>
</html>