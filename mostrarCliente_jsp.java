package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormat;
import javax.swing.JOptionPane;
import java.sql.PreparedStatement;
import java.sql.Connection;
import baseDatos.bdSegura;
import java.sql.ResultSet;
import baseDatos.baseDatos;

public final class mostrarCliente_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\t<head> \n");
      out.write("         <title>Datos de reservaci??n</title>\n");
      out.write("\t\t<meta charset=\"utf-8\">\n");
      out.write("\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\"/>\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("\t        <script type=\"text/javascript\">\n");
      out.write("                function Popupventana(url) {\n");
      out.write("                window.open(url, \"Ubicacion\", \"menubar=0,resizable=0,width=800, height=500\")\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("                               function imprSelec(nombre) {\n");
      out.write("\t  var ficha = document.getElementById(nombre);\n");
      out.write("\t  var ventimp = window.open(' ', 'popimpr');\n");
      out.write("          ventimp.document.write('<div align=\"center\">');\n");
      out.write("           ventimp.document.write('<html><head><title>' + document.title  + '</title>');\n");
      out.write("    ventimp.document.write('</head><body >');\n");
      out.write("   ventimp.document.write('<h1>' + document.title  + '</h1>');\n");
      out.write("          ventimp.document.write( ficha.innerHTML ); \n");
      out.write("          ventimp.document.write('</div\">');\n");
      out.write("           ventimp.document.write('</body></html>');\n");
      out.write("\t  ventimp.document.close();\n");
      out.write("          ventimp.onload = function() {\n");
      out.write("\t  ventimp.print();\n");
      out.write("\t  ventimp.close();\n");
      out.write("           };\n");
      out.write("\n");
      out.write("\t}\n");
      out.write("        </script>\n");
      out.write("\t<body>\n");
      out.write("\t<div>\t\t\t\n");
      out.write("       <h3 align=\"center\">Reservacion cliente</h3>\n");
      out.write("       </div>          \n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("\n");
      out.write("<section id=\"tabla_resultado\">  ");

       
       String id_reservacion,piso, id_habitacion, estado,id_cliente;    
       try{
        bdSegura dbs=new bdSegura();
        Connection conex=dbs.conSeg();
        PreparedStatement pstmt=null;
        
        String consulta="select id_reservacion, piso, id_habitacion, estado FROM reservacion where id_cliente";
        pstmt=conex.prepareStatement(consulta);
        ResultSet rs= pstmt.executeQuery();
        
        String centinela="n";
         
         
      out.write("\n");
      out.write("         \n");
      out.write("           <table class=\"table\">\n");
      out.write("                    <thead class=\"thead-light\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"col\">id_reservacion</th>\n");
      out.write("                            <th scope=\"col\">piso</th>\n");
      out.write("                            <th scope=\"col\">id_habitacion</th>\n");
      out.write("                            <th scope=\"col\">estado</th>\n");
      out.write("                            \n");
      out.write("\n");
      out.write("                 </tr>\n");
      out.write("             </thead>\n");
      out.write("      \n");
      out.write("             ");
 
             while(rs.next()){
                 
                 centinela="s";
                id_reservacion=rs.getString(1);
                piso=rs.getString(2);
                id_habitacion=rs.getString(3);
                estado=rs.getString(4);
                
             
             
      out.write("\n");
      out.write("             <tbody>\n");
      out.write("                 <tr>\n");
      out.write("                     <td>");
      out.print(id_reservacion);
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(piso);
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(id_habitacion);
      out.write("</td>\n");
      out.write("                     <td>");
      out.print(estado);
      out.write("</td>\n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                 </tr>\n");
      out.write("                 <br>\n");
      out.write("                  \n");
      out.write("                 ");

                     }

                     
      out.write("\n");
      out.write("                 \n");
      out.write("             </tbody>\n");
      out.write("         </table>\n");
      out.write("         <br>\n");
      out.write("                   <br>\n");
      out.write("                 \n");
      out.write("                 \n");
      out.write("             ");

                 
                 pstmt.close();
                 conex.close();
                
             } catch(Exception e){
             e.printStackTrace();
}
             
             
             
      out.write("\n");
      out.write("        \n");
      out.write("</section> \n");
      out.write("             <a href=\"javascript:imprSelec('tabla_resultado')\" class=\"btn btn-secondary\">Imprimir</a>\n");
      out.write("             \n");
      out.write("</script>\n");
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
