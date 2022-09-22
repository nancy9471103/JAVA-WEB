package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import baseDatos.bdSegura;

public final class registrarUsuario_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("                   \n");
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
      out.write("        <link href=\"boostrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"boostrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("    </head>\n");
      out.write("     \t<body>\n");
      out.write("            <div>\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("<header id=\"header\">\n");
      out.write("  <div class=\"intro\">\n");
      out.write("      \n");
      out.write("  <div class=\"container\">\n");
      out.write("  <div class=\"row\">\n");
      out.write("  <div class=\"intro-text\">\n");
      out.write("      <table class=\"table\">\n");
      out.write("           \n");
      out.write("        </table>\n");
      out.write("  \n");
      out.write("  <script src=\"encriptar/md5.js\" type=\"text/javascript\"></script>      \n");
      out.write("<script  type=\"text/javascript\"> \n");
      out.write("            function modificarClave(texto){\n");
      out.write("                var claveCifrada = hex_md5(texto);\n");
      out.write("                document.getElementById(\"idclave\").value = claveCifrada;\n");
      out.write("            }\n");
      out.write("        \n");
      out.write("        </script>   \n");
      out.write("      \n");
      out.write("        <title>Crear Usuario</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");
  
       if(request.getParameter("guardar")!=null)
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
            
      out.write("\n");
      out.write("        \n");
      out.write("            \n");
      out.write("            <div class=\"footer-box pad-top-70\">\n");
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
      out.write("            \n");
      out.write("        \n");
      out.write(" <div class=\"card\">\n");
      out.write("                     \n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <div class=\"container\">\n");
      out.write(" \n");
      out.write("\n");
      out.write("    <form class=\"form-signin\" role=\"form\" method=\"POST\" action=\"crearHabitacion.jsp\" align=\"center\" >\n");
      out.write("        <br>\n");
      out.write("   \n");
      out.write("                                <div class=\"banner-text\">\n");
      out.write("                                 <h2>Ingresar tus datos </h2>\n");
      out.write("                                </div>\n");
      out.write("              \n");
      out.write("           \n");
      out.write("                        \n");
      out.write("        \n");
      out.write("         <form  method=\"POST\" action=\"registrarUsuario.jsp\">\n");
      out.write("  \n");
      out.write("\n");
      out.write("         <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Usuario</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"idusuario\" name=\"txtusuario\">\n");
      out.write("      </div>    \n");
      out.write("            \n");
      out.write("  <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">clave</label>\n");
      out.write("    <input type=\"password\" class=\"form-control\" id=\"idclave\" name=\"txtclave\">\n");
      out.write("      </div>\n");
      out.write(" \n");
      out.write(" \n");
      out.write(" <div class=\"mb-3\">\n");
      out.write("     \n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"idtusuario\" name=\"txttipou\" value=\"cliente\" readonly=\"\" hidden=\"\" >\n");
      out.write("      </div>\n");
      out.write("             \n");
      out.write("           \n");
      out.write("    \n");
      out.write("          \n");
      out.write(" \n");
      out.write("             <br>\n");
      out.write("             <center><button type=\"submit\" class=\"btn btn-outline-info\" name=\"guardar\" onclick=\"modificarClave(document.getElementById('idclave').value)\" value=\"Guardar\">Guardar</button> </center>\n");
      out.write("            \n");
      out.write("                    \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  <!--botones-->\n");
      out.write("  <br>\n");
      out.write("         </form></form></div></div></div></div>\n");
      out.write("      \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("              <div class=\"text-center\">\n");
      out.write("                            \n");
      out.write("         <td><a href=\"login.jsp\"> <input type=\"submit\" name=\"salir\" value=\"salir\" class=\"btn btn-lg btn-danger btn-block\"></a></td> \n");
      out.write("        \n");
      out.write("   </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
