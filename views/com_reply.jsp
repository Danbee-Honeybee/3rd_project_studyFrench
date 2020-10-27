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
	<!-- ajax submit -->
	<script>
			$(document).ready(function(){
				$('#replyadd').on('click', function(){
			        $.ajax({
			            url: "replyInsert.do",
			            type: "POST",
			            data: $('#replyform').serialize(),
			            success: function(data){
			            	//location.href='community_detail.do';
			            	alert("reply added");
			            },
			            error: function(){
				            alert("failed to add reply");
				        }
			        });
			    });
			});	
	</script>
</head>
<body>
	<table border=0 cellspacing=0 class='table_reply'>
	
		 <tr align='center'> <!-- 댓글 작성 -->
			<td class='tr_reply_insert'> 
				<form id='replyform'>
					<input type='text' name='rcontent' class='input_reply'>
					<input type='hidden' name='board_idx' value='${dto.board_idx}'>
					<button class='submit__reply' id='replyadd'>댓글작성</button>
				</form>
			</td>
		 </tr>
		  
		  <c:forEach var="rdto" items="${rdto}">
			  <tr id='line'>
		         <td colspan=2><hr></td>
		      </tr>
		      <tr class='tr_select_reply'> <!-- 댓글 출력 -->
		      	<td>
		      		<p class='p_reply_author'>${rdto.rwriter} ${dto.rdate}</p>
		      		<p class='p_reply_content'>${rdto.rcontent}</p>
		      	</td>
		      </tr>
	      </c:forEach>
	</table>
    <jsp:include page="footer.jsp"/>
</body>
</html>




