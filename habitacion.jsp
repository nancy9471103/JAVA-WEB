<%-- 
    Document   : habitacion1
    Created on : 20-mar-2021, 18:47:01
    Author     : pc
--%>
 <%@include file="seguridadAdmin.jsp" %> 
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


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





<script type="text/javascript">
    function Popupventana(url)
    {
        windows.open(url,"ubicacion", "menu=0, resizible=0, width=800, height=500")
        
    }
    
</script>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <title>Administrar Habitaciones</title>
        
        
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
    
    <br> <br>
                    
                 
         
            <div class="container">
                <div class="row"> </div>
         <div class="container">
                <div class="row"> </div>
                
                    
                 
         
            <div class="container">
                <div class="row"> </div>
                    
                         
        <section id="tabla_resultado">  <%
        
        
         String nombre,apellido,user,tpusuario,iduser;
         
        try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="Select nombre_hab,id_piso1,id_habitacion from habitaciones";
        pstmt=conex.prepareStatement(consulta);
         ResultSet rs= pstmt.executeQuery();
        
         String centinela="n";
         
         %>
         
         <table class="table">
             <thead>
                 <tr>
                    
                          <th scope="col"> Nombre Habitacion</th>
		          <th scope="col"> Codigo Habitacion</th>
		          
                          
                     
                 </tr>
             </thead>
             
             <% 
             while(rs.next()){
                 
                 centinela="s";
                nombre=rs.getString(1);
                apellido=rs.getString(2);
                iduser=rs.getString(3);
             
             %>
             <tbody>
                 <tr>
                     <td><%=nombre%></td>
                     <td><%=apellido%></td>
                     
                     <td><a class="btn btn-danger" href="modificarhabitacion1.jsp?piduser=<%=iduser%>&pnombre=<%=nombre%>">Modificar</a>
                     <a class="btn btn-primary"href="eliminarhabitacion.jsp?pidhab=<%=iduser%>">Eliminar</a></td>
                 </tr>
                 <%
                     }

                     %>
                 
             </tbody>
             
                <tbody>
                <tr>
                    
                    <td><a href="login.jsp"> <input type="submit" name="salir" value="salir" class="btn btn-lg btn-danger btn-block"></a></td> 
                    <td><a href="crearHabitacion.jsp"> <input type="submit" name="crear" value="Crear" class="btn btn-lg btn-outline-info btn-block"></a> </td>
                   <td><a href="reporteHabitacion.jsp"> <input type="submit" name="Reporte" value="Reporte" class="btn btn-lg btn-outline-info btn-block"></a> </td>
                   
    <a href="usuarioAdmin.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-danger">Atras</button></a>
                
                </tr> 
            </tbody>
         </table>
             
             <%
                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             %>
             
        
         
         
       
        
    </body>
</html>