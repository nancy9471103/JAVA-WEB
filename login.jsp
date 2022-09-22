
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="baseDatos.bdSegura"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    
    <script src="encriptar/md5.js" type="text/javascript"></script>
        <script  type="text/javascript"> 
            function modificarClave(texto){
                var claveCifrada = hex_md5(texto);
                document.getElementById("idclave").value = claveCifrada;
            }
               </script> 
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



</head>

                        
<body>
    
    <div id="loader">
        <div id="status"></div>
    </div>
    <div id="site-header">
        <header id="header" class="header-block-top">
            <div class="container">
                <div class="row">
                    <div class="main-menu">
                      
                        <nav class="navbar navbar-default" id="mainNav">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                    <span class="sr-only">navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <div class="logo">
                                    <a class="navbar-brand js-scroll-trigger logo-header" href="#">
                                        </a>
                                </div>
                            </div>
                            <div id="navbar" class="navbar-collapse collapse">
                                <center><ul class="nav navbar-nav navbar-center">
                                    
                                    <li class="active"><a href="#footer">Inicio</a></li>
                                    <li><a href="#about">Ingresar </a></li>
                                    <li><a href="#gallery">Habitaciones</a></li>
                                    <li><a href="#menu">Localidades</a></li>
                                    <li><a href="#banner">registrarme</a></li>
                                    <li><a href="#">Quienes Somos</a></li>
                                </ul></center>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        
    </div>
    
   
     <div id="footer" class="footer-box pad-top-70">
            <div class="container">
                <div class="row">
                    <div class="footer-in-main">
                        <div class="footer-logo">
                            <div class="text-center">
                                <img src="recursos/images/CasaMar.png"  width="550" height="400" alt="" >
                                <div class="banner-text">
                                 <h2>Las Mejores Vacaciones de tu vida</h2>
                                </div>
                                <h2><span class="typer" id="some-id" data-delay="100" data-delim=":" data-words="Vive:disfruta: y celebra..." data-colors="red"></span><span class="cursor" data-cursorDisplay="_" data-owner="some-id"></span></h2>
                            <p>HOTEL CASA MAR RESORT</p>
                            <div class="book-btn">
                            </div>
                            <a href="#about"></a>
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
                       <br> <center>   <h2 class="block-title"> Bienvenido </h2>
                            <h2 class="block-title"> Ingrese sus datos  </h2></center>
                    
    
            <form action="#!">
               <div class="mb-3">
    <label  class="form-label">Id Usuario</label>
                <input type="text" class="form-control" id="idusuario" name="txtusuario">
              </div> 
              <div class="mb-3">
    <label  class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="idclave" name="txtclave">
              </div>
                <br>
           <center> 
            <button type="submit" class="btn btn-primary" name="ingresar"  value="ingresar" onclick="modificarClave(document.getElementById('idclave').value)">Ingresar</button>
         </center>
        </form> 
                       
      
  
  </div>
                </div>
                <!-- end col -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <div class="about-images">
                            <img class="about-inset" src="recursos/images/logo14.png" alt="About Inset Image">
                        </div>
                    </div>
                </div>
         
            </div>
      
        </div>
 
    </div>
     <%
            if(request.getParameter("ingresar")!=null)
            {
            String user=request.getParameter("txtusuario");
            String pass=request.getParameter("txtclave");
            String rol="";
            try
            {
            bdSegura dbs= new bdSegura();
            Connection conex= dbs.conSeg();
            PreparedStatement psmt=null;
            
            String consulta="Select Usuario, Clave, TipoUsuario from usuarios where Usuario like ? and clave like ? ";
            psmt=conex.prepareStatement(consulta);
            psmt.setString(1,user);
             psmt.setString(2,pass);
            
            ResultSet rs=psmt.executeQuery();
            
            String centinela="n";
            
            while(rs.next())
            {
             centinela="s";
             rol=rs.getString(3);
                
            }
            if( centinela.equals("s"))
            {
            session.setAttribute("s_usuario",user);
            session.setAttribute("s_rol", rol);
            if(rol.equals("Admin")){
            request.getRequestDispatcher("usuarioAdmin.jsp").forward(request, response);
            }
            if(rol.equals("Cliente")){
            request.getRequestDispatcher("usuarioCliente.jsp").forward(request, response);
            }
            if(rol.equals("Vendedor")){
            request.getRequestDispatcher("usuarioVendedor.jsp").forward(request, response);
            }
            }else {
            
                %>
                <div class="alert alert-danger" role="alert" align="center">Usuario o Clave, Incorrecta</div>
                
                <%
            
            }
                psmt.close();
                conex.close();

            } catch (Exception e)
               {
              e.printStackTrace();
               }
            
            
            }
          %>
          
          <%
            
            
        if(request.getParameter("registro")!=null)
        {
        request.getRequestDispatcher("registrarUsuario.jsp").forward(request, response);
        }
        
        %>   
        
                  
                <!-- end col -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <div class="about-images">
                            <img class="about-inset" src="recursos/images/logo14.png" alt="About Inset Image">
                        </div>
                    </div>
                </div>
         
           
      
     
 
  

    <div id="gallery"  class=" special-menu pad-top-100 parallax">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s"><BR><BR><BR><BR>
                        <h2 class="block-title color-white text-center"> Nuestras Habitaciones </h2>
                    </div>
                    <div class="special-box">
                        <div id="owl-demo">
                            <div class="item item-type-zoom">
                                <a href="#" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            Habitacion eLEGANTE CON VISTA AL MAR
                                            <div class="line"></div>
                                            <div class="dit-line">XXXXXXX XXXXXXX</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="recursos/images/hotel1.jpg" width="550" height="400" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="#" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            XXXXXX XXXXXX
                                            <div class="line"></div>
                                            <div class="dit-line"> XXXXX XXXXXXXXX XXXXXXXXXX XXXXXXXXXXX.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="recursos/images/hotel2.jpg" width="440" height="560" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="#" class="item-hover">
                                    <div class="item-info">
                                        
                                        <div class="headline">
                                           XXXXXXXXXX
                                            <div class="line"></div>
                                            <div class="dit-line">XXXXXXXX XXXXXXXXXXXX XXXXXXXXXXXX XXXXXXXXX.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="recursos/images/hotel3.jpg" width="440" height="560" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="#" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                            XXXXXXXX
                                            <div class="line"></div>
                                            <div class="dit-line">XXXXXXX XXXXXXXXXXX XXXXXXXXXXXX XXXXXXXXXXXX</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="recursos/images/hotel4.jpg" alt="sp-menu">
                                </div>
                            </div>
                            <div class="item item-type-zoom">
                                <a href="#" class="item-hover">
                                    <div class="item-info">
                                        <div class="headline">
                                           XXXXXXXX
                                            <div class="line"></div>
                                            <div class="dit-line">XXXXXXXXXX XXXXXXXXXXXXX XXXXXXX XXXXXXXX.</div>
                                        </div>
                                    </div>
                                </a>
                                <div class="item-img">
                                    <img src="recursos/images/hotel5.jpg" alt="sp-menu"><BR><BR>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
               
            </div>
            
        </div>
       
    </div>
   

    <div id="menu" class="gallery-main pad-top-100 pad-bottom-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                        <h2 class="block-title text-center">
						Localidades	
					</h2>
                        <p class="title-caption text-center">La mejor felicidad se disfruta en familia </p>
                    </div>
                    <div class="gal-container clearfix">
                        <div class="col-md-8 col-sm-12 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#1">
                                    <img src="recursos/images/9.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="1" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/9.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#2">
                                    <img src="recursos/images/2.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="2" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/2.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#3">
                                    <img src="recursos/images/3.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="3" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/3.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#4">
                                    <img src="recursos/images/4.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="4" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/4.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#5">
                                    <img src="recursos/images/5.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="5" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/5.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#9">
                                    <img src="recursos/images/6.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="9" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/6.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-12 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#10">
                                    <img src="recursos/images/7.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="10" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/7.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#11">
                                    <img src="recursos/images/gallery_08.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="11" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/gallery_08.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#12">
                                    <img src="recursos/images/1.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="12" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/1.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 co-xs-12 gal-item">
                            <div class="box">
                                <a href="#" data-toggle="modal" data-target="#13">
                                    <img src="recursos/images/gallery_10.jpg" alt="" />
                                </a>
                                <div class="modal fade" id="13" tabindex="-1" role="dialog">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                            <div class="modal-body">
                                                <img src="recursos/images/gallery_10.jpg" alt="" />
                                            </div>
                                            <div class="col-md-12 description">
                                                <h4></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
            
    <div id="blog-" class="blog-main pad-top-100 pad-bottom-100 parallax">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h2 class="block-title text-center"> </h2> <div class="blog-btn-v"></div></div></div></div></div>
   
                            <div class="panel-footer"></div>
                 
                            <div class="panel-footer">
                             
                            </div>
                        
   

    <div id="banner" class="reservations-main pad-top-100 pad-bottom-100">
        <div class="container">
            <div class="row">
                <div class="form-reservations-box">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="wow fadeIn" data-wow-duration="1s" data-wow-delay="0.1s">
                            <h2 class="block-title text-center"><br>
						Ingreso de Datos			
					</h2>
                        </div>
                        <h4 class="form-title">PULSA LA TECLA REGISTRAR PARA CREAR UN USUARIO O ADMINISTRADOR </h4> <br>
                        <p>¡GRACIAS POR SU PREFERENCIA!</p>

                         
                            
                                <div class="reserve-book-btn text-center">
                                <form action="#!">
                                     <center><button type="submit" class="btn btn-danger" name="registro"  value="registro">Registrarme</button></center>
                                     <br><br></form>
                                </div>
                            </div>
                            
                     
                       
                    </div>
                    
                </div>
                
            </div>
         
        </div>
  
   


        <div class="footer-box pad-top-70">
            <div class="container">
                <div class="row">
                    <div class="footer-in-main">
                        <div class="footer-logo">
                            <div class="text-center">
                                <img src="recursos/images/CasaMar.png"  width="350" height="200" alt="" >
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-a">
                                <h3>Sobre nosotros</h3>
                                
                                <p>Nuestro hotel cuanta con todas las instalciones necesarias para que puedas tener unas de las mejores experiencias de estadia de tu vida.
                                Contamos con certificados calificados por asociaciones que hacen que nuestro hotel sea el mejor en el mercado </p>
                                <p>Puedes Encontrarnos en nuestras redes sociales.</p>
                                <ul class="socials-box footer-socials pull-left">
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border">casamarhotel@gamai.com<i class="fa  fa-facebook"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-twitter"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-google-plus"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                       
                                        </a>
                                    </li>
                                    <li>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                         
                        </div>
                      
                        
                        
                        
                           <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="footer-box-a">
                                <h3>Sobre nosotros</h3>
                                
                                <p>Nuestro hotel cuanta con todas las instalciones necesarias para que puedas tener unas de las mejores experiencias de estadia de tu vida.
                                Contamos con certificados calificados por asociaciones que hacen que nuestro hotel sea el mejor en el mercado </p>
                                <p>Puedes Encontrarnos en nuestras redes sociales.</p>
                                <ul class="socials-box footer-socials pull-left">
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border">casamarhotel@gamai.com<i class="fa  fa-facebook"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-twitter"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="social-circle-border"><i class="fa fa-google-plus"></i></div>
                                        </a>
                                    </li>
                                    <li>
                                       
                                        </a>
                                    </li>
                                    <li>
                                        </a>
                                    </li>
                                </ul>

                            </div>
                         
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    </div>
                  
                </div>
            </div>
            
         
            <div id="copyright" class="copyright-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <h6 class="copy-title"> Copyright &copy;<a href="#" target="_blank"></a> </h6>
                        </div>
                    </div>
                  
                </div>
           
            </div>
         
        </div>
   
    <script src="recursos/js/all.js"></script>
    <script src="recursos/js/bootstrap.min.js"></script>
   
    <script src="recursos/js/custom.js"></script>
</body>

</html>