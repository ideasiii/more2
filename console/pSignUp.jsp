<%@ page contentType="text/html; charset=utf-8" language="java" session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="sdk.ideas.More"%>
<%@ page import="sdk.ideas.Common"%>

<%
	request.setCharacterEncoding("UTF-8");

	final String strEmail = request.getParameter(Common.MEMBER_EMAIL);
	final String strPassword = request.getParameter(Common.MEMBER_PASSWORD);
	final String strName = request.getParameter(Common.MEMBER_NAME);
	final String strCompany = request.getParameter(Common.MEMBER_COMPANY);
	final String strPhone = request.getParameter(Common.MEMBER_PHONE);
	
	More more = new More();
	String strToken = more.generateToken(strEmail, false);
	int nResult = more.memberAdd(strEmail, strPassword, strName, strCompany, strPhone, strToken);

	String strResult = "註冊失敗<br>系統忙線中,請稍候再試";

	switch (nResult) {
		case More.MORE_ERR_SUCCESS :
			strResult = "註冊成功,請回到首頁執行登入";
			//more.SendingEmail("louis.ju.tw@gmail.com", "MORE member add success");
			break;
		case More.MORE_ERR_MEMBER_EXIST :
			strResult = "帳號 " + strEmail + " 已存在,無法新增註冊!!";
			break;
	}

	more = null;
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>