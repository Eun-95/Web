<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.Board" scope="page" /> <!--jsp에서 사용할 객체생성 -->
<jsp:setProperty name="board" property="wordsNo" />
<jsp:setProperty name="board" property="wordsEng" />
<jsp:setProperty name="board" property="wordsKor" />
<jsp:setProperty name="board" property="wordsContent" />
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>뇌에 때려박는 단어장 프로젝트</title>
</head>
<body>
    <%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
            if (board.getWordsEng() == null || board.getWordsKor() == null
                    || board.getWordsContent() == null ) { //영어, 한국어, 단어내용이 없다면 이전 페이지로 돌려보낸다.
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert(' 입력이 안 된 사항이 있습니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                BoardDAO bbsDAO = new BoardDAO(); //3가지 항목을 채워넣었다면, 실제로 데이터베이스에 저장한다.
                int result = bbsDAO.write(board.getWordsEng(),board.getWordsKor(),userID,board.getWordsContent());
                if (result == -1) { //아이디가 중복되는지 확인 (userID는 Primary Key이기 때문.)
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('작성을 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                } else {//새 단어 작성 성공시, 단어장페이지로 이동시켜준다
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'Board.jsp'");
                    script.println("</script>");
                }
            
            }
        
    %>
</body>
</html>



