<%-- 
    Document   : crearPiso
    Created on : 03-17-2021, 07:53:58 PM
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
        <link href="boostrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="boostrap/js/bootstrap.min.js" type="text/javascript"></script>
        
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
 


          <%
            if(request.getParameter("asignar")!=null){
           String codp=request.getParameter("codigo");
           String piso=request.getParameter("pisos"); 
              
               try{
                   bdSegura bds1 = new bdSegura();
                   Connection conex1 = bds1.conSeg();
                   PreparedStatement ps = null;
                   String centinela = "n";
                   String consulta1 = "select id_piso "
                                    +" from pisos"
                                    +" where id_piso like ? ";
                   
                   ps = conex1.prepareStatement(consulta1);
                   ps.setString(1,codp);
                  
                   ResultSet rs1 = ps.executeQuery();
                   while(rs1.next()){
                       centinela = "s";
                   }
                   
                   if(centinela.equals("s")){
                        %>
                           <div class="alert alert-danger" role="alert" align="center">Ya existe un piso con este código</div>
                        <%    
                   } else{ 
                
                
                
                try{
                    bdSegura dbs = new bdSegura();
                    Connection conex = dbs.conSeg();
                    PreparedStatement pstmt = null;                    
                   int insertCorrecto = 0; 
                    String consulta = "INSERT INTO pisos (id_piso, piso) VALUES (?,?)";
                                                           
                    pstmt = conex.prepareStatement(consulta);
                     pstmt.setString(1,codp);
                     pstmt.setString(2,piso);

                 
                    insertCorrecto = pstmt.executeUpdate();
                    
                    if(insertCorrecto >= 1){
                        %>
                           <div class="alert alert-success" role="alert" align="center">Piso ingresado exitosamente!!!</div>
                        <% request.getRequestDispatcher("pisos.jsp").forward(request, response);
                            
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
             

<br>

<h1 align="center">Registro de pisos</h1>    
<br>
</div>

    <form class="form-signin" role="form" method="POST" action="crearPiso.jsp" align="center" >
<div class="container" style="position:absolute; left: 420px; top: 100px;">
    <br>   
    <div class="form-group col-sm-9">
        <br>
        <label style="color: #0062cc ; font-family: Nobile-bold; " class="col-sm-3 control-label">Codigo:</label>
                      <div class="col-sm-7">
                          <input type="number" name="codigo" id="codigo" class="form-control" required="required" placeholder="Ingrese el codigo del piso" autocomplete="off" > 
                        </div>
                        </div>
                         <div class="form-group col-sm-9">
                      <label style="color: #0062cc ; font-family: Nobile-bold; "class="col-sm-3 control-label">Número de piso:</label>
                      <div class="col-sm-7">
                        <input type="number" name="pisos" id="nombre" class="form-control" required="required" placeholder="Ingrese el número de piso" autocomplete="off" >
			</div>
                         </div>
                       
                        </div>
    <input style="position:absolute; left: 630px; top: 340px;" type="submit" name="asignar" value="Ingresar" class="btn btn-lg btn-warning"> 
    </form>  
                    <a href="pisos.jsp">
                       <img src="salir.png" alt="" style="height:70px; width: 70px;  position:absolute; left: 50px; top: 510px;"/>
                    </a>
    	
    </body>
</html>