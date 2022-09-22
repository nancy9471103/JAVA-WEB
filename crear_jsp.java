package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import baseDatos.bdSegura;

public final class crear_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("                    \n");
      out.write("        <script src=\"encriptar/md5.js\" type=\"text/javascript\"></script>      \n");
      out.write("<script  type=\"text/javascript\"> \n");
      out.write("            function modificarClave(texto){\n");
      out.write("                var claveCifrada = hex_md5(texto);\n");
      out.write("                document.getElementById(\"idclave\").value = claveCifrada;\n");
      out.write("            }\n");
      out.write("        \n");
      out.write("        </script>\n");
      out.write("            \n");
      out.write("<meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0\">\n");
      out.write("    <title>Hotel</title>\n");
      out.write("    <meta name=\"keywords\" content=\"\">\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("    \n");
      out.write("     \n");
      out.write("    <link rel=\"shortcut icon\" href=\"recursos/images/favicon.ico\" type=\"image/x-icon\" />\n");
      out.write("    <link rel=\"apple-touch-icon\" href=\"recursos/images/apple-touch-icon.png\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"recursos/css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"recursos/css/style.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"recursos/css/responsive.css\">\n");
      out.write("    <link id=\"\" rel=\"stylesheet\" href=\"recursos/css/colors/orange.css\" />\n");
      out.write("\n");
      out.write("\n");
      out.write("    <script src=\"recursos/js/modernizer.js\"></script>\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"  href=\"recursos/css/bootstrap.css\">\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"recursos/fonts/font-awesome/css/font-awesome.css\">\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\"  href=\"recursos/css/style.css\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css?family=Rochester\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("         <title>Administrar Cliente</title>\n");
      out.write("         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\"/>\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("    </head>\n");
      out.write("     \t<body>\n");
      out.write("            <div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("          ");

            if(request.getParameter("asignar")!=null){
           String codc=request.getParameter("txtcodigo");
           String nom=request.getParameter("txtnombre"); 
            String ident=request.getParameter("txtident");
             String tel=request.getParameter("txttel");
             String hab=request.getParameter("txthab");
             String ing=request.getParameter("datepicker");
             String sal=request.getParameter("datepicker2");
              
               try{
                   bdSegura bds1 = new bdSegura();
                   Connection conex1 = bds1.conSeg();
                   PreparedStatement ps = null;
                   String centinela = "n";
                   String consulta1 = "select id_cliente"
                                    +" from clientes"
                                    +" where id_cliente like ? ";
                   
                   ps = conex1.prepareStatement(consulta1);
                   ps.setString(1,codc);
                  
                   ResultSet rs1 = ps.executeQuery();
                   while(rs1.next()){
                       centinela = "s";
                   }
                   
                   if(centinela.equals("s")){
                        
      out.write("\n");
      out.write("                           <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">Ingresado con éxito</div>\n");
      out.write("                        ");
    
                   } else{ 
                
                
                
                try{
                    bdSegura dbs = new bdSegura();
                    Connection conex = dbs.conSeg();
                    PreparedStatement pstmt = null;                    
                   int insertCorrecto = 0; 
                    String consulta = "INSERT INTO clientes (id_cliente,NombreCliente,identidad,telefono,id_habitacion1,fecha_ingreso,fecha_salida) VALUES (?,?,?,?,?,?,?)";
                                                           
                    pstmt = conex.prepareStatement(consulta);
                     pstmt.setString(1,codc);
                     pstmt.setString(2,nom);
                     pstmt.setString(3,ident);
                     pstmt.setString(4,tel);
                     pstmt.setString(5,hab);
                     pstmt.setString(6,ing);
                     pstmt.setString(7,sal);
                 
                    insertCorrecto = pstmt.executeUpdate();
                    
                    if(insertCorrecto >= 1){
                        
      out.write("\n");
      out.write("                           <div class=\"alert alert-success\" role=\"alert\" align=\"center\">Vendedor ingresado exitosamente!!!</div>\n");
      out.write("                        ");
 request.getRequestDispatcher("cliente.jsp").forward(request, response);
                            
                    }else{
                        
      out.write("\n");
      out.write("                           <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">No se pudo ingresar!!!</div>\n");
      out.write("                        ");
                  
                    }     
                    
                     
                    
                    
                    pstmt.close();
                    conex.close();
                }catch(Exception e){
                    
      out.write("\n");
      out.write("                        <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">No se pudo ingresar!!!</div>\n");
      out.write("                    ");
 
                }
                
                 } 
                   ps.close();
                   conex1.close();
            }catch(Exception e){
                           e.printStackTrace();
                       }
               }
     
        
        
        
        
      out.write("\n");
      out.write("       ");
 
   if(request.getParameter("asignar")!=null)
       {
       String iduser=request.getParameter("txtidusuario");
       String user=request.getParameter("txtusuario");
       String clave=request.getParameter("txtclave");
       String tipou=request.getParameter("txttipou");
       
       try
       {
       bdSegura bds1=new bdSegura();
       Connection conex1=bds1.conSeg();
       PreparedStatement ps=null;    
       String centinela="n";
       String consulta1="Select Id_usuario  "
                        +"from usuarios "
                        +" where Id_usuario like ? ";
       ps=conex1.prepareStatement(consulta1);
       ps.setString(1, iduser);
       ResultSet rs1=ps.executeQuery();
       while(rs1.next())
       {
       centinela="s";
       }
       if(centinela.equals("s"))
       {
       
      out.write("\n");
      out.write("       <div class=\"alert alert-danger\" role=\"alert\" align=\"center\">Ya existe un usuario con este codigo</div>\n");
      out.write("       \n");
      out.write("       ");

           
       }else{
       
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="INSERT INTO usuarios (Id_usuario,Usuario,Clave,TipoUsuario) VALUES (?,?,?,?)";
       pstmt=conex.prepareStatement(consulta);
       pstmt.setString(1,iduser);
pstmt.setString(2,user);
pstmt.setString(3,clave);
pstmt.setString(4,tipou);
insertCorrecto=pstmt.executeUpdate();

if(insertCorrecto>=1)
{

      out.write("\n");
      out.write("\n");
      out.write("<div class=\"alert alert-success\" role=\"alert\" align=\"center\">Usuario ingresado exitosamente!!</div>\n");
      out.write("\n");

}else{


      out.write("\n");
      out.write("\n");
      out.write("<div class=\"alert alert-danger\" role=\"alert\" align=\"center\">Usuario No se pudo Crear!!</div>\n");
      out.write("\n");

}

pstmt.close();
conex.close();
       
       }catch(Exception e){
       
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"alert alert-danger\" role=\"alert\" align=\"center\">Usuario No se pudo Crear!!</div>\n");
      out.write("\n");

       
       }
}
ps.close();
conex1.close();
}catch(Exception e){
e.printStackTrace();
}}
            
      out.write("     \n");
      out.write("        \n");
      out.write(" \n");
      out.write("         <div class=\"footer-box pad-top-70\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"footer-in-main\">\n");
      out.write("                        <div class=\"footer-logo\">\n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <img src=\"recursos/images/CasaMar.png\"  width=\"350\" height=\"200\" alt=\"\" >\n");
      out.write("                            </div>\n");
      out.write("                        </div>      \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\"> </div>\n");
      out.write("                    \n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <div class=\"container\">\n");
      out.write("  <div class=\"row\">\n");
      out.write("    <div class=\"col-sm\">\n");
      out.write("                                \n");
      out.write("           <table class=\"table\">\n");
      out.write("                    <thead class=\"thead-light\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("  <form class=\"form-signin\" role=\"form\" method=\"POST\" action=\"crear.jsp\" align=\"center\" >\n");
      out.write("\n");
      out.write("   \n");
      out.write("    <br>   \n");
      out.write("    <div class=\"form-group col-sm-9\">\n");
      out.write("        <br>\n");
      out.write("     \n");
      out.write("                     \n");
      out.write("                      <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">Nombre del cliente:</label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                        <input type=\"text\" name=\"txtnombre\" id=\"nombre\" class=\"form-control\" required=\"required\" placeholder=\"escribir....\" autocomplete=\"off\" >\n");
      out.write("\t\t\t</div>\n");
      out.write("                      \n");
      out.write("                      <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">Identidad del cliente:</label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                        <input type=\"text\" name=\"txtident\" id=\"nombre\" class=\"form-control\" required=\"required\" placeholder=\"escribir....\" autocomplete=\"off\" >\n");
      out.write("\t\t\t</div>\n");
      out.write("                      \n");
      out.write("                     \n");
      out.write("                      <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">Teléfono del cliente:</label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                        <input type=\"text\" name=\"txttel\" id=\"nombre\" class=\"form-control\" required=\"required\" placeholder=\"escribir....\" autocomplete=\"off\" >\n");
      out.write("\t\t\t</div>\n");
      out.write("                       \n");
      out.write("                      \n");
      out.write("                                           \n");
      out.write("                      <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">Id Habitación:</label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                        <input type=\"number\" name=\"txthab\" id=\"nombre\" class=\"form-control\" required=\"required\" placeholder=\"seleccionar\" autocomplete=\"off\" >\n");
      out.write("                      </div><br> \n");
      out.write("                       \n");
      out.write("                          \n");
      out.write("                      <label style=\"color: #0062cc ; font-family: Nobile-bold;\"class=\"col-sm-3 control-label\" >Fecha de ingreso:</label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                          <input type=\"date\" name=\"datepicker\"  required=\"\" id=\"datepicker\"  >\n");
      out.write("                      </div><br>\n");
      out.write("                    \n");
      out.write("                      <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">Fecha de salida:</label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                        <input type=\"date\" name=\"datepicker2\" required=\"\" id=\"datepicker2\"  >\n");
      out.write("                        </div>\n");
      out.write("                      \n");
      out.write("                      <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">Id Usuario: </label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                      <input type=\"text\" class=\"form-control\" id=\"idusuario\" name=\"txtusuario\" placeholder=\"escribir....\">\n");
      out.write("                         </div>\n");
      out.write("                      \n");
      out.write("                       <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">contraseña: </label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                          <input type=\"password\" class=\"form-control\" id=\"idclave\" name=\"txtclave\" placeholder=\"escribir....\">\n");
      out.write("                        </div>\n");
      out.write("                       \n");
      out.write("                       <label style=\"color: #0062cc ; font-family: Nobile-bold; \"class=\"col-sm-3 control-label\">Tipo de Usuario </label>\n");
      out.write("                      <div class=\"col-sm-7\">\n");
      out.write("                          <input type=\"text\" class=\"form-control\" id=\"idtusuario\" name=\"txttipou\"  value=\"Cliente\">\n");
      out.write("                     </div>\n");
      out.write("                     \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                      \n");
      out.write("                      \n");
      out.write("                       <input \" type=\"submit\" name=\"asignar\" onclick=\"modificarClave(document.getElementById('idclave').value)\" value=\"Ingresar\" class=\"btn btn-lg btn-warning\"> <br><br>\n");
      out.write("    <a href=\"cliente.jsp\"><button type=\"button\" name=\"usuarioAdmin\" value=\"usuarioAdmin\"class=\"btn btn-success\">Atras</button></a>\n");
      out.write("                   \n");
      out.write("    </form>  \n");
      out.write("                    <a href=\"usuarioAdmin.jsp\">\n");
      out.write("                      \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write(" \n");
      out.write("                    </a></div></div></div></div></div></div>\n");
      out.write("\n");
      out.write("      \n");
      out.write("    \t\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
