<%-- 
    Document   : reporteCliente
    Created on : 03-21-2021, 02:08:20 AM
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
         <title>Administrar Cliente</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                
                  <form class="form-signin" role="form" method="POST" action="reporteCliente.jsp" align="center" >
	        <script type="text/javascript">
                function Popupventana(url) {
                window.open(url, "Ubicacion", "menubar=0,resizable=0,width=800, height=500")
            }
            
            function imprSelec(nombre) {
	  var ficha = document.getElementById(nombre);
	  var ventimp = window.open(' ', 'popimpr');
          ventimp.document.write('<div align="center">');
           ventimp.document.write('<html><head><title>' + document.title  + '</title>');
    ventimp.document.write('</head><body >');
   ventimp.document.write('<h1>' + document.title  + '</h1>');
          ventimp.document.write( ficha.innerHTML ); 
          ventimp.document.write('</div">');
           ventimp.document.write('</body></html>');
	  ventimp.document.close();
          ventimp.onload = function() {
	  ventimp.print();
	  ventimp.close();
           };

	}
        </script>
        
        
	<body>
	<div>			
       <h3 align="center">Clientes</h3>
       </div>          
<br>
<br>

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
                     
                    
                 </tr>
                 <br>
                  
                 <%
                     }

                     %>
                 
             </tbody>
         </table>
         <br>
                   <br>
  
             <%
                 
                 pstmt.close(); 
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             %>
        
</section> 
</script>

<a href="javascript:imprSelec('tabla_resultado')" class="btn btn-secondary">Imprimir</a>
</html>

