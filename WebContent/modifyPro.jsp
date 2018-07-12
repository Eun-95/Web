<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="user.User" />
	<jsp:setProperty property="*" name="user" />
	<%//null 값이 있는지 검사
			//디비객체생성 dbPro
			UserDAO dbPro = new UserDAO();
			//int check =수정메서드호출 update(user)
			int check = dbPro.update(user);
			//check==1 수정완료 main.jsp 이동
			//check==0 수정실패  뒤로이동
			if (check == 1) {
	%>
	<script type="text/javascript">
		alert("수정완료");
		location.href = "main.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("수정실패틀림");
		history.back();
	</script>
	<%
		}
		
	%>
</body>
</html>