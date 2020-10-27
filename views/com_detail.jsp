<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<link rel="stylesheet" href="resources/css/style.css">
    <script src="https://kit.fontawesome.com/fd87a5d6a4.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<!-- jQuery CDN -->
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>

	   <table border='0' cellspacing='0' id='table_detail'>
	      <tr>
	         <td id='td_toppic_title'>
	          <c:choose>
            	<c:when test="${dto.topic eq '기타'}">
            		<span class='span_topic_ect'> ${dto.topic}</span>
            	</c:when>
            	<c:when test="${dto.topic eq '자격증'}">
            		<span class='span_topic_license'> ${dto.topic}</span>
            	</c:when>
            	<c:when test="${dto.topic eq '거래'}">
            		<span class='span_topic_market'> ${dto.topic}</span>
            	</c:when>
            	<c:when test="${dto.topic eq '유학'}">
            		<span class='span_topic_abroad'> ${dto.topic}</span>
            	</c:when>
            	<c:when test="${dto.topic eq '학원/과외'}">
            		<span class='span_topic_study'> ${dto.topic}</span>
            	</c:when>
            </c:choose>
	         	${dto.title}
	         </td>
	         <td align="right" id='go_to_list'>
		         <c:choose>
		         		<c:when test="${dto.custid eq sessionScope.custid}">
		         			<a href='edit.do?idx=${dto.board_idx}'>수정</a>
		         			<a href='delete.do?idx=${dto.board_idx}'>삭제</a>
		         		</c:when>
		         </c:choose>
	         </td>
	      </tr>
	      <tr id='line'>
	         <td colspan=2><hr></td>
	      </tr>
	      <tr>
	         <td id='detail_info' colspan=2 align="right">
	         	${dto.custid} 조회 ${dto.hit} ${dto.wdate}
	         </td>
	      </tr>
	      <tr>
	         <td id='detail_content' colspan=2>${dto.bcontent}</td>
	      </tr>
	      <tr id='line'>
	         <td colspan=2><hr></td>
	      </tr>
	      
	      
	      <tr id='go_to_list'>
	         <td align='left'>
	         	<a href='/bselect.do'>이전글</a>
	         	<a href='community.do'>목록</a> 
	         	<a href='boardLike.do?idx=${dto.board_idx}' onclick='heart_notice()'>추천 <font style='color:red;'>${dto.blike}</font></a>
	         	<a href=''>댓글 <font style='color:red;'>0</font></a>
	         </td>
	         <td align='right'><a href='/bselect.do'>다음글</a></td>
	      </tr>
	   </table>

	<c:import url="/replySelect.do"></c:import>
    <jsp:include page="footer.jsp"/>
</body>
</html>




