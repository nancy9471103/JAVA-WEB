<%-- 
    Document   : seguridadAdmin
    Created on : 11-mar-2021, 12:18:57
    Author     : pc
--%>

<%
 String usuario= (String)session.getAttribute("s_usuario");
 String rol=(String)session.getAttribute("s_rol");
 
if(usuario==null || !rol.equals("Admin"))
{
response.sendRedirect("index.jsp");
}

%>
