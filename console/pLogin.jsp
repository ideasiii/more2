<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="sdk.ideas.More"%>
<%@ page import="sdk.ideas.Common"%>
<%@ page import="sdk.ideas.Logs"%>


<%
    request.setCharacterEncoding("UTF-8");

final String strEmail = request.getParameter("inputEmail");
final String strPassword = request.getParameter("inputPassword");

			More more = new More();
			
			More.MemberData memberData = new More.MemberData();
			int nCount = more.queryMember(request, strEmail, memberData);
			more = null;
			
			boolean bAuthResult = false;
			String strToken = null;
			
			if (0 < nCount) {
				strToken = memberData.member_token;
				Logs.showTrace("Login get token:" + strToken);
				if (strPassword.trim().equals(memberData.member_password.trim())) {
					bAuthResult = true;
					Logs.showTrace("login success:" + memberData.member_email + "/" + memberData.member_password);
				}
				
				session.setAttribute("Email",strEmail);
			}
			else{
			    
			    
			}

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

	<form action="home.jsp" method="post" name="FormHome" id="FormHome">
		<input name="<%=Common.MEMBER_EMAIL%>" type="hidden"
			value="<%=strEmail%>" />
	</form>
	<%
	    if (bAuthResult = true) {
	%>
	<script>
		formSubmit('FormHome');
	</script>
	<%
	    }
	%>
</body>
</html>