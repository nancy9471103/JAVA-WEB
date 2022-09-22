<%-- 
    Document   : crearHabitacion
    Created on : 03-18-2021, 11:05:21 PM
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
    


          <%
            if(request.getParameter("asignar")!=null){
           String codh=request.getParameter("txtcodigo");
           String nom=request.getParameter("txtnombre");
           String piso=request.getParameter("txtpiso"); 
              
               try{
                   bdSegura bds1 = new bdSegura();
                   Connection conex1 = bds1.conSeg();
                   PreparedStatement ps = null;
                   String centinela = "n";
                   String consulta1 = "select id_habitacion "
                                    +" from habitaciones"
                                    +" where id_habitacion like ? ";
                   
                   ps = conex1.prepareStatement(consulta1);
                   ps.setString(1,codh);
                  
                   ResultSet rs1 = ps.executeQuery();
                   while(rs1.next()){
                       centinela = "s";
                   }
                   
                   if(centinela.equals("s")){
                        %>
                           <div class="alert alert-danger" role="alert" align="center">Ya existe este código</div>
                        <%    
                   } else{ 
                
                
                
                try{
                    bdSegura dbs = new bdSegura();
                    Connection conex = dbs.conSeg();
                    PreparedStatement pstmt = null;                    
                   int insertCorrecto = 0; 
                    String consulta = "INSERT INTO habitaciones (id_habitacion, nombre_hab, id_piso1) VALUES (?,?,?)";
                                                           
                    pstmt = conex.prepareStatement(consulta);
                     pstmt.setString(1,codh);
                     pstmt.setString(2,nom);
                     pstmt.setString(3,piso);

                 
                    insertCorrecto = pstmt.executeUpdate();
                    
                    if(insertCorrecto >= 1){
                        %>
                           <div class="alert alert-success" role="alert" align="center">Piso ingresado exitosamente!!!</div>
                        <% request.getRequestDispatcher("habitacion.jsp").forward(request, response);
                            
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
                                 <h2>Ingresar una nueva habitacion </h2>
                                </div>
              
           
                        
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Codigo de habitacion </label>
   <input type="number" name="txtcodigo" id="codigo" class="form-control" required="required" placeholder="Ingrese el codigo" autocomplete="off" >                                      
  </div>
       
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Nombre de habitacion </label>
   <input type="text" name="txtnombre" id="nombre" class="form-control" required="required" placeholder="Nombre de habitación" autocomplete="off" >
   </div> 
       
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Id Piso</label>
    <input type="text" name="txtpiso" id="nombre" class="form-control" required="required" placeholder="Nombre de piso" autocomplete="off" >
  </div>     
        <BR>
        <input  type="submit" name="asignar" value="Ingresar" class="btn btn-lg btn-warning"><br><br>
    <a href="habitacion.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-danger">Atras</button></a>
    <br><br>
        
    </form>  
 
   </form>
   
                        
               
    </div>
    </body>
</html>
