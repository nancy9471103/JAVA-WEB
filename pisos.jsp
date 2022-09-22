<%-- 
    Document   : pisos
    Created on : 03-17-2021, 05:02:20 PM
    Author     : NANCY SALINAS
--%>
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





         <title>Administrar Pisos</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	        <script type="text/javascript">
                function Popupventana(url) {
                window.open(url, "Ubicacion", "menubar=0,resizable=0,width=800, height=500")
            }
        </script>
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
         <div class="container">
                <div class="row"> </div>
                
                    
                 <div class="banner-text">
                                 <h2>Pisos ingresados en sistema </h2>
                                </div>
         
            <div class="container">
                <div class="row"> </div>
                    
                         


<section id="tabla_resultado">  <%
       
       String id_piso,piso;    
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="select id_piso, piso FROM pisos";
        pstmt=conex.prepareStatement(consulta);
        ResultSet rs= pstmt.executeQuery();
        
        String centinela="n";
         
         %>
         
           <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">id_piso</th>
                            <th scope="col">piso</th>
                            <th scope="col" href="">Acciones</th>

                 </tr>
             </thead>
      
             <% 
             while(rs.next()){
                 
                 centinela="s";
                id_piso=rs.getString(1);
                piso=rs.getString(2);
                
             
             %>
             <tbody>
                 <tr>
                     <td><%=id_piso%></td>
                     <td><%=piso%></td>
                     
                     <td><a class="btn btn-primary" href="modificarpisos.jsp?pidpiso=<%=id_piso%>&ppiso=<%=piso%>">Modificar</a></td>
                     <td>  <a href="dec.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-warning">Eliminar registro</button></a>
                                     </tr>
               
                  
                 <%
                     }

                     %>
                 
        
              <button type="button" class="close" class="btn btn-lg btn-primary" ></button>
           </div></div>                   
              <td>
                      
                      <a href="crearPiso.jsp"> <input type="submit" name="crear" value="Crear" class="btn btn-lg btn-success btn-block"></a> </td>  </centrar> 
     <td>  <a href="usuarioAdmin.jsp"><button type="button" name="usuarioAdmin" value="usuarioAdmin"class="btn btn-warning">Regresar Menu</button></a>
                  
     </td>
               
   
             <%
                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             %>
        
</section> </form>
        
    </body>
</html>
</script>
</html>