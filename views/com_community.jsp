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
</head>
<body class='body__community'>
<jsp:include page="header.jsp"/>
    <table class='table__board' border=0 cellspacing=0>
        <tr>
            <td class='category' colspan='7' align='left'>
                    <a href=""><button>전체</button></a>
                    <a href=""><button>유학</button></a>
                    <a href=""><button>자격증</button></a>
                    <a href=""><button>학원/과외</button></a>
                    <a href=""><button>거래</button></a>
                    <a href=""><button>기타</button></a>
            </td>
        </tr>
        <tr class='tr__hr'>
            <td colspan='7'><hr></td>
        </tr>
        
        <tr>
            <td class='td__search' colspan='7'>
                <a href="">
                    <select name="">
                        <option value="">게시판전체</option>
                        <option value="title">제목</option>
                        <option value="name">이름</option>
                        <option value="name">내용</option>
                    </select>
                </a>
                <a href="">
                    <input class='input__keyword' type='text' placeholder='검색어를 입력해주세요.'>
                </a>
                <a href="" class='a__search'>검색</a>
                <a href='write.do' class='a__write'>글쓰기</a>
            </td>
        </tr>
        <tr class='tr__hr'>
            <td colspan='7'><hr></td>
        </tr>
        <tr id='tr__first'>
            <td>번호</td><td>주제</td><td>제목</td>
            <td>작성자</td><td>작성일</td><td>조회수</td>
            <td><i id='heart_icon' class="fas fa-heart"></i></td>
        </tr>
        <tr>
            <td colspan='7'><hr></td>
        </tr>
        
        
        <c:forEach var="dto" items="${LG}">
        <tr>
            <td>${dto.board_idx}</td>
            
            <c:choose>
            	<c:when test="${dto.topic eq '기타'}">
            		<td><span class='span_topic_ect'> ${dto.topic}</span></td>
            	</c:when>
            	<c:when test="${dto.topic eq '자격증'}">
            		<td><span class='span_topic_license'> ${dto.topic}</span></td>
            	</c:when>
            	<c:when test="${dto.topic eq '거래'}">
            		<td><span class='span_topic_market'> ${dto.topic}</span></td>
            	</c:when>
            	<c:when test="${dto.topic eq '유학'}">
            		<td><span class='span_topic_abroad'> ${dto.topic}</span></td>
            	</c:when>
            	<c:when test="${dto.topic eq '학원/과외'}">
            		<td><span class='span_topic_study'> ${dto.topic}</span></td>
            	</c:when>
            </c:choose>
            
            <td><a class='a_community_title' href="community_detail.do?idx=${dto.board_idx}">${dto.title}</a></td>
            <td>${dto.custid}</td>
            <td>${dto.wdate}</td>
            <td>${dto.hit}</td>
            <td>${dto.blike}</td>
        </tr>	
	        <tr>
	            <td colspan='7'><hr></td>
	        </tr>
        </c:forEach>
        <tr align="center">   
     <td colspan="6">
     	<c:if test="${startpage!=1}">
     		<a href="community.do?pageNum=${startpage-1}">[이전]</a>
     	</c:if>	
  	 	<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
  	 		<c:choose>
  	 			<c:when test="${pageNum==i}">
  	 				<font style="color: red;">[${i}]</font>
  	 			</c:when>
  	 			<c:otherwise>
  	 				<a href="community.do?pageNum=${i}${returnpage}">[${i}]</a>
  	 			</c:otherwise>  	 		
  	 		</c:choose>
  	 	</c:forEach>  
  	 	<c:if test="${endpage<pagecount}">
  	 		<a href="community.do?pageNum=${endpage+1}">[다음]</a>
  	 	</c:if>	   
     </td>
   </tr>
    </table>
    <jsp:include page="footer.jsp"/>
</body>
</html>




