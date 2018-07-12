<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

     <%@ page import="user.UserDAO" %>

<%
String id =(String)session.getAttribute("userID");

UserDAO manager = new UserDAO();

//회원정보 수정 처리 메소드 호출 후 수정 상황값 반환

int check = manager.delete(id);

if (check == 1) {

	session.invalidate();//세션값 무효화

%>

<script type="text/javascript">

alert("탈퇴처리되셨습니다.");



location.href = "main.jsp";



</script>

<%

} else {

%>

<script type="text/javascript">

alert("탈퇴실패하였습니다.");

history.back();

</script>

<%

}

%>
