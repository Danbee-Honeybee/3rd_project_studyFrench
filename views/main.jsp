<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[boardList.jsp]</title>
	<link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/fd87a5d6a4.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class='banner'>
        <img src="resources/banner/banner5.jpg">
    </div>
    <table class='index_table' border='0' cellspacing='0'>
        <tr>
            <td>
                <div class="div_word_memory_box">
                    <div class='div_word_memory'>
                        <font>단어암기</font>
                    </div>
                    <div class='div_word_memory_exp'>
                        DELF 수준별로 단어를 외울 수 있어요.
                        <br><a class='index_table_a' href='studyword.do'>바로가기</a>
                    </div>
                </div>
            </td>
            <td>
                <div class="div_question_box">
                    <div class='div_question'>
                        <font>질문하기</font>
                    </div>
                    <div class='div_question_exp'>
                        공부중 어려운점이 있다면<br> 다른 사람들의 답변을 받아보세요.
                    	<br><a class='index_table_a' href=''>바로가기</a>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td><div class="div_question_box">
                <div class='div_question'>
                    <font>단어등록</font>
                </div>
                <div class='div_question_exp'>
                    예문을 추가하고 포인트를 받으세요!
                    <br><a class='index_table_a' href=''>바로가기</a>
                </div>
            </div></td>
            <td>
                <div class="div_question_box">
                    <div class='div_question'>
                        <font>답변하기</font>
                    </div>
                    <div class='div_question_exp'>
                        답변을 기다리고 있는 질문에 답변하고 포인트를 얻으세요!
                        <br><a class='index_table_a' href=''>바로가기</a>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <jsp:include page="footer.jsp"/>
</body>
</html>




