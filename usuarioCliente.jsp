

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%--  <%@include file="seguridadAdmin.jsp" %> --%>
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
                            <img class="about-inset" src="recursos/images/logocliente.jpg" alt="About Inset Image">
                        </div>
                    </div>
                </div>
            
        
                         

<!DOCTYPE html>




    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
        
<meta name="description" content="">
<meta name="author" content="">
        

        
        <title>usuario cliente</title>
    </head>
   
    
    
    <body>
   
        <br>
        
         <%
         String piso,user,idh,estado;
         
        try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="Select piso,id_habitacion,estado from reservacion";
        pstmt=conex.prepareStatement(consulta);
         ResultSet rs= pstmt.executeQuery();
        
         String centinela="n";
         
         %>
         
         <table class="table">
             <thead>
                 <tr>
                     
                     <th scope="col">Piso</th>
                     <th scope="col">Codigo Habitacion</th>
                     <th scope="col">Estado de Habitacion</th>
                     
                 </tr>
             </thead>
             
          <% 
             while(rs.next()){
                 
                 centinela="s";
               
                piso=rs.getString(1);
                idh=rs.getString(2);
                estado=rs.getString(3);
                
             
             %>
             <tbody>
                 <tr>
                     
                     <td><%=piso%></td>
                     <td><%=idh%></td>
                     <td><%=estado%></td>
                     
                     
                 </tr>
                 <%
                     }

                     %>
                 <table class="table">
            <tbody>
                <tr>
                      
                    
                    <td><a href="login.jsp"> <input type="submit" name="salir" value="salir" class="btn btn-primary" ></a> 
                    
 <a type="submit"  href="reporteCliente.jsp" class="btn btn-primary" class="bt btn-lg btn-primary btn-block" >Mostrar Reporte</a></td>
                   
            </tr> 
            </tbody>
        </table>
             </tbody>
         </table>
             
             <%
                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             %>
             
  
             
             
        
        
        <%  
       if(request.getParameter("guardar")!=null)
       {
       String idr=request.getParameter("txtidreservacion");
       String p=request.getParameter("txtpiso");
       String ih=request.getParameter("txtidh");
       String idc=request.getParameter("txtidc");
       String es=request.getParameter("txtestado");
       
       
       try
       {
       bdSegura bds1=new bdSegura();
       Connection conex1=bds1.conSeg();
       PreparedStatement ps=null;    
       String centinela="n";
       String consulta1="Select id_reservacion  "
                        +"from reservacion "
                        +" where id_reservacion like ? ";
       ps=conex1.prepareStatement(consulta1);
       ps.setString(1, idr);
       ResultSet rs1=ps.executeQuery();
       while(rs1.next())
       {
       centinela="s";
       }
       if(centinela.equals("s"))
       {
       %>
       <div class="alert alert-danger" role="alert" align="center">Ya existe un usuario con este codigo</div>
       
       <%
           
       }else{
       
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="INSERT INTO reservacion (id_reservacion,piso,id_habitacion,id_cliente,estado) VALUES (?,?,?,?,?)";
       pstmt=conex.prepareStatement(consulta);
       pstmt.setString(1,idr);
pstmt.setString(2,p);
pstmt.setString(3,ih);
pstmt.setString(4,idc);
pstmt.setString(5,es);
insertCorrecto=pstmt.executeUpdate();

if(insertCorrecto>=1)
{
%>

<div class="alert alert-success" role="alert" align="center">Gracias Por Tu Preferencia Tu Reservcaion Fue Realizada Con Exito!!</div>

<%
}else{

%>

<div class="alert alert-danger" role="alert" align="center">No Se Puede Realizar La Reservacion Verifique Sus Datos E Intente Nuevamente!!</div>

<%
}

pstmt.close();
conex.close();
       
       }catch(Exception e){
       %>

<div class="alert alert-danger" role="alert" align="center">No Se Puede Realizar La Reservacion Verifique Sus Datos E Intente Nuevamente!!</div>

<%
       
       }
}
ps.close();
conex1.close();
}catch(Exception e){
e.printStackTrace();
}}
            %>
    
            <br><br><br><br>
    
    <center>
        <h2 class="block-title">
        
            Ingrese Datos</h2></center>
         <form  method="POST" action="usuarioCliente.jsp">
  
     
            
       
            
            
            <div class="mb-3">
    <label  class="form-label">Piso</label>
    <input type="text" class="form-control" id="idpiso" name="txtpiso">
      </div>
         <div class="mb-3">
    <label  class="form-label">codigo Habitacion</label>
    <input type="text" class="form-control" id="idhabitacion" name="txtidh">
      </div>    
            
  <div class="mb-3">
    <label  class="form-label">Ingrese Su Codigo De Cliente</label>
    <input type="text" class="form-control" id="idcc" name="txtidc">
      </div>
 <div class="mb-3">
    <label  class="form-label">Confirme Su Reservacion</label>
    <input type="text" class="form-control" id="idestado" name="txtestado">
      </div>
 
            </div>
          
            <center>
  <div class="mb-3">
  <button  type="submit" class="btn btn-primary-info" name="guardar"  value="Guardar">Guardar</button>
  
  
                 
  
  </div></center>
            
           

    </body>
</html>
         
         
       
        
    </body>
</html>