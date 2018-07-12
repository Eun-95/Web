<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="bootstrap.css">
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background: #fff;
	font-family: 'Courier New', Courier, monospace;
}

a {
	text-decoration: none;
	
}

nav a:link, a:visited {
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
	text-align: center;
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

/*pc화면일때*/
@media screen and (min-width:992px) {
	#container {
		width: 89%;
		margin: 0 auto;
		border: 1px solid gray;
	}
	header {
		width: 100%;
		height: 500px;
		background: url(가평.jpg) center no-repeat;
		background-size: cover;
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
	<div id="container">
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
			</form>
			<% }%>
		</ul>
		</nav>
		<div class="container">
        <div class="row">
            <form method="post" action="writeAction.jsp">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <!--table-striped는 짝수 홀수를 번갈아나오게해서 보다 보기좋게 만들어준다. solid #dddddd는 회색빛깔이 돌게 만든다 -->
                    <thead><!--table head  -->
                        <tr><!--table row  -->
                            <th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 작성</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="English" name="wordsEng" maxlength="50"></td><!--table data-->
                        </tr>
                        <tr>
                            <td><input type="text" class="form-control" placeholder="한국어 뜻" name="wordsKor" maxlength="50"></td>
                        </tr>
                        <tr>
                            <td><textarea class="form-control" placeholder="단어 내용" name="wordsContent" maxlength="2048" style="height:350px"></textarea></td>
                        </tr>
                    </tbody>
                </table>
                    <input type ="submit" class="btn btn-primary pull-right" value="작성">
            </form>
        </div>
       </div>

		<footer>
		<p>@korean bible travels@</p>
		</footer>
	</div>
</body>