<%-- 
    Document   : seguridadVendedor
    Created on : 11-mar-2021, 12:20:28
    Author     : pc
--%>

<%
 String usuario= (String)session.getAttribute("s_usuario");
 String rol=(String)session.getAttribute("s_rol");
 
if(usuario==null || !rol.equals("Vendedor"))
{
response.sendRedirect("index.jsp");
}

%>