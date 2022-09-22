package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import baseDatos.bdSegura;

public final class modificarcliente_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/seguridadAdmin.jsp");
  }

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
      out.write('\n');
      out.write('\n');

 String usuario= (String)session.getAttribute("s_usuario");
 String rol=(String)session.getAttribute("s_rol");
 
if(usuario==null || !rol.equals("Admin"))
{
response.sendRedirect("index.jsp");
}


      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\t<head> \n");
      out.write("            \n");
      out.write("                      \n");
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
      out.write("        <title>Modificar Clientes</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("          \n");
      out.write("        ");
  
            String pidc=request.getParameter("pidc");
            String pnom=request.getParameter("pnom");
            String pident=request.getParameter("pident");
            String ptel=request.getParameter("ptel");
            String pidh=request.getParameter("pidh");
           String pfing=request.getParameter("fing");
           String pfins=request.getParameter("pfins");
           
            
       if(request.getParameter("modificar")!=null)
       {
       String id_cliente=request.getParameter("txtidc");
       String nombre=request.getParameter("txtnombre");
       String identidad=request.getParameter("txtidentidad");
       String id_hab=request.getParameter("txtidhab");
       String fechaing=request.getParameter("txtfing");
       String fechaSal=request.getParameter("txtfsal");
       
       
       try
      {
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
       PreparedStatement pstmt=null;
       int insertCorrecto=0;
       String consulta="UPDATE reservacion set id_cliente=?,NombreCliente=?,identidad=?,telefono=?,id_habitacion1=?, fecha_ingreso=?, fecha_salida=?, where id_cliente like ?";
        
       
       pstmt=conex.prepareStatement(consulta);

pstmt.setString(1,id_cliente);
pstmt.setString(2,nombre);
pstmt.setString(3,identidad);
pstmt.setString(4,id_hab);
pstmt.setString(5,fechaing);
pstmt.setString(6,fechaSal);

insertCorrecto=pstmt.executeUpdate();

if(insertCorrecto>=1)
{

      out.write("\n");
      out.write("\n");
      out.write("<div class=\"alert alert-success\" role=\"alert\" align=\"center\">Reservacion Modificado exitosamente</div>\n");
      out.write("\n");

    request.getRequestDispatcher("cliente.jsp").forward(request, response);
}else{


      out.write("\n");
      out.write("\n");
      out.write("<div class=\"alert alert-danger\" role=\"alert\" align=\"center\">reservacion No se pudo Modificar</div>\n");
      out.write("\n");

}

      out.write("\n");
      out.write("<div class=\"alert alert-danger\" role=\"alert\" align=\"center\">Reservacion No se pudo Modificar!!</div>\n");


pstmt.close();
conex.close();
}catch(Exception e)
{
e.printStackTrace();

     } 
}
     
            
      out.write("\n");
      out.write("        \n");
      out.write("           <div class=\"footer-box pad-top-70\">\n");
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
      out.write("             <div class=\"container\">\n");
      out.write("                <div class=\"row\"> </div>\n");
      out.write("                <br>\n");
      out.write("                  <div class=\"banner-text\">\n");
      out.write("                                 <h2>Modificar datos del cliente </h2>\n");
      out.write("                  </div><br>\n");
      out.write("                            \n");
      out.write("                                <div class=\"container\">\n");
      out.write("  <div class=\"row\">\n");
      out.write("    <div class=\"col-sm\">\n");
      out.write("        \n");
      out.write("         <form  method=\"POST\" action=\"modificarcliente.jsp\">\n");
      out.write("  \n");
      out.write("                <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Codigo Cliente</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"idcliente\" name=\"txtidc\" value=\"");
      out.print(pidc);
      out.write("\">\n");
      out.write("      </div>\n");
      out.write("    \n");
      out.write("     \n");
      out.write("                <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Nombre</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"nombre\" name=\"txtnombre\" value=\"");
      out.print(pnom);
      out.write("\">\n");
      out.write("      </div>\n");
      out.write("            \n");
      out.write("             <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Identidad</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"identidad\" name=\"txtidentidad\" value=\"");
      out.print(pident);
      out.write("\">\n");
      out.write("      </div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Codigo Habitacion</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"idha\" name=\"txtcliente\" value=\"");
      out.print(ptel);
      out.write("\">\n");
      out.write("      </div>\n");
      out.write("     \n");
      out.write("           <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Codigo Cliente</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"idcclie\" name=\"txtidhab\" value=\"");
      out.print(pidh);
      out.write("\">\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("        <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Fecha Ingreso</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"fingreso\" name=\"txtfing\" value=\"");
      out.print(pfing);
      out.write("\">\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("        <div class=\"mb-3\">\n");
      out.write("    <label  class=\"form-label\">Fecha Salida</label>\n");
      out.write("    <input type=\"text\" class=\"form-control\" id=\"fsali\" name=\"txtfsal\" value=\"");
      out.print(pfins);
      out.write("\">\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("    </div></div>\n");
      out.write("      </select>\n");
      out.write("      \n");
      out.write("      \n");
      out.write("      \n");
      out.write("      <br>\n");
      out.write("           \n");
      out.write("      <center>\n");
      out.write("  \n");
      out.write("          <button type=\"submit\" class=\"btn btn-danger\" name=\"modificar\"  value=\"Modificar\">Modificar</button>\n");
      out.write(" \n");
      out.write("  \n");
      out.write("   <a href=\"cliente.jsp\"><button type=\"button\" name=\"usuarioAdmin\" value=\"usuarioAdmin\"class=\"btn btn-warning\">Cancelar Modificasion</button></a>\n");
      out.write("                   \n");
      out.write("      </center>\n");
      out.write("      \n");
      out.write("      <br>\n");
      out.write("</form>\n");
      out.write("    <link href=\"recursos/dist/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    \n");
      out.write("   \n");
      out.write("    </body>\n");
      out.write("   \n");
      out.write("</html>\n");
      out.write("\n");
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
