<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style>
    
/*-- footer --*/

.footer-nav li {
    list-style-type: none;
    display: inline-block;
    margin: 0px 1em;
    border-bottom: 2px solid rgba(226, 222, 222, 0);
}

ul.footer-nav,
.agileits_w3layouts-copyright {
    text-align: center;
    border: 1px solid #464646;
    border-width: 1px 0;
}

ul.footer-nav li a {
    color: #fff;
    font-size: 1.1em;
    padding: 1em;
    display: inline-block;
}

ul.footer-nav li a:hover {
    color: #d66047;
}

.footer-nav li:hover {
    border-bottom: 2px solid #d66047;
}

ul.footer-nav li a.active {
    color: #d66047;
    font-weight: 600;
}

.w3_agile-footer-grids {
    padding: 3em 0 2em;
}

.w3_agile-footer1.f1 h2 a {
    color: #fff;
    font-size: 1.3em;
}

.w3_agile-footer1 h5.f1 {
    margin: 1.1em 0 0.5em;
}

.w3_agile-footer1 h5 {
    text-transform: uppercase;
    font-size: 1.1em;
    color: #e96147;
    font-weight: 600;
    margin: 0 0 1.5em;
}

ul.w3ls-footer-bottom-list li {
    list-style-type: none;
    margin: 0.5em 0;
    text-transform: capitalize;
}

ul.w3ls-footer-bottom-list li a,
ul.footer-social-icons li a {
    color: #777;
}


ul.footer-social-icons li {
    color: #000;
    margin: 0 2em 0 0;
    list-style-type: none;
    display: inline-block;
}

.agileits_w3layouts-copyright {
    padding: 1em;
    text-align: center;
}

.agileits_w3layouts-copyright p a {
    color: #e96147;
}

.agileits_w3layouts-copyright p a:hover {
    color: #777;
}

.agile-footer.w3ls-section {
    padding: 2em 0 0;
    background: #192021;
}

/*-- //footer --*/
    </style>
    <!-- footer -->
    <div class="agile-footer w3ls-section">
        <div class="container">
            <div class="list-footer">
                <ul class="footer-nav">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="services.html">Menu</a>
                    </li>
                    <li>
                        <a href="gallery.html">Gallery</a>
                    </li>
                    <li>
                        <a href="contact-us">Contact</a>
                    </li>
                </ul>
            </div>
            <div class="agileits_w3layouts-footer-bottom">
                <div class="w3_agile-footer-grids">
                    <div class="col-md-3  w3_agile-footer1 f1">
                      
                        <h5 class="f1">about us</h5>
                        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem atus error sit volupt unde omnis iste
                            iatis un.</p>
                    </div>
                    <div class="col-md-6  w3_agile-footer1 f2">
                        <div class="col-md-4 col-sm-4 col-xs-4 inner-li">
                            <h5>Doctors</h5>
                            <ul class="w3ls-footer-bottom-list">
                                <li>
                                    <a class="page-scroll scroll" href="#about">volupta</a>
                                </li>
                                <li>
                                    <a class="page-scroll scroll" href="#pricing">omnis</a>
                                </li>
                                <li>
                                    <a class="page-scroll scroll" href="#gallery">iatis</a>
                                </li>
                                <li>
                                    <a class="page-scroll scroll" href="#team">Sedutp</a>
                                </li>
                                <li>
                                    <a class="page-scroll scroll" href="#contact">undeo</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 inner-li">
                            <h5>Ambulance</h5>
                            <ul class="w3ls-footer-bottom-list">
                                <li>
                                    <a href="#">iste</a>
                                </li>
                                <li>
                                    <a href="#">perspi</a>
                                </li>
                                <li>
                                    <a href="#">natus</a>
                                </li>
                                <li>
                                    <a href="#">atisu</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4 inner-li">
                            <h5>support</h5>
                            <ul class="w3ls-footer-bottom-list">
                                <li>
                                    <a href="#">suppport</a>
                                </li>
                                <li>
                                    <a href="#">FAQ</a>
                                </li>
                                <li>
                                    <a href="#">media</a>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-md-3  w3_agile-footer1 f3">
                        <h5>follow us</h5>
                        <ul class="footer-social-icons">
                            <li>
                                <a href="#">
                                    <i class="fa icon1 fa-facebook icons" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa icon2 fa-twitter icons" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa icon3 fa-google-plus icons" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <i class="fa icon3 fa-linkedin icon4 icons" aria-hidden="true"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            </div>
            </div>
    
  <%-- <footer  id="footer" class="container-fluid " style="background:#383535">
                <div class="text-center"><a   href="#myPage" title="To Top">
                  <span class="glyphicon glyphicon-chevron-up "></span>
                </a>
              </div>
              <!-- text-xs-center text-sm-left text-md-left -->
              <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <h4>Useful links</h4>
                  <ul class="list-unstyled quick-links">
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Videos</a></li>
                  </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                   <a href="contact-us"><h4>CONTACT US</h4></a>                 
                    <ul class="list-unstyled quick-links">
                     <li><a href='<c:url value="vendorlogin"></c:url>'><i class="fa fa-angle-double-right"></i>Business With Us</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
                  </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <h4>Link with us</h4>
                  <ul class="list-unstyled quick-links">
                   <li><a href='<c:url value="vendorlogin"></c:url>'><i class="fa fa-angle-double-right"></i>Business With Us</a></li>
                    <li data-toggle="modal" data-target="#vendorlogin" ><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Login</a></li>
                    <li data-toggle="modal" data-target="#vendorregister"><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Register</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Help</a></li>
                    <li><a href="#" ><i class="fa fa-angle-double-right"></i>About us</a></li>
                  </ul>
                </div>
              </div>

              <div class="row" style="margin-top: 10px;background:#443e3e">
                <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                  <ul class="list-unstyled list-inline social text-center">
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-facebook"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-google-plus"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();" target="_blank"><i class="fa fa-envelope"></i></a></li>
                  </ul>
                </div>
              </hr>
            </div>
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
                <p>National Transaction Corporation </p>
                <p>@Copyright2018-2019 realcom infocom pvt.ltd.<a href="#" title=""></a></p>
              </div>
            </hr>
          </div>


          <!-- ./Footer --> --%>

        </footer>
 
