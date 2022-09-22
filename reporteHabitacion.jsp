<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="seguridadAdmin.jsp" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>



<!DOCTYPE html>
<html>
	<head> 
         <title>Administrar Habitación</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
       <h3 align="center">Habitaciones</h3>
       </div>          
<br>
<br>

<section id="tabla_resultado">  <%
       
       String id_hab,nombre,id_piso;    
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="select id_habitacion, nombre_hab, id_piso1 from habitaciones";
        pstmt=conex.prepareStatement(consulta);
        ResultSet rs= pstmt.executeQuery();
        
        String centinela="n";
         
         %>
         
           <table class="table">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">id_Habitacion</th>
                            <th scope="col">Nombre_Habitacion</th>
                            <th scope="col">Id_Piso</th>     

                 </tr>
             </thead>
      
             <% 
             while(rs.next()){
                 
                 centinela="s";
                id_hab=rs.getString(1);
                nombre=rs.getString(2);
                id_piso=rs.getString(3);
             
             %>
             <tbody>
                 <tr>
                     <td><%=id_hab%></td>
                     <td><%=nombre%></td>
                     <td><%=id_piso%></td>
                     
                     
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
             
             <a href="javascript:imprSelec('tabla_resultado')" class="btn btn-secondary">Imprimir</a>
</script>
</html>
