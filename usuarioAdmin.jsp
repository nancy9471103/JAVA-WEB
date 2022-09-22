<%-- 
    Document   : usuarioAdmin
    Created on : 03-10-2021, 12:24:03 AM
    Author     : NANCY SALINAS
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%--  <%@include file="seguridadAdmin.jsp" %> --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>

<head>
<script type="text/javascript">
    function Popupventana(url)
    {
        windows.open(url,"ubicacion", "menu=0, resizible=0, width=800, height=500")
        
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
                            <img class="about-inset" src="recursos/images/logoadmin.jpg" alt="About Inset Image">
                        </div>
                    </div>
                </div>
            
            </div><br><br><br>

    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
        
<meta name="description" content="">
<meta name="author" content="">
        

        
        <title>Menu Administrador</title>
    </head>
   
    
    
    <body>
   
        <table class="table">
            <tbody>
                <tr>
                      
                    <td><a href="cliente.jsp"> <input type="submit" name="cliente" value="Administrar Cliente" class="btn btn-lg btn-primary btn-block"></a> </td>   
                    <td><a href="habitacion.jsp"> <input type="submit" name="habitacion" value="Administrar Habitación" class="btn btn-lg btn-primary btn-block"></a></td> 
                    <td><a href="vendedor.jsp"> <input type="submit" name="vendedor" value="Administrar Vendedor" class="btn btn-lg btn-primary btn-block"></a></td> 
                    <td><a href="pisos.jsp"> <input type="submit" name="pisos" value="Administrar pisos" class="btn btn-lg btn-primary btn-block"></a></td> 
                    <td><a href="login.jsp"> <input type="submit" name="salir" value="salir" class="btn btn-lg btn-danger btn-block"></a></td> 
                    
            </tr> 
            
        </table>
      
        
       
             
                 
            
         
           
         
      
        
         
         
        <script src="recursos/js/all.js"></script>
    <script src="recursos/js/bootstrap.min.js"></script>
   
    <script src="recursos/js/custom.js"></script>
        
    </body>
</html>
