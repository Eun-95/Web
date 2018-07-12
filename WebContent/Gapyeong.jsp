<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>가평</title>
<style>
* {  /*전체*/
	margin: 0;
	padding: 0;
}

body {  /*body부분 백그라운 색깔, 글자*/
	background: #fff;
	font-family: 'Courier New', Courier, monospace;
}

a {
	text-decoration: none;
	
}

nav a:link, a:visited { /*방문했으면 화이트로 변함 설정*/
	color: white;
}

nav a:active {
	color: yellow;
}

h1 {
	font-size: 2.0em;
}

h2 {
	font-size: 1.3em;
}

p {
	font-size: 1.3em;
	line-height: 2.5;
}

.ul {
	font-size: 10px;
}

.menubar {
	padding: 2% 2%;
	background-color: black;
	list-style-type: none;
	position: relative;
}

nav li {
	display: inline-block;
	margin: 5px 15px;
	padding: 2% 3%;
}

nav ul li {
	line-height: 10px;
	font-size: 1.4em;
}

.menubar li ul {
	background: black;
	display: none; /* 평상시에는 서브메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 200px;
	z-index: 200;
}

.menubar li:hover ul {
	    display: grid; /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}

nav a:hover {
	color: yellow;
}

section {
	position: relative;
	padding: 15px 5% 10px 5%;
}

.page {
	position: absolute;
	top: 20px;
}

.page h1 {
	margin-bottom: 30px;
}

footer {
	background-color: black;
	text-align: center;
	height: 100px;
	position: relative;
	font-size: 2.0em;
	font-family: 'Oleo Script', cursive
}

footer p {
	color: white;
	line-height: 100px;
}

.sub-titles {
	color: #0094ff;
	font-weight: 600;
	font-size: 25px;
}

.road {
	padding: 20px;
}

.road>b {
	padding: 10px;
	font-size: 20px;
}
.login
{
display: inline-block;
	margin: 5px 15px;
}
.silder
{
}

/*pc화면일때*/
@media screen and (min-width:992px) {
	#container {
		width: 90%;
		margin: 0 auto;
		border: 1px solid gray;
	}
	header {
		width: 100%;
		height: 500px;
		margin: 0;
	}
	#slidebox{
	position:relative;
		overflow:hidden;
		white-space:nowrap;
		border:1px solid #000;
	}
	#slidebox ul#slider {
		list-style:none;
		margin:0;
		padding:0;
	}
	#slidebox ul li {
		position:absolute;
		width:300px;
		height:300px;
	}
	#slidebox ul li img {
		width:300px;
		height:200px;
	}
	#intro, #map, #choice {
		-moz-box-sizing: border-box;
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
		clear: both;
		position: relative;
		width: 100%;
		height: 420px;
		padding: 15px 2% 10px 5%;
	}
	.content {
		margin: 80px auto 10px;
		width: 90%;
		padding: 20px;
	}
	.photo {
		width: 42%;
		display: block;
		float: right;
	}
	.photo>img {
		width: 100%;
		max-width: 320px;
		height: auto;
		margin-bottom: 30px;
	}
	.text {
		width: 42%;
	}
	#intro .photo, #map .photo {
		float: left;
		margin-right: 5%;
	}
	#intro .text, #map .text {
		float: left;
	}
	#choice .photo {
		float: right;
		margin-right: 5%;
	}
	#choice .text {
		float: left;
	}
	footer {
		clear: both;
	}
}
</style>
</head>
<body>
<% 
    String userID=null;
    if  (session.getAttribute("userID")!=null){ //세션이 존재한다면
        userID = (String) session.getAttribute("userID"); //그 값을 userID에 저장한다.
    }
%>
	<div id="container">
		<header id="sliderbox"> 
		<ul id="slider">
		</ul>
		  <nav class="menubar">
		<ul>
			<li><a href="#">사진</a></li>
			<li><a href="#" target="_blank">동영상</a></li>
			<li><a href="#">관광</a>
				<ul class="ul">
					<li><a href="">자라섬</a>
					<li><a href="">아침고요수목원</a>
					<li><a href="">아침고가족동물원</a>
					<li><a href="">북한강</a>
					<li><a href="">남이섬</a>
					<li><a href="">축령산 잣나무숲 </a>
					<li><a href="">명지산</a>
					<li><a href="">유명산</a>
					<li><a href="">운악산</a>
					<li><a href="">청평호</a>
					<li><a href="">호명호수</a>
					<li><a href="">용소폭포</a>
					<li><a href="">도마치계곡(적목용소)</a>
					<li><a href="">용추계곡</a>
					<li><a href="">백둔계곡</a>
					<li><a href="">쁘띠프랑스</a>
					<li><a href="">에델바이스</a>
					<li><a href="">가평 레일파크</a>
					<li><a href="">취옹예술관</a>
					<li><a href="">인터렉티브 아트 뮤지엄 </a>
				</ul></li>
			<li><a href="#">숙소</a>
				<ul class="ul">
					<li><a href="">일반숙박</a>
					<li><a href="">민박</a>
					<li><a href="">캠핑장</a>
				</ul></li>
			<li><a href="Board.jsp">게시판</a></li>
			<%
            request.setCharacterEncoding("UTF-8");
			%>
			
			<% if (session.getAttribute("userID") == null) {%>
			<script type="text/javascript">
	         location.href = 'Login.jsp'
	        </script>
			<% } else { %>
			<form class="login" action="LogoutAction.jsp" method="post">
				<b style="color:white"><%=session.getAttribute("userID")%>님 로그인하셨습니다.</b>
				<input type="submit" value=" 로그아웃 ">
				<input type="button" value=" 회원정보 " onclick="javascript:location.href='a.jsp'">
				<input type="button" value=" 회원탈퇴" onclick="javascript:location.href='deletePro.jsp'">
			</form>
			<% }%>
			
		</ul>
		</nav>
		<div class="silder">
		</div>
		</header>
		<section id="intro">
		<div class="page-title"></div>
		<h1>가평 소개</h1>
		<ul class="map">

		</ul>
		</section>
		<section id="map">
		<div class="page-title"></div>
		<h1>안형모</h1>
		</section>
		<section id="chioce">
		<div class="page-title">
			<h1>오시는 길</h1>
		</div>
		<div class="content">
			<div class="photo">
				<img src="가평.png" alt="가평"
					style="border: 1px solid white; border-radius: 30%">
			</div>
			<div class="text">
				<h2 class="sub-titles">자가용</h2>
				<br>
				<div class="road">
					<b>북부간선도로(5.1Km)-></b><b>경춘북로(21.0Km)-></b><br> <b>경춘로</b>
				</div>
				<div class="text">
					<h2 class="sub-titles">대중교통</h2>
				</div>
				<div class="text">
					<h2 class="sub-titles">자전거</h2>
				</div>

			</div>
		</div>
		</section>
		<footer>
		<p>@korean bible travels@</p>
		</footer>
	</div>
</body>