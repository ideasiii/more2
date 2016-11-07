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

			if (null != strToken && !strToken.trim().equals("null") && StringUtility.isValid(strToken)) {
				bLogined = true;
			}

			final String strHostUrl = request.getRequestURL().toString();

			String strAccountV = "";

			ArrayList<String> listEmailAccount = new ArrayList<String>();
			int nACount = more.queryMemberAccountList(listEmailAccount);
			
		for(int i = 0; i < listEmailAccount.size(); ++i)
		{
		    strAccountV = strAccountV +  listEmailAccount.get(i);
			if (i != (listEmailAccount.size()-1)) {
				strAccountV += ',';
			}
		}

		/** Web Tracker **/
		More.webTracker(request, "load page", null);
		
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>SignUp | MORE</title>

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
<link
	href="/assets/plugins/jquery-steps-master/demo/css/jquery.steps2.css"
	rel="stylesheet" />
<!-- END PAGE LEVEL STYLES -->

<!-- JavaScript -->
<script type="text/javascript">
	function showBtnV(formName) {
		var form = document.getElementById(formName);
		var formname = form.name;

		if (formname == "formSignUp") {
			document.getElementById("btnA").style.display = "none";
			document.getElementById("btnV").style.display = "block";
		}
	}
</script>
<script type="text/javascript">
	function Trim(x) {
		return x.replace(/^\s+|\s+$/gm, '');
	}
</script>
<script>
	function checkAccountListData(formName) {

		var form = document.getElementById(formName);
		var formname = form.name;
		var errMsg = '';
		var accountV = form.accountList.value;
		var spl = accountV.split(",");
		 reg = /^[^\s]+@[^\s]+\.[^\s]{2,3}$/;
		

		if (formname == "formSignUp") {

			if (Trim(form.inputEmail.value) == '') {
				errMsg += "Please enter a valid E-mail !!\n";
				
			} else {
				
				if (!reg.test(Trim(form.inputEmail.value))) {
					errMsg += "Wrong E-mail format !!\n";
				} 
			}
			
			
			for ( var key in spl) {
				// alert(spl[key]);
				if (Trim(form.inputEmail.value) == spl[key]) {
					errMsg += "The E-mail account '" + spl[key]
							+ "' has been used, please change it !!";
				}
			}
		} else {
			
		}

		if (errMsg == '') {

			if (formname == "formSignUp") {
				document.getElementById('btnA').style.display = "block";
				document.getElementById('btnV').style.display = "none";
			}

			return true;
		}
		alert(errMsg);
		return false;
	}
</script>

<style>

/* logo section */
.header-angle {
	position: relative;
	left: 30px;
	right: 80px;
}

.logo {
	/*margin-left: 30%;*/
	padding: 7px;
	position: relative;
	z-index: 9;
}
/* end logo section */

/* login admin section */
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
	/*	padding-right: 10px;*/
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
	text-decoration: none;
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
/* end login admin section */

/* menu section */
.menu {
	margin-bottom: 0;
	min-height: auto;
	border: 0px solid transparent;
}

.menu-header {
	float: none;
	width: 100%;
	padding-left: 100px;
	display: inline-block;
	position: relative;
	z-index: 1;
	vertical-align: baseline;
	margin-bottom: -4px;
	/*	padding-top: 4px;*/
	height: auto;
	line-height: 2;
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
	font-size: 1em;
	letter-spacing: 0.05em;
	position: relative;
	/*	margin-right: -1px;*/
	width: 100%;
}

.menu-header .menu-header-li:hover .dropdown-menu-container {
	color: #46b8da;
	display: block;
}

.menu-header .menu-header-li .menu-header-a:hover {
	color: #9fd256; /*#46b8da;*/
	display: block;
	font-weight: bold;
	background-color: rgba(86, 99, 100, 1);
	background-image: radial-gradient(#000, rgba(86, 99, 100, 1) 70%);
	display: block;
}

.gradient-blue {
	background-color: white;
	background-image: linear-gradient(to left, #428bca 45%, white 90%);
}

.gradient-gray {
	background-color: transparent;
	background-image: linear-gradient(to left, rgba(86, 99, 100, 0.89) 70%,
		white 90%);
}
/* end menu section */

/* menu dropdown */
.dropdown-menu-container {
	position: absolute;
	display: none; /*test*/
	/*	visibility: hidden;*/
	/*	opacity: 0;*/
	/*	pointer-events: none;*/
	border-radius: 0;
	background-color: rgba(86, 99, 100, 0.85);
	margin-top: -1px !important;
	width: 100%;
	border-left: none;
	border-right: none;
	border-bottom: none;
	min-width: initial;
	top: 100%;
	left: 0;
	z-index: 1000;
	/*	float: left; */
	padding: 0;
	margin: 2px 0 0;
	list-style: none;
	font-size: 14px;
	text-align: center;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	background-clip: padding-box;
}

.dropdown-menu-li {
	padding: 12px 0px; //
	text-align: center;
	white-space: normal;
	clear: both;
	position: relative;
	margin-right: -1px;
	cursor: pointer;
}

.dropdown-menu-li a {
	text-decoration: none;
	text-transform: uppercase;
	color: #fff;
	font-weight: normal;
	line-height: 1.42857;
	font-family: "texgyreadventor", sans-serif;
	font-style: normal;
	font-size: 1em;
	/*letter-spacing: 0.05em;*/
}

.dropdown-menu-li:hover {
	background-color: rgba(86, 99, 100, 0);
	background-image: radial-gradient(white, rgba(86, 99, 100, 0) 65%);
}

.dropdown-menu-li:hover a {
	color: #357ebd;
	font-weight: bold;
	text-decoration: none;
}
/* end menu dropdown */

/* text background */
.container {
	margin-right: auto;
	margin-left: auto;
	padding-left: 5px;
	padding-right: 5px;
}

.silk-white {
	background-color: rgba(255, 255, 255, 0.50);
	background-image: radial-gradient(circle at top right, white 10%, #546263 90%);
}

.silk-white-green {
	background-color: rgba(255, 255, 255, 0.50);
	background-image: radial-gradient(circle at top right, white 10%, #9fd256 90%);
}

.silk-grey {
	background-color: rgba(255, 255, 255, 0.50);
	background-image: radial-gradient(circle at top left, #546263 10%, white 90%);
}

.container-text-r {
	padding: 6rem 8rem;
	/*	padding-left:10rem;*/
	text-align: right;
}

.container-text-c {
	padding: 6rem 8rem;
	/*	padding-left:10rem;*/
	text-align: center;
}

.container-text-l {
	padding: 6rem 8rem;
	/*	padding-left:10rem;*/
	text-align: left;
}

.bg-grey {
	background: #546263;
}

.bg-white {
	background: #fff;
}

.bg-blue {
	background: #357ebd;
}

.bg-green {
	background: #9fd256;
}

.bg-orange {
	background: #F08800;
}

.bg-purple {
	background: #a264e7;
}

.vline-right-orange {
	border-right: 10px solid #F08800;
	padding-right: 10px;
}

.vline-right-green {
	border-right: 10px solid #9fd256;
	padding-right: 10px;
}

.vline-right-blue {
	border-right: 10px solid #428bca;
	padding-right: 10px;
}

.photo {
	border-radius: 5px;
	visibility: hidden;
	z-index: 1005;
}

@media ( min-width : 992px) {
	.photoframe {
		position: absolute;
		top: 110px;
		right: 65%;
		z-index: 1000;
		background-color: #F08800;
		text-align: center;
		border: 5px solid #F08800;
	}
	.photo {
		border-radius: 5px;
		visibility: visible;
		z-index: 1005;
	}
}

/* end text background */

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
						<a href="home.jsp" class="navbar-brand"> <img class="logo"
							height="80" src="/assets/img/more_logo_white_board_sm.png" alt="" />
						</a>
					</div>
					<!-- END LOGO SECTION -->

					<!-- LOGIN SECTION  -->
					<div class="super-header gradient-blue">
						<ul class="super-header-ul">
							<%
							    if (bLogined) {
							%>
							<li class="super-header-li"><a class="super-header-a"
								href="login.jsp">Logout</a></li>
							<li class="super-header-li"><a class="super-header-a"
								href="/more_manager/manager/mainpage.jsp"><i
									class="icon-gear fa-inverse"></i></a></li>
							<%
							    } else {
							%>
							<li class="super-header-li"><a class="super-header-a"
								href="login.jsp">Login</a></li>
							<li class="super-header-li"><a class="super-header-a"
								href="signup.jsp">Sign Up</a></li>
							<li class="super-header-li"><a class="super-header-a"
								href="/more_manager/manager/mainpage.jsp"><i
									class="icon-gear fa-inverse"></i></a></li>
							<%
							    }
							%>
						</ul>
					</div>
					<!-- END LOGIN SECTION  -->

					<!-- MENU SECTION  -->
					<div class="menu gradient-gray">
						<div class="row">
							<div class="col-sm-9" style="text-align: center; float: right;">
								<ul class="menu-header">
									<li class="menu-header-li"><a href=""
										class="menu-header-a"> PLATFORM </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">MORE MDM</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">MORE API</a></li>
										</ul></li>

									<li class="menu-header-li"><a href=""
										class="menu-header-a"> DASHBOARD </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">QWERYU</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">ANALYSIS</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">ASFDGFHVGH</a></li>
										</ul></li>

									<li class="menu-header-li"><a href=""
										class="menu-header-a"> RESOURCES </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">MORE SDK</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">ASFGHJMK</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">ASFDGFHVGH</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">QWERYU</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">ASFGHJMK</a></li>
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">ASFDGFHVGH</a></li>
										</ul></li>

									<li class="menu-header-li"><a href=""
										class="menu-header-a"> DEVELOPER </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li"><a class="dropdown-menu-a"
												href="">QWERYU</a></li>
										</ul></li>

								</ul>
							</div>
						</div>
					</div>
					<!-- END MENU SECTION  -->
				</header>
			</nav>
		</div>
		<!-- END HEADER SECTION -->


		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner" style="min-height: 700px; padding: 0;">
				<div id="intro" class="silk-grey"
					style="padding: 50px 0px; min-height: 700px;">

					<div class="container">
						<div class="row container-text-c" style="padding: 1rem 8rem;">

							<div class="text-center" style="padding: 2rem 0;">
								<h2 style="font-weight: bold;">Sign Up For MORE Account</h2>
							</div>

							<form role="form" name="formSignUp" id="formSignUp">
								<input name="accountList" id="accountList"
									value="<%=strAccountV%>" type="hidden">

								<div id="wizard">
									<h2>Agreement</h2>
									<section style="overflow-y: scroll;">
										<div style="padding-left: 15px; text-align: left;">
											<p style="text-align: justify; color: gray;">
												<b>Notification and Letter of Consent for Collection,
													Processing and Use of Personal Information<br /> (Version:
													P-X-X)
												</b> <br /> <br /> MAccording to the R.O.C. Personal
												Information Protection Act and the internal
												policy/regulations of Institute for Information Industry
												(hereinafter referred to as “III”), III is obligated to make
												the following notification known to you before you provide
												personal information to III. Please read it carefully. <br />
												<br />1. Purposes and Categories of Personal Information to
												be Collected For the purpose of carrying out III’s business,
												activity or project, the purpose of providing service,
												internal administrative management or reporting to the
												competent authority, the purpose complying with the
												Endowment, or the purpose of sending III’s or industry
												relevant information, III needs you to provide these
												categories of personal information: name, contact
												information (such as phone number, title, e-mail address,
												residential or office address), ID card number, or other
												information which may be used to identify you directly or
												indirectly. <br /> <br /> Note: You may choose, at any
												time in the future, not to receive any promotional
												information from III by clicking the link provided in the
												promotional message. <br /> <br /> 2. Time Period, Area,
												Target and Way of the Use of Personal Information Unless the
												purposes of use relating to international businesses or
												activities, your personal information will be used solely by
												III in a reasonable way in the territory of the Republic of
												China to the extent necessary to implement the purposes of
												collection until the purposes of collection prescribed above
												is fulfilled. <br /> <br /> 3. Your Rights with regard to
												Personal Information Provided You may exercise the following
												rights in pursuant to the rules of the activities/project or
												by submitting your inquiry/request on our website
												(http://www.iii.org.tw/) at “Application for Exercising
												Rights with Regard to Personal Information” page: <br />
												(1) any inquiry and request for a review of the personal
												information;<br /> (2) any request to make duplications of
												the personal information;<br /> (3) any request to
												supplement or correct the personal information;<br /> (4)
												any request to discontinue collection, processing or use of
												the personal information; <br /> (5) any request to delete
												the personal information.<br /> <br /> 4. The Influence on
												Your Rights and Interests while You Choose not to Provide
												Your Personal Information<br /> If you provide incorrect
												personal information or choose not to provide your personal
												information to III, III may not be able to provide you with
												services relating to the purposes prescribed above. <br />
												<br /> 5. You understand that this document complies with
												the R.O.C. Personal Information Protection Act and relating
												regulations, and you agree that III keeps this document for
												further checking. <br /> <br />

											</p>

											<div class="checkbox">
												<input type="checkbox" id="ch1" /> <label
													class="text-danger" for="ch1">I have read and
													understood the above notification.</label>
											</div>
											<div class="checkbox">
												<input type="checkbox" id="ch2" /> <label
													class="text-danger" for="ch2">I agreed that III may
													collect, process and use my personal information for the
													purposes of collection prescribed above.</label>
											</div>

										</div>
									</section>

									<h2>Personal</h2>
									<section style="width: 100%; padding: 25px 10rem;">

										<div class="form-group">
											<label>Name</label> <input type="text" name="inputName"
												id="inputName" class="form-control" />
											<p class="help-block">Example block-level help text here.</p>
										</div>
										<div class="form-group">
											<label>Organization</label> <input type="text"
												name="inputCompany" class="form-control" />
											<p class="help-block">Example block-level help text here.</p>
										</div>
										<div class="form-group">
											<label>Phone</label> <input type="text" name="inputPhone"
												class="form-control" />
											<p class="help-block">Example block-level help text here.</p>
										</div>
									</section>

									<h2>Login</h2>
									<section style="width: 100%; padding: 25px 8rem;">

										<div class="form-group">
											<label style="margin-left: 5.5rem;">E-mail Account</label>
											<button id="btnV" type="button"
												class="btn btn-xs btn-grad btn-default"
												style="float: right;"
												onclick="checkAccountListData('formSignUp')">Verification</button>
											<button id="btnA" type="button"
												class="btn btn-xs btn-success"
												style="display: none; float: right;">Available</button>

											<input type="text" name="inputEmail" class="form-control"
												onchange="showBtnV('formSignUp')" />



											<p class="help-block" style="color: #b94a48;">Notification:
												E-mail account cannot be changed.</p>
										</div>
										<div class="form-group">
											<label>Password</label> <input type="text"
												name="inputPassword" class="form-control" />
											<p class="help-block">(Must be less than 20 letters in
												alphanumeric format.)</p>
										</div>
										<div class="form-group">
											<label>Retype Password</label> <input type="text"
												name="inputPassword2" class="form-control" />
											<p class="help-block"></p>
										</div>

									</section>
								</div>
							</form>



						</div>
					</div>

				</div>
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
	<script
		src="/assets/plugins/jquery-steps-master/lib/jquery.cookie-1.3.1.js"></script>
	<script
		src="/assets/plugins/jquery-steps-master/build/jquery.steps2.js"></script>
	<script src="/assets/js/WizardInit.js"></script>
	<SCRIPT type="text/javascript">
		showBtnV();
	</SCRIPT>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>

<%
    more = null;
%>