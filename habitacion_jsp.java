package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import baseDatos.bdSegura;

public final class habitacion_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write(' ');
      out.write('\n');
      out.write('\n');

 String usuario= (String)session.getAttribute("s_usuario");
 String rol=(String)session.getAttribute("s_rol");
 
if(usuario==null || !rol.equals("Admin"))
{
response.sendRedirect("index.jsp");
}


      out.write('\n');
      out.write(" \n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\t<head> \n");
      out.write("            \n");
      out.write("            \n");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("    function Popupventana(url)\n");
      out.write("    {\n");
      out.write("        windows.open(url,\"ubicacion\", \"menu=0, resizible=0, width=800, height=500\")\n");
      out.write("        \n");
      out.write("    }\n");
      out.write("    \n");
      out.write("</script>\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"bootstrap/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <title>Administrar Habitaciones</title>\n");
      out.write("        \n");
      out.write("        \n");
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
      out.write("    \n");
      out.write("    <br> <br>\n");
      out.write("                    \n");
      out.write("                 \n");
      out.write("         \n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\"> </div>\n");
      out.write("         <div class=\"container\">\n");
      out.write("                <div class=\"row\"> </div>\n");
      out.write("                \n");
      out.write("                    \n");
      out.write("                 \n");
      out.write("         \n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\"> </div>\n");
      out.write("                    \n");
      out.write("                         \n");
      out.write("        <section id=\"tabla_resultado\">  ");

        
        
         String nombre,apellido,user,tpusuario,iduser;
         
        try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="Select nombre_hab,id_piso1,id_habitacion from habitaciones";
        pstmt=conex.prepareStatement(consulta);
         ResultSet rs= pstmt.executeQuery();
        
         String centinela="n";
         
         
      out.write("\n");
      out.write("         \n");
      out.write("         <table class=\"table\">\n");
      out.write("             <thead>\n");
      out.write("                 <tr>\n");
      out.write("                    \n");
      out.write("                          <th scope=\"col\"> Nombre Habitacion</th>\n");
      out.write("\t\t          <th scope=\"col\"> Codigo Habitacion</th>\n");
      out.write("\t\t          \n");
      out.write("                          \n");
      out.write("                     \n");
      out.write("                 </tr>\n");
      out.write("             </thead>\n");
      out.write("             \n");
      out.write("             ");
 
             while(rs.next()){
                 
                 centinela="s";
                nombre=rs.getString(1);
                apellido=rs.getString(2);
                iduser=rs.getString(3);
             
             
      out.write("\n");
      out.write("             <tbody>\n");
      out.write("                 <tr>\n");
      out.write("                     <td>");
      out.print(nombre);
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(apellido);
      out.write("</td>\n");
      out.write("                     \n");
      out.write("                     <td><a class=\"btn btn-danger\" href=\"modificarhabitacion1.jsp?piduser=");
      out.print(iduser);
      out.write("&pnombre=");
      out.print(nombre);
      out.write("\">Modificar</a>\n");
      out.write("                     <a class=\"btn btn-primary\"href=\"eliminarhabitacion.jsp?pidhab=");
      out.print(iduser);
      out.write("\">Eliminar</a></td>\n");
      out.write("                 </tr>\n");
      out.write("                 ");

                     }

                     
      out.write("\n");
      out.write("                 \n");
      out.write("             </tbody>\n");
      out.write("             \n");
      out.write("                <tbody>\n");
      out.write("                <tr>\n");
      out.write("                    \n");
      out.write("                    <td><a href=\"login.jsp\"> <input type=\"submit\" name=\"salir\" value=\"salir\" class=\"btn btn-lg btn-danger btn-block\"></a></td> \n");
      out.write("                    <td><a href=\"crearHabitacion.jsp\"> <input type=\"submit\" name=\"crear\" value=\"Crear\" class=\"btn btn-lg btn-outline-info btn-block\"></a> </td>\n");
      out.write("                   <td><a href=\"reporteHabitacion.jsp\"> <input type=\"submit\" name=\"Reporte\" value=\"Reporte\" class=\"btn btn-lg btn-outline-info btn-block\"></a> </td>\n");
      out.write("                   \n");
      out.write("    <a href=\"usuarioAdmin.jsp\"><button type=\"button\" name=\"usuarioAdmin\" value=\"usuarioAdmin\"class=\"btn btn-danger\">Atras</button></a>\n");
      out.write("                \n");
      out.write("                </tr> \n");
      out.write("            </tbody>\n");
      out.write("         </table>\n");
      out.write("             \n");
      out.write("             ");

                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             
      out.write("\n");
      out.write("             \n");
      out.write("        \n");
      out.write("         \n");
      out.write("         \n");
      out.write("       \n");
      out.write("        \n");
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
