<%-- 
    Document   : index
    Created on : 8 Δεκ 2014, 11:00:36 πμ
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Nutriscope | Home </title>
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		</script>
	    <!---strat-slider---->
	    <script type="text/javascript" src="js/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="css/slider-style.css" />
		<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<!---//strat-slider---->
		<!---start-login-script--->
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
						<a href="index.jsp">Nutriscope</a>
					</div>
				</div>
				<div class="header-right">
					<div class="top-nav">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="features.html">Features</a></li> 
					</ul>
				</div>
				<div class="sign-ligin-btns">
					<ul>
						<li id="signupContainer"><a class="signup" id="signupButton" href="#"><span><i>Signup</i></span></a>
                                                  <div class="clear"> </div>
				                    <div id="signupBox">      
                                                     <script type="text/javascript">
                                                        document.getElementById("signupButton").onclick = function () 
                                                        {
                                                            location.href = "register.html";
                                                        };
                                                     </script>

				                </div>
				            <!-- Signup Ends Here -->
						</li>
						<li id="loginContainer"><a class="login" id="loginButton" href="#"><span><i>Login</i></span></i></a>
							 <div class="clear"> </div>
				                <div id="loginBox">                
				                    <form id="loginForm" action="LogIn" method="GET">
				                        <fieldset id="body">
				                            <fieldset>
				                                <label for="fname">First Name</label>
				                                <input type="text" name="fname" id="loginfname" />
				                            </fieldset>
                                                            <fieldset>
				                                <label for="lname">Last Name</label>
				                                <input type="text" name="lname" id="loginlname" />
				                            </fieldset>
				                            <fieldset>
				                                <label for="pass">Password</label>
				                                <input type="password" name="pass" id="loginpass" />
				                            </fieldset>
				                            <label class="remeber" for="checkbox"><input type="checkbox" id="checkbox" />Remember me</label>
				                            <input type="submit" id="login" value="login" />
				                        </fieldset>
				                        <span><a href="#">Forgot your password?</a></span>
				                    </form>
				                </div>
				            <!-- Login Ends Here -->
						</li>
						<div class="clear"> </div>
					</ul>
				</div>
				<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
			</div>
			</div>
			<!---//End-header---->
			<!----start-banner---->
			<div class="text-slider">
				<div class="wrap"> 
			<!---start-da-slider----->
			<div id="da-slider" class="da-slider">
					<div class="da-slide">
						<h2>Organize your clients</h2>
						<p> Monitor their Progress real time</p>
						<a href="errorPage.html" class="da-link">Find out More</a>
					</div>
					<div class="da-slide">
						<h2>Track physical activity of your clients</h2>
						<p> Get accurate information about their workouts</p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<div class="da-slide">
						<h2>Connect with your clients</h2>
						<p> Provide counseling and support 24/7</p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<div class="da-slide">
						<h2>Create more personalized food plans</h2>
						<p> </p>
						<a href="about.html" class="da-link">Find out More</a>
					</div>
					<!--<div class="da-slide">
						<h2>Organize your clients</h2>
						<p> Monitor their Progress Real time</p>
						<a href="about.html" class="da-link">Find out More</a> -->
					</div>
					<nav class="da-arrows">
						<span class="da-arrows-prev"> </span>
						<span class="da-arrows-next"> </span>
					</nav>
			</div>
				<script type="text/javascript" src="js/jquery.cslider.js"></script>
				<script type="text/javascript">
					$(function() {
						$('#da-slider').cslider({
							autoplay	: true,
							bgincrement	: 450
						});
					
					});
				</script>
			 </div>
			</div>
				<!---//End-da-slider----->
			<!----//End-banner---->
			<!----start-content--->
			<div class="content">
				<div class="wrap">
					<!--- start-top-grids---->
					<div class="top-grids">
						<div class="top-grid">
							<div class="product-pic frist-product-pic">
								<img src="images/watch-img.png" title="watch" />
							</div>
							<span><label>1</label></span>
							<div class="border"> </div>
							<a href="#"> Provide your patients with a fitbit device and track their physical activity</a>
						</div>
						<div class="top-grid">
							<div class="product-pic">
								<img src="images/shoe-img.png" title="shoe" />
							</div>
							<span><label>2</label></span>
							<div class="border hide"> </div>
							<a href="#">Create a weekly food plan </a>
						</div>
						<div class="top-grid hide">
							<div class="product-pic">
								<img src="images/lap-img.png" title="laptop" />
							</div>
							<span><label>3</label></span>
							<a href="#">View results real time</a>
						</div>
						<div class="clear"> </div>
					</div>
					</div>

				<div class="footer-grids">
					<div class="wrap">
						<div class="footer-grid">
							<h3>Quick Links</h3>
							<ul>
								<li><a href="#">Home</a></li>
								<li><a href="#">About Features</a></li>
								<li><a href="#">Login</a></li>
								<li><a href="#">Sign Up</a></li>
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
							<!--<p class="copy-right">Template by <a href="#">W3layouts</a></p>-->
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


