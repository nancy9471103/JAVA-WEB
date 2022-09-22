<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.text.DecimalFormat"%>
<%@include file="seguridadAdmin.jsp" %>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="baseDatos.baseDatos"%>


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


         <title>Administrar Vendedores</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	        <script type="text/javascript">
                function Popupventana(url) {
                window.open(url, "Ubicacion", "menubar=0,resizable=0,width=800, height=500")
            }
        </script>
        </body>
<div>


<section id="tabla_resultado">  <%
       
       String id_ven,nombre,identidad, telefono;    
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="select id_vendedor, nombrev, identidad, telefono from vendedores";
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
                    
                    
                  <div class="banner-text">
                                 <h2>Empleados ingresados en sistema </h2>
                                </div>
                
                      
                            <div class="text-center">
                                <div class="container">
  <div class="row">
    <div class="col-sm">
                                
           <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">id_Vendedor</th>
                            <th scope="col">Nombre Vendedor</th>
                            <th scope="col">Identidad</th>     
                            <th scope="col">Telefono</th>
                            <th scope="col" href="">Acciones</th>

                 </tr>
             </thead>
      
             <% 
             while(rs.next()){
                 
                 centinela="s";
                id_ven=rs.getString(1);
                nombre=rs.getString(2);
                identidad=rs.getString(3);
                telefono=rs.getString(4);
                
             %>
             <tbody>
                 <tr>
                     <td><%=id_ven%></td>
                     <td><%=nombre%></td>
                     <td><%=identidad%></td>
                     <td><%=telefono%></td>
                   
                     
                     
                     <td><a href="eliminarvendedor.jsp?pidv=<%=id_ven%>"><input type="submit" name="eliminar" value="eliminar" class="btn btn-lg btn-danger btn-block"></a> </td>
                     
                 </tr>
                 <br>
                  
                 <%
                     }

                     %>
                 
             </tbody>
         </table>
         <br>
                   <br>
                   <a href="crearVendedor.jsp"><button type="button" name="crear" value="Crear"class="btn btn-primary">Crear Nuevo Vendedor</button></a>
                   <a href="usuarioAdmin.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-warning">Regresar Menu</button></a>
                   <br><br><br><br>
                   
                   
                     
             <%
                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             %>
        
</section> 
</script>
</html>