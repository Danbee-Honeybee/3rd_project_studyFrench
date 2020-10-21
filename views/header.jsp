<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
 	<link rel="stylesheet" href="resources/css/style.css">
    <script src="https://kit.fontawesome.com/fd87a5d6a4.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
 	 <nav class="navbar">
        <div class="navbar__logo">
            <i class="fas fa-globe-europe"></i>
            <a href="main.do">단비스쿨 <font>프랑스어</font></a>
        </div>
        <ul class="navbar__menu">
            <li><a href="community.do">커뮤니티</a></li>
            <li><a href="studyword.do">단어외우기</a></li>
            <c:choose>
				<c:when test="${empty sessionScope.custid}">
	            	<li><a href="signup.do">신규가입</a></li>
	            	<li class='button_login'><a href="login.do">로그인</a></li>
				</c:when>
				<c:when test="${not empty sessionScope.custid}">
					<li><a href="logout.do">로그아웃</a></li>
				</c:when>
			</c:choose>
        </ul>
    </nav>
</body>
</html>




