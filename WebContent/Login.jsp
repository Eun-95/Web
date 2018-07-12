<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="login.css">
<title>로그인</title>
</head>
<body>
<%  
request.setCharacterEncoding("UTF-8");
/*인코딩 한글 처리*/
%>
	<div class="container">
		<h1 class="login">Oronamin C </h1>
		</div>
		<form class="form"  method="post" name="section" action="LoginAction.jsp">
		<div class="login1">
		<b class="text">사용자명</b><br>
			<input type="text" size="15" name="userID" id="userID" placeholder="ID" maxlength="20" class="input"><br>
			<b class="text">비밀번호</b><br> 
			<input type="password" size="15" name="userPassword" id="userPassword" placeholder="Password" minlength="4" maxlength="15" class="input">
			<input type="submit" value="Login" class="button">
			<hr class="hr">
			</div>
			</form>
			<form  action="join.jsp">
			<div class="login1">
			<input type="submit" value="회원가입" class="input">
			</div>
	</form>
</body>
</html>