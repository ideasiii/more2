<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sdk.ideas.Common"%>
<%@ page import="sdk.ideas.More"%>
<%@ page import="sdk.ideas.StringUtility"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="sdk.ideas.Logs"%>
<%
    final String strToken = request.getParameter(Common.USER_TOKEN);
    More more = new More();
    boolean bLogined = false;

    if (null != strToken && !strToken.trim().equals("null") && StringUtility.isValid(strToken))
    {
		bLogined = true;
    }

    final String strHostUrl = request.getRequestURL().toString();
    final String uri = request.getRequestURI();
    final String pageName = uri.substring(uri.lastIndexOf("/") + 1);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>MORE HOME</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="/assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="/assets/css/main_2.css" />
<link rel="stylesheet" href="/assets/css/theme.css" />
<link rel="stylesheet" href="/assets/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="/assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="/assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->

<!-- END PAGE LEVEL  STYLES -->

<!-- JavaScript -->




<style>

/* logo section */
.header-angle {
position: relative;
	left: 30px;
	right: 80px;

}

.header-angle-{
	border-style:solid;
	border-width:0px 5px 0px 0px;
	border-color: transparent;
}

.header-highlight-container {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	pointer-events: none;
	overflow: hidden;
	z-index: 2; . header-highlight { & : before {
        content : '';
	width: 445px;
	height: 670px;
	position: absolute;
	left: -160px;
	top: -402px;
	transform: rotate(60deg);
	pointer-events: none;
	background: -moz-linear-gradient(-45deg, rgba(255, 255, 255, 1) 0%,
		rgba(255, 255, 255, 1) 65%, rgba(255, 255, 255, 0) 100%);
	background: -webkit-linear-gradient(-45deg, rgba(255, 255, 255, 1) 0%,
		rgba(255, 255, 255, 1) 65%, rgba(255, 255, 255, 0) 100%);
	background: linear-gradient(120deg, rgba(255, 255, 255, 1) 0%,
		rgba(255, 255, 255, 1) 65%, rgba(255, 255, 255, 0) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff',
		endColorstr='#00ffffff', GradientType=1);
	transition: all 0.3s;
	border-left: 374px solid$ptc-gray;
	border-bottom: 217px solid transparent;
}

}
}
.logo {
	/*margin-left: 30%;*/
	padding: 7px;
	position: relative;
	z-index: 9;
}

.super-header {
	/* position: relative;*/
	z-index: 1;
	background-color: #428bca;
	padding: 0 1em;
	/* overflow: hidden;*/
	text-align: right; label { color : #fff;
	font-size: 0.9em;
	padding: 0.4em;
	line-height: 1.1;
}

}
.super-header .super-header-ul {
	text-align: right;
	margin-bottom: 0;
}

.super-header .super-header-li {
	color: #fff;
	display: inline-block; //
	vertical-align: middle;
	&:
	first-child
	{
	padding-right
	:
	1.7em;
}

}
.super-header .super-header-a {
	color: #fff;
	display: inline-block;
	font-size: 1.1em;
	font-style: normal;
	line-height: 1.1;
	padding: 0.4em 1.3em;
	position: relative;
	&:
	hover
	{
	background-color
	:
	transparent;
}

&
:before {
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#000000+0,000000+100&1+0,0+99 */
	content: '';
	background: -moz-linear-gradient(-45deg, rgba(61, 70, 71, 0.3) 0%,
		rgba(61, 70, 71, 0) 99%, rgba(61, 70, 71, 0) 100%);
	background: -webkit-linear-gradient(-45deg, rgba(61, 70, 71, 0.3) 0%,
		rgba(61, 70, 71, 0) 99%, rgba(61, 70, 71, 0) 100%);
	background: linear-gradient(135deg, rgba(61, 70, 71, 0.3) 0%,
		rgba(61, 70, 71, 0) 99%, rgba(61, 70, 71, 0) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3d4647',
		endColorstr='#003d4647', GradientType=1);
	display: block;
	position: absolute;
	width: 400px;
	height: 300px;
	transform: rotate(-30deg);
	top: 0;
	left: -140px;
	z-index: -1;
}

}
.menu {
	margin-bottom: 0;
	min-height: auto;
	border: 0px solid transparent;
}

.menu-header {
	float: none;
	width: 100%;
	padding-left: 150px;
	display: inline-block;
	position: relative;
	z-index: 1;
	vertical-align: baseline;
	margin-bottom: 0;
	margin-top: 4px;
}

.menu-header .menu-header-li {
	width: 25%;
	padding-top: 1rem;
	padding-bottom: 1rem;
	float: left;
	position: relative;
	display: inline-block;
}

.menu-header .menu-header-li .menu-header-a {
	color: white;
	text-transform: uppercase;
	text-decoration: none;
	display: inline-block;
	font-style: normal;
	line-height: 1.1em;
	font-size: 1em;
	letter-spacing: 0.05em;
	position: relative;
	margin-right: -1px;
}

.menu-header .menu-header-li .menu-header-a:hover, .menu-header .menu-header-li .menu-header-a:focus,
	.menu-header .menu-header-li .menu-header-a:active, .menu-header .menu-header-li .menu-header-a.active
	{
	color: #428bca;
}

.gradient-blue{
	background-color: white;
	backgroung-image:
	linear-gradient(
	to right,
	white,
	#428bca 30%
	);
}

/* header dropdown */
.dropdown .admin_section {
	width: 55px;
	height: 35px;
	text-align: center;
	vertical-align: middle;
	padding-top: 5px;
	border: 1px solid transparent;
	border-radius: 4px;
}

/* footer */
.footer {
	width: 100%;
	background: #E0E0E0;
}

.footer .link_area {
	background: #F0F0F0;
	text-align: right;
	padding: 30px 0;
}

.footer .link_area .link_group {
	display: inline-block;
	vertical-align: top;
	margin: 10px 25px;
}

.footer .link_area .link_group .link {
	text-align: left;
	line-height: 1em;
}

.footer .link_area .link_group .link a {
	color: #000;
}

.footer .link_area .link_group .link a:hover {
	text-decoration: underline;
}

.footer .copyright_area {
	text-align: right;
	margin-right: 20px;
	height: 40px;
	line-height: 60px;
	color: #9D9D9D;
}
/* end footer */
</style>
</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<!-- HEADER SECTION -->
		<div id="top">

			<nav class="navbar navbar-inverse navbar-fixed-top"
				style="background-color: rgba(86, 99, 100, 0.89);">

				<!-- LOGO SECTION -->
				<header>
					<div class="header-angle navbar-brand">
						<a href="group_management.jsp" class="navbar-brand"> <img
							class="logo" height="80" src="/assets/img/more.png" alt="" />
						</a>
					</div>
					<!-- END LOGO SECTION -->

					<!-- LOGIN SECTION  -->
					<div class="super-header gradient-blue">
						<ul class="super-header-ul">
							<li class="super-header-li"><a class="super-header-a">Login</a>
							</li>
							<li class="super-header-li"><a class="super-header-a">Sign
									Up</a></li>

						</ul>
					</div>
					<!-- END LOGIN SECTION  -->

					<!-- MENU SECTION  -->
					<div class="menu">
						<div class="row">
							<div class="col-sm-9" style="text-align: center;">
								<ul id="menu-header" class="menu-header">
									<li class="menu-header-li"><a href=""
										class="menu-header-a dropdown-toggle" role="button"
										aria-haspopup="1"> PLATFORM </a></li>
									<li class="menu-header-li dropdown"><a href=""
										class="menu-header-a dropdown-toggle" role="button"
										aria-haspopup="1"> ECOSYSTEM </a></li>
									<li class="menu-header-li dropdown"><a href=""
										class="menu-header-a dropdown-toggle" role="button"
										aria-haspopup="1"> RESOURCES </a></li>
									<li class="menu-header-li dropdown"><a href=""
										class="menu-header-a dropdown-toggle" role="button"
										aria-haspopup="1"> DEVELOPER </a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- END MENU SECTION  -->
				</header>





			</nav>
		</div>
		<!-- END HEADER SECTION -->

		<!-- MENU SECTION -->

		<!--END MENU SECTION -->

		<!--PAGE CONTENT -->

		<div id="content">

			<div class="inner" style="min-height: 700px; margin-top: 30px;">
				<div class="row">
					<div class="col-lg-12">
						<h1>Admin Dashboard</h1>
					</div>
				</div>
				<hr />






			</div>
		</div>
		<!--END PAGE CONTENT -->



	</div>
	<!--END MAIN WRAPPER -->

	<!--FOOTER -->
	<footer class="footer">
		<div class="link_area">
			<dl class="link_group">
				<dd class="link">
					<a href="">Document</a>
				</dd>
			</dl>
			<dl class="link_group">
				<dd class="link">
					<a href="">Privacy Policy</a>
				</dd>
			</dl>
			<dl class="link_group">
				<dd class="link">
					<a href="">Contact Us</a>
				</dd>
			</dl>
			<div class="copyright_area">Copyright ©</div>
		</div>
	</footer>
	<!--END FOOTER -->

	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/flot/jquery.flot.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.stack.js"></script>
	<script src="/assets/js/for_index.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>