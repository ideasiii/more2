<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="sdk.ideas.More"%>
<%@page import="sdk.ideas.HttpsClient"%>
<%@ page import="org.json.JSONObject"%>

<%
String strOutput = "";
    request.setCharacterEncoding("UTF-8");

    final String strEmail = request.getParameter("inputEmail");

    String httpsURL = "https://ser.kong.srm.pw/dashboard/user/check";

    String strURL = httpsURL + "?email=" + strEmail;

    
    
    
    
    
    
    
    
    
    HttpsClient httpsClient = new HttpsClient();
    String strResult = httpsClient.sendGet(strURL);
strOutput += ("get host:" + strURL + "</br>");
		strOutput += ("result: " + strResult + "</br>");
		
		%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<%=strOutput%>
	
</body>
</html>