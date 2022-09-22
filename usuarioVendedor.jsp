<%-- 
    Document   : usuarioVendedor
    Created on : 03-10-2021, 12:24:26 AM
    Author     : GISSEL RODRIGUEZ
--%>

<%@include file="seguridadVendedor.jsp" %>
<%@page import="javax.swing.JOptionPane"%>
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





         <div class="footer-box pad-top-70">
             </head> 
       <body>
           
           
        
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
           
            <div id="about" class="about-main pad-top-100 pad-bottom-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s"><br>
                       <br> <center>   <h2 class="block-title"> Bienvenid@  ---<%=session.getAttribute("s_usuario") %> ---- </h2>
                            <h2 class="block-title"> Su Usuario es tipo:  </h2>
                             <h2 class="block-title">  <%=session.getAttribute("s_rol") %></h2></center>
                        

                </div>     </div> 
            
            
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <div class="about-images">
                            <img class="about-inset" src="recursos/images/vendedor.jpg" alt="About Inset Image">
                        </div>
                    </div>
                </div>
            
            </div><br><br><br>
            





        
        <title>Perfil Vendedor</title>
        <script type="text/javascript">
            function Popupventana(url) {
                window.open(url, "Ubicacion", "menubar=0,resizable=0,width=800, height=500")
            }
        </script>
   
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">







<div class="container">
  <div class="desk-nav-bar">
    <ul>
        
      <li><a href="usuarioVendedor.jsp">Inicio</a></li>
      <li><a href="index.jsp">Cerrar Sesion</a></li>
      <li><a href="usuarioVendedor.jsp"><%=session.getAttribute("s_usuario") %> ( <%=session.getAttribute("s_rol") %> )</a></li>
    </ul>
  </div>
  
  <div class="hamburger-btn">
    <i class="fas fa-bars"></i>
    <i class="fas fa-times"></i>
  </div>
</div>
        
<%
         String idr,piso,idh,idc,es;
         
        try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="Select id_reservacion,piso,id_habitacion,id_cliente,estado from reservacion";
        pstmt=conex.prepareStatement(consulta);
         ResultSet rs= pstmt.executeQuery();
        
         String centinela="n";
         
         %>
         <br><br><br>
          
                                  
                                    <h1 align="center">Reservaciones</h1>
                                 
                     <table class="table" style="margin: 0 auto;">
                         
                    <thead class="thead-light">
		      
		        <tr>
                          <th scope="col"> Codigo Reservacion</th>
		          <th scope="col"> Piso</th>
		          <th scope="col">Codigo Habitacion</th>
		          <th scope="col">Codigo Cliente</th>
                          <th scope="col">Estado</th>
                          <th scope="col">Acción</th>
                         
                          
		        </tr>
		      </thead>
      <% 
             while(rs.next()){
                 
                 centinela="s";
                 
                 idr=rs.getString(1);
                piso=rs.getString(2);
                idh=rs.getString(3);
                idc=rs.getString(4);
                es=rs.getString(5);
                
                
             
             %>
              <tbody>
                 <tr>
                     <td><%=idr%></td>
                     <td><%=piso%></td>
                     <td><%=idh%></td>
                     <td><%=idc%></td>
                     <td><%=es%></td>
                     <td><a href="modificarReservacion.jsp?pidr=<%=idr%>&pp=<%=piso%>&pidh=<%=idh%>&pidc=<%=idc%>&pestado=<%=es%>">Modificar</a>
                         <a href="eliminarReservacion.jsp?idreservacion=<%=idr%>">Eliminar</a></td>
                     
                     
                 </tr>
                 <%
                     }

                     %>
                        </tbody>
                        <div align="center">
				<a href="login.jsp">Registrar un Nuevo Usuario</a>
			</div>
                        <br>
         </table>
                        <%
                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             %>
             




</html>