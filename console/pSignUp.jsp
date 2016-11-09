<%@ page contentType="text/html; charset=utf-8" language="java" session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="sdk.ideas.More"%>
<%@ page import="sdk.ideas.Common"%>

<%
	request.setCharacterEncoding("UTF-8");

	final String strEmail = request.getParameter("inputEmail");
	final String strPassword = request.getParameter("inputPassword");
	final String strName = request.getParameter("inputName");
	final String strCompany = request.getParameter("inputCompany");
	final String strPhone = request.getParameter("inputPhone");
	
	More more = new More();
	String strToken = more.generateToken(strEmail, false);
	int nResult = more.memberAdd(request, strEmail, strPassword, strName, strCompany, strPhone, strToken);

	more = null;
	
	/** Web Tracker **/
	More.webTracker(request, "load progress page", null);
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MORE PROGRESS</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="/assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="/assets/css/countdown.css" />

<!-- Javascript -->
<script>
function formSubmit(formName) {
	var form = document.getElementById(formName);
	form.submit();
}
</script>
</head>

<body>

	<div class="row">
		<div class="col-lg-12 title">
			<h2>Loading</h2>
			<p>Please Wait...</p>
			<img src="/assets/img/loading.gif" width="600px;">
		</div>
	</div>

	<form action="home.jsp" method="post"
		name="FormHome" id="FormHome">
		<input name="<%=Common.MEMBER_EMAIL%>" type="hidden"
			value="<%=strEmail%>" />
	</form>
	<%
	if (nResult == More.MORE_ERR_SUCCESS) {
	%>
	<script>
		formSubmit('FormHome');
	</script>
	<%
	}
	%>
</body>
</html>