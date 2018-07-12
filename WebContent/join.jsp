<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="join.css">
<title>회원가입</title>
</head>
<script type="text/javascript">
	function checkID(obj) {
		var id_chk = document.getElementById("id_chk");
		id_chk.innerHTML = "";
		if (obj.value == "") {
			id_chk.innerHTML = "*필수 정보입니다.";
		}
	}
	
	function checkPw(obj1) {
		var pw = document.getElementById("pw");
		pw.innerHTML = "";
		if (obj1.value == "") {
			pw.innerHTML = "*필수 정보입니다."

		}
	}

	function checkPw1(obj2) {
		var Pw = document.getElementById("Pw");
		Pw.innerHTML = "";
		if (obj2.value == "") {
			Pw.innerHTML = "*필수 정보입니다."
		}
	}
	function checkName(obj3) {
		var Name = document.getElementById("name");
		Name.innerHTML = "";
		if (obj3.value == "") {
			Name.innerHTML = "*필수 정보입니다."
		}
	}
	
</script>
<body>
	<div id="header">
		<h1>
			<a href="main.jsp">Oronamin C </a>
		</h1>
	</div>
	<div id="container">
		<div id="content">
			<div class="join_content">
				<div id="join_form">
					<form id="join_Form" name="form" action="joinAction.jsp"
						method="post">
						<fieldset class="join_from">
							<legend class="blind">회원가입</legend>
							<div id="row_group">
								<div id="idDiv">
									<input type="text" size="15" name="userID" id="userID"
										placeholder="ID" class="join_row" onblur="checkID(this)"><br>
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
										placeholder="이름" class="join_row" onblur="checkName(this)">
									<span id="name" style="color: red; font-size: 14px"></span>
								</div>
								<div id="sexDiv" class="join_row join_sex">
									<span class="row_title blind"> 성별 </span> <span class="sex">
										<span class="jender"> <input type="radio" id="man"
											name="userGender" value="man" onclick="checkSex()"> <label
											id="manLb" for="man">남자 </label>
									</span> <span class="jender"> <input type="radio" id="woman"
											name="userGender" value="woman" onclick="checkSex()">
											<label id="womanLb" for="woman">여자 </label>
									</span>
									</span>
								</div>
								<div id="birthdayDiv" class="join_row join_birthday">
									<div class="join_birth">
										<div class="bir_title">
											<span>생일</span>
										</div>
										<div class="bir_yy">
											<span class="ps_box"> <input class="int"
												name="userBirth" id="yy"
												type="text" maxlength="4" placeholder="년(4자)" value="">
												<label id="yyLb" for="yy" class="lbl"></label>
											</span>
										</div>
										<span class="cell">|</span>
										<div class="bir_mm">
											<span class="ps_box"> 
											<select name="userBirth1" id="mm"
												title="월" class="sel">
													<option value="">월</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
											</select>
											</span>
										</div>
										<span class="cell">|</span>
										<div class=" bir_dd">
											<span class="ps_box"> <input type="text"
												name="userBirth2" id="dd" maxlength="2"
												placeholder="일" class="int"> <label id="ddLb"
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
												<option value="011" selected>011</option>
												<option value="010">010</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
										</div>
										<span class="cell">-</span>
										<div class="bir_sP">
											<input type="text" name="userPhone1" class="secondNum">
										</div>
										<span class="cell">-</span>
										<div class="bir_tP">
											<input type="text" name="userPhone2" class="secondNum">
										</div>
									</div>
								</div>
							</div>
						</fieldset>
						<input type="submit" value="가입하기" class="Submit">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>