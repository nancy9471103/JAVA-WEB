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


<!DOCTYPE html>
<html>
	<head> 
         <title>Reporte Pisos</title>
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
       <h3 align="center">Pisos</h3>
       </div>          
<br>
<br>

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
