<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="user.User"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="membermanager" class="user.UserDAO"/>

<%
	String id =  (String)session.getAttribute("userID");
	User us = membermanager.getuser(id);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="join.css">
<title>회원가입 수정</title>
<script type="text/javascript">

</script>
</head>
<body>
<% 
try{
%>
	<div id="header">
		<h1>
			<a href="Gapyeong.jsp">Oronamin C </a>
		</h1>
	</div>
	<div id="container">
		<div id="content">
			<div class="join_content">
				<div id="join_form">
					<form id="join_Form" name="form"  action="modifyPro.jsp"
						method="post">
						<fieldset class="join_from">
							<legend class="blind">회원가입 수정</legend>
							<div id="row_group">
								<div id="idDiv">
									<input type="text" size="15" name="userID" id="userID"
										placeholder="ID" class="join_row" onblur="checkID(this)" readonly value="<%=us.getUserID()%>"><br>
									<span id="id_chk" style="color: red; font-size: 14px"></span>
								</div>
								<div id="pwDiv">
									<input type="password" size="15" name="userPassword" id="pw1"
										placeholder="Password" minlength="4" maxlength="15"
										class="join_row" onblur="checkPw(this)"><br> <span
										id="pw" style="color: red; font-size: 14px"></span>
								</div>
								<div id="PwDiv">
									<input type="password" size="15" name="userPassword" id="pw2"
										placeholder="password(재확인)" minlength="4" maxlength="15"
										class="join_row" onblur="checkPw1(this)"> <span
										id="Pw" style="color: red; font-size: 14px"></span> <br>
								</div>
							</div>
							<div id="row_group">
								<div id="NameDiv">
									<input type="text" name="userName" id="userName"
										placeholder="이름" class="join_row" onblur="checkName(this)"
										value="<%=us.getUserName()%>"><br>
									<span id="name" style="color: red; font-size: 14px"></span>
								</div>
								<div id="sexDiv" class="join_row join_sex">
									<span class="row_title blind"> 성별 </span> <span class="sex">
										<span class="jender">
										<%
										   if(us.getUserGender().equals("man")){ 
										%>
										<input type="radio" id="man"
											name="userGender" value="man" onclick="checkSex()" checked> <label
											id="manLb" for="man">남자 </label>
									</span> <span class="jender"> <input type="radio" id="woman"
											name="userGender" value="woman" onclick="checkSex()">
											<label id="womanLb" for="woman">여자 </label>
									</span>
									</span>
									<%
										   } else{
									%>
									<input type="radio" id="man"
											name="userGender" value="man" onclick="checkSex()" checked> <label
											id="manLb" for="man">남자 </label>
									 <span class="jender"> <input type="radio" id="woman"
											name="userGender" value="woman" onclick="checkSex()" checked>
											<label id="womanLb" for="woman">여자 </label>
									</span>
									<%
										   }
									%>
								</div>
								<div id="birthdayDiv" class="join_row join_birthday">
									<div class="join_birth">
										<div class="bir_title">
											<span>생일</span>
										</div>
										<div class="bir_yy">
											<span class="ps_box"> <input class="int"
												name="userBirth" id="yy"
												type="text" maxlength="4" placeholder="년(4자)" value="<%=us.getUserBirth()%>">
												<label id="yyLb" for="yy" class="lbl"></label>
											</span>
										</div>
										<span class="cell">|</span>
										<div class="bir_mm">
											<span class="ps_box"> <select name="userBirth" id="mm"
												title="월" class="sel" onChange="Cate_list1(this.value);">
													<option value="">월</option>
													<option value="1"<%=us.getUserBirth1().equals("1")?" selected":""%>>1</option>
													<option value="2"<%=us.getUserBirth1().equals("2")?" selected":""%>>2</option>
													<option value="3"<%=us.getUserBirth1().equals("3")?" selected":""%>>3</option>
													<option value="4"<%=us.getUserBirth1().equals("4")?" selected":""%>>4</option>
													<option value="5"<%=us.getUserBirth1().equals("5")?" selected":""%>>5</option>
													<option value="6"<%=us.getUserBirth1().equals("6")?" selected":""%>>6</option>
													<option value="7"<%=us.getUserBirth1().equals("7")?" selected":""%>>7</option>
													<option value="8"<%=us.getUserBirth1().equals("8")?" selected":""%>>8</option>
													<option value="9"<%=us.getUserBirth1().equals("9")?" selected":""%>>9</option>
													<option value="10"<%=us.getUserBirth1().equals("10")?" selected":""%>>10</option>
													<option value="11"<%=us.getUserBirth1().equals("11")?" selected":""%>>11</option>
													<option value="12"><%=us.getUserBirth1().equals("12")?" selected":""%>12</option>
											</select>
											</span>
										</div>
										<span class="cell">|</span>
										<div class=" bir_dd">
											<span class="ps_box"> <input type="text"
												name="userBirth" id="dd" maxlength="2"
												placeholder="일" class="int" value="<%=us.getUserBirth2()%>"> <label id="ddLb"
												for="dd" class="lbl"></label>
											</span>
										</div>
									</div>
								</div>
								<div class="join_row join_PhoneNum">
									<div class="join_Phone">
										<div class="bir_title1">
											<span>휴대폰</span>
										</div>
										<div class="bir_fP">
											<select name="userPhone">
												<option value="011"<%=us.getUserPhone().equals("011")?" selected":""%>>011</option>
												<option value="010"<%=us.getUserPhone().equals("010")?" selected":""%>>010</option>
												<option value="017"<%=us.getUserPhone().equals("017")?" selected":""%>>017</option>
												<option value="018"<%=us.getUserPhone().equals("018")?" selected":""%>>018</option>
												<option value="019"<%=us.getUserPhone().equals("019")?" selected":""%>>019</option>
											</select>
										</div>
										<span class="cell">-</span>
										<div class="bir_sP">
											<input type="text" name="userPhone" class="secondNum" value="<%=us.getUserPhone1()%>">
										</div>
										<span class="cell">-</span>
										<div class="bir_tP">
											<input type="text" name="userPhone" class="secondNum" value="<%=us.getUserPhone2()%>">
										</div>
									</div>
								</div>
							</div>
						</fieldset>
						<input type="submit" value="수정완료" class="Submit">
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
}catch(Exception e){}%>
</body>
</html>