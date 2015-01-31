<%--@elvariable id="userInfo" type="com.fitbit.api.common.model.user.UserInfo"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
		<title>Nutriscope | Home </title>
		<link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="images/fav-icon.png" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		
                <!---strat-slider---->
                <script type="text/javascript" src="js/jquery.min.js"></script>
                <link rel="stylesheet" type="text/css" href="css/slider-style.css" />
            	<script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
		<!---//strat-slider---->
		<!---start-login-script--->
		<script src="js/login.js"></script>
		<!---//End-login-script- - ->
		<!-----768px-menu----->
		<link type="text/css" rel="stylesheet" href="css/jquery.mmenu.all.css" />
		<script type="text/javascript" src="js/jquery.mmenu.js"></script>
			<script type="text/javascript">
				//	The menu on the left
				$(function() {
					$('nav#menu-left').mmenu();
				});
		</script>
    </head>
    <div class="wrap">
	<div class="header-left">
            <div class="logo">
                <a href="Intro.jsp">Nutriscope <font color="#5EBFFF"> Client Profile</font></a>
            </div>
      </div>
   </div>
    <div class="header-right">
                                     
		<div class="top-nav" >   
			<ul>
                             <li> 
                                <form id="loginForm" action="LogOut" method="POST" >
                                    <input type="submit" id="login" value="LogOut"  style="width:80px; height:40px; float:right; position:relative; top:-60px; right:-300px" />
                                 </form>
                             </li>  
                                               
                        </ul>
		 </div>    
    </div>     
    <div class="clear"> </div>
<body>
<table >
    <tr>
        <td>Full Name:</td>
        <td>${userInfo.fullName}</td>
    </tr>
    <tr>
        <td>Display Name:</td>
        <td>${userInfo.displayName}</td>
    </tr>
    <tr>
        <td>Nickname:</td>
        <td>${userInfo.nickname}</td>
    </tr>
    <tr>
        <td>Gender:</td>
        <td>${userInfo.gender}</td>
    </tr>
    <tr>
        <td>Date of Birth:</td>
        <td>${userInfo.dateOfBirth}</td>
    </tr>
    <tr>
        <td>Height:</td>
        <td>${userInfo.height}</td>
    </tr>
    <tr>
        <td>Weight:</td>
        <td>${userInfo.weight}</td>
    </tr>
    <tr>
        <td>Stride Lenght Walking:</td>
        <td>${userInfo.strideLengthWalking}</td>
    </tr>
    <tr>
        <td>Stride Lenght Running:</td>
        <td>${userInfo.strideLengthRunning}</td>
    </tr>
    <tr>
        <td>City:</td>
        <td>${userInfo.city}</td>
    </tr>
    <tr>
        <td>State:</td>
        <td>${userInfo.state}</td>
    </tr>
    <tr>
        <td>Country:</td>
        <td>${userInfo.country}</td>
    </tr>
    <tr>
        <td>Timezone:</td>
        <td>${userInfo.timezone}</td>
    </tr>
    <tr>
        <td>Offset From UTC (Millis):</td>
        <td>${userInfo.offsetFromUTCMillis}</td>
    </tr>
</table>
</body>
                        <div class="footer-grids">
					<div class="wrap">
						<div class="footer-grid">
							<h3>Quick Links</h3>
							<ul>
								<li><a href="#">Home</a></li>
								<li><a href="#">About </a></li>
								
								
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
								<input type="text" class="text" value="Your Name" onfocus="this.value = '';" onblur="if (this.value =='') {this.value = 'Your Name';}">
								<input type="text" class="text" value="Your Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Email';}">
								<input type="submit" value="subscribe" />
							</form>
						</div>
						<div class="clear"> </div>
					</div>
				</div>
				<!--//End-bottom-footer-grids--->
                 <div>   <br>           
                    <div class="clear"> </div>
                  </div>    
</html>