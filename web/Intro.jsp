<%-- 
    Document   : Intro
    Author     : Aggeliki Grigoropoulou
--%>
<!DOCTYPE HTML>
<html>
	<head>
		<title> Nutriscope | Dashboard </title>
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	
		<!---start-login-script--->
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script src="js/login.js"></script>
		<!---//End-login-script--->
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="css/jquery.mmenu.all.css" />
		<script type="text/javascript" src="js/jquery.mmenu.js"></script>
			<script type="text/javascript">
				//	The menu on the left
				$(function() {
					$('nav#menu-left').mmenu();
				});
		</script>
		<!-----//768px-menu----->
	</head>
	<body>
		<!---start-wrap---->
		<!------start-768px-menu---->

                <%
                    //allow access only if session exists
                    String first= null;
                    if(session.getAttribute("first") == null)
                    {
                        response.sendRedirect("index.jsp");
                    }
                    else first = (String) session.getAttribute("first");
                    String userName = null;
                    String sessionID = null;
                    Cookie[] cookies = request.getCookies();
                    if(cookies !=null){
                    for(Cookie cookie : cookies){
                        if(cookie.getName().equals("first")) userName = cookie.getValue();
                        if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
                    }
                    }else{
                        sessionID = session.getId();
                    }
                %>
			<div id="page">
					<div id="header">
						<a class="navicon" href="#menu-left"> </a>
					</div>
					<nav id="menu-left">
						<ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="features.html">Features</a></li>
							<div class="clear"> </div>
						</ul>
					</nav>
			</div>
		<!------start-768px-menu---->
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<div class="header-left">
					<div class="logo">
						<a href="index.html">Nutriscope</a>
					</div>
                                    <div class="clear"> </div>
                                   
                                    <h3> <font size='5' color=#59193A> Hi <%=userName %>, Login successful.</font></h3>
				</div>
                                
				<div class="header-right">
                                     
					<div class="top-nav"  style="align:justify;" >
                                         
                                       <!-- Your Session ID=<%=sessionID %>  User=<%=first%>  -->
					<ul>
						<li><a href="<%=response.encodeURL("LoginValidation.jsp") %>"> Login Validation</a></li>
						<li><a href=#>Messages</a></li> 
                                                <li> 
                                                    
                                                      <form id="loginForm" action="<%=response.encodeURL("LogOut") %>" method="POST" >
                                                              <input type="submit" id="login" value="LogOut"  style="width:80px; height:40px; float:right; position:relative; top:-80px; right:-80px" />
                                          
                                                      </form>
                                                </li>  
                                               
                                	</ul>
				        </div>   
                                  
                           <!--<div class="sign-ligin-btns">
					<ul>
                                            <li>      
                                                      <form id="loginForm" action="LogOut" method="post">
                                                      
                                                            <input type="submit" id="login" value="LogOut" style="width:80px; height:40px;" />
                                                      </form>
                                              </li>    
                                         </ul>  
                                 --> 
                              </div> 
				<div class="clear"></div>
				</div>
				<div class="clear"> </div>
			</div>
			<!---//End-header---->
			<!----//End-banner---->
			<!----start-content--->
			<div class="content" >
                            
				<div class="content-feature-grids">
					<div class="wrap"> 
						<h1><span>Nutriscope </span> Dashboard  </h1>
					<div class="feature-grid">
						<div class="feature-grid-left  icon1 ">
							<span> </span>
						</div>
						<div class="feature-grid-right">
                                                    <h2><a href="newClient.html" style="position:relative; top:120px; right:-85px"> <span> New Client</span> </a></h2>
						<!--	<p>iOS 7 started with a desire to take an experience people love and make it better. To make it even simpler, more useful, and more enjoyable </p>-->
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon2">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2><a href="#" style="position:relative; top:120px; right:-85px"><span>Search Client</span></a></h2>
							<!--<p>Control Center, AirDrop for iOS, and smarter multitasking are just a few of the great new features in iOS 7. And all your favorite apps have been enhanced</p>-->
						</div>
						<div class="clear"> </div>
					</div>
					

					<div class="feature-grid">
						<div class="feature-grid-left icon5">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2><a href="#" style="position:relative; top:120px; right:-60px"><span>New Food Plan</span></a></h2>
							<!--<p>iOS 7 started with a desire to take an experience people love and make it better. To make it even simpler, more useful, enjoyable </p>-->
						</div>
						<div class="clear"> </div>
					</div>
					<div class="feature-grid">
						<div class="feature-grid-left icon6">
							<span> </span>
						</div>
						<div class="feature-grid-right">
							<h2><a href="#" style="position:relative; top:120px; right:-85px"><span>Statistics</span></a></h2>
							<!--<p>Control Center, AirDrop for iOS, and smarter multitasking are just a few of the great new features in iOS 7. And all your favorite apps</p>-->
						</div>
						<div class="clear"> </div>
					</div>
					<div class="clear"> </div>
				</div>
				</div>
			</div>
				<!---start-bottom-footer-grids---->
				<div class="footer-grids">
					<div class="wrap">
						<div class="footer-grid">
							<h3>Quick Links</h3>
							<ul>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="#">About Features</a></li>
								<li><a href="register.html">Sign Up</a></li>
							</ul>
						</div>
						<div class="footer-grid">
							<h3>More</h3>
							<ul>
								<li><a href="#">FAQ</a></li>
								<li><a href="#">Support</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Terms and Conditions</a></li>
							</ul>
						</div>
						<div class="footer-grid">
							<h3>Connect With Us</h3>
							<ul class="social-icons">
								<li><a class="facebook" href="#"> </a></li>
								<li><a class="twitter" href="#"> </a></li>
								<li><a class="youtube" href="#"> </a></li>
							</ul>
							<p class="copy-right">Nutriscope <a href="#"></a></p>
						</div>
						<div class="footer-grid">
							<h3>Newsletter</h3>
							<p>Subscribe to our newsletter to keep up-to-date with all the latest news.</p>
							<form>
								<input type="text" class="text" value="Your Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Name';}">
								<input type="text" class="text" value="Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Email';}">
								<input type="submit" value="subscribe" />
							</form>
						</div>
						<div class="clear"> </div>
					</div>
				</div>
				<!---//End-bottom-footer-grids---->
			</div>
			<!----//End-content--->
		<!---//End-wrap---->
	</body>
</html>

