<%-- 
    Document   : cliente
    Created on : 03-17-2021, 05:02:20 PM
    Author     : NANCY SALINAS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="baseDatos.baseDatos"%>


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


         <title>Administrar Cliente</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                
	        <script type="text/javascript">
                function Popupventana(url) {
                window.open(url, "Ubicacion", "menubar=0,resizable=0,width=800, height=500")
            }
        </script>
		
        
       

<section id="tabla_resultado">  <%
       
       String id_cliente,nombre,identidad,telefono,id_hab,fechaing,fechaSal;    
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="select id_cliente, NombreCliente, identidad, telefono, id_habitacion1, fecha_ingreso, fecha_salida FROM clientes";
        pstmt=conex.prepareStatement(consulta);
        ResultSet rs= pstmt.executeQuery();
        
        String centinela="n";
         
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
                <br><br>
                    
                  <div class="banner-text">
                                 <h2>Empleados ingresados en sistema </h2>
                                </div>
         
                <br>
            <div class="container">
                <div class="row"> </div>
                    
                         
                 
                
                
                      
                            <div class="text-center">
                                <div class="container">
  <div class="row">
    <div class="col-sm">
                                
           <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">id_Cliente</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Identidad</th>     
                            <th scope="col">Telefono</th>
                             <th scope="col">Habitación</th>
                              <th scope="col">Fecha_Ingreso</th>
                               <th scope="col">Fecha_Salida</th>
                            <th scope="col" href="">Acciones</th>

                 </tr>
             </thead>
             
      
             <% 
             while(rs.next()){
                 
                 centinela="s";
                id_cliente=rs.getString(1);
                nombre=rs.getString(2);
                identidad=rs.getString(3);
                telefono=rs.getString(4);
                id_hab=rs.getString(5);
                fechaing=rs.getString(6);
                fechaSal=rs.getString(7);
             
             %>
             <tbody>
                 <tr>
                     <td><%=id_cliente%></td>
                     <td><%=nombre%></td>
                     <td><%=identidad%></td>
                     <td><%=telefono%></td>
                     <td><%=id_hab%></td>
                     <td><%=fechaing%></td>
                     <td><%=fechaSal%></td>
                     
                     
                     <td><a href="eliminarcliente.jsp?pidcli=<%=id_cliente%>"><input type="submit" name="eliminar" value="eliminar" class="btn btn-lg btn-danger btn-block"></a> </td>
                     
            
                        
                 </tr>  
                 
                 </tbody>
                 
                 <%
                     }

                     %>
                     
                     </tbody>
         </table>
                  
                   <a href="crear.jsp"><button type="button" name="crear" value="Crear"class="btn btn-primary">Crear Nuevo Cliente</button></a>
                   <a href="usuarioAdmin.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-warning">Regresar Menu</button></a><br>
                   <td><br><a href="reporteCliente.jsp"> <input type="submit" name="reporte" value="Mostrar Reporte" class="btn btn-lg btn-primary btn-block"></a> </td>
                   <br><br> <br><br>
                   
             <%
                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             %>
    </div>
  </div></div></div></div>
</section> 
    
             
             </div>
  </body>
  </head></html>
