<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="sdk.ideas.More"%>
<%@page import="sdk.ideas.HttpsClient"%>
<%@ page import="org.json.JSONObject"%>

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
<script src="js/validation.js"></script>
<script type="text/javascript">
	function jumpSignUpPage() {
		alert("The E-mail account is invalid, please sign up to continue. \n");
		location.replace("signup.jsp");
	}

	function jumpLoginPage() {
		alert("The password is incorrect !!\n");
		location.replace("login.jsp");
	}
</script>

</head>
<body>

	<%
	    request.setCharacterEncoding("UTF-8");

				final String strEmail = request.getParameter("inputEmail");
				final String strPassword = request.getParameter("inputPassword");
				
				/** More more = new More();

				More.MemberData memberData = new More.MemberData();
				int nCount = more.queryMember(request, strEmail, memberData);
				more = null;
				**/
				
				String httpsURL = "https://ser.kong.srm.pw/dashboard/token/client-id";
				
				JSONObject jobj = new JSONObject();
				jobj.put("email", strEmail);
				jobj.put("hashedPassword", strPassword);

				HttpsClient httpsClient = new HttpsClient();
				String strResult = httpsClient.sendPost(httpsURL, jobj.toString());
				
				JSONObject jObjLoginInput = new JSONObject(strResult);
				int nUserId = 0;
				if (null != jObjLoginInput && jObjLoginInput.has("userId")) {
					nUserId = jObjLoginInput.getInt("userId");
					
					
				}
				
				if (nUserId > 0)
				{
				    httpsURL = "https://ser.kong.srm.pw/dashboard/user";
				    String strURL = httpsURL + "?/user-id=" + nUserId;
				    
				    httpsClient = new HttpsClient();
				    String strQueryResult = httpsClient.sendGet(strURL);
				    
				    
				    
				    
				    
				    
				    

					More.webTracker(request, "User login success: " + nUserId, "Email: " + strEmail);
				}
				    
				
				
				

				boolean bAuthResult = false;
				String strToken = null;
				
				Integer groupLevel = new Integer(memberData.member_group);
				

				if (0 < nCount) {
					strToken = memberData.member_token;
					if (strPassword.trim().equals(memberData.member_password.trim())) {
						bAuthResult = true;
						session.setAttribute("Email", strEmail);
						session.setAttribute("Group Level", groupLevel);
						
					} else {
	%>
	<script type="text/javascript">
		setTimeout('jumpLoginPage()', 1);
	</script>
	<%
	    }
				} else {
	%>
	<script type="text/javascript">
		setTimeout('jumpSignUpPage()', 1);
	</script>
	<%
	    }

				/** Web Tracker **/
				More.webTracker(request, "load progress page", null);
	%>

	<div class="row">
		<div class="col-lg-12 title">
			<h2>Loading</h2>
			<p>Please Wait...</p>
			<img src="/assets/img/loading.gif" width="600px;">
		</div>
	</div>

	<%
	    if (bAuthResult == true) {
	%>
	<form action="home.jsp" method="post" name="FormHome" id="FormHome">
		<input name="<%=More.Common.MEMBER_EMAIL%>" type="hidden"
			value="<%=strEmail%>" />
	</form>
	<script>
		formSubmit('FormHome');
	</script>
	<%
	    }
	%>
</body>
</html>