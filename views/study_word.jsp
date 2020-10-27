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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class='div_wordcard_box' id='fcard'>
		<span class='fword'>${worddto.fword}</span><br>
		<span class='kword'>${worddto.kword}</span>
	</div>
	<div class='div_button_box' onclick='reverseCard()'>
		<table border=0 cellspacing=0>
			<tr>
				<td><a href='wordCard.do?command=back&c=${worddto.wrn}'><i class="fas fa-arrow-alt-circle-left"></i></a></td>
				<td class='td_word_record_number'>${worddto.wrn}/${wordcnt}</td>
				<td><a href='wordCard.do?command=plus&c=${worddto.wrn}'><i class="fas fa-arrow-alt-circle-right"></i></a></td>
			</tr>
		</table>
    </div>
    
    <table border=0 cellspacing=0 class='table_level'>
        <tr>
            <td><a href="">A1</a></td>
            <td><a href="">A2</a></td>
            <td><a href="">B1</a></td>
            <td><a href="">B2</a></td>
            <td><a href="">C1</a></td>
            <td><a href="">C2</a></td>
        </tr>
    </table>

<c:forEach var="wdto" items="${word}"  varStatus="vs">
    <table border=0 cellspacing=0 class='table_wordList' id='flip${vs.index}'>
        <tr>
            <td class='td_frenchword'>${wdto.fword}</td>
            <td class='td_koreanword'>${wdto.kword}</td>
            <td class='td_wordlevel'>${wdto.wlevel}</td>
        </tr>
    </table>
    <div class='panel' id="panel${vs.index}">
    	<input type='text' placeholder='예문' name='exam' class='input_example'>
    	<button class='button_example'>예문추가</button>
    </div>
    
    <script>
		var val = document.getElementById('panel${vs.index}');
		$(document).ready(function(){
    		$("#flip${vs.index}").click(function(){
    			$('#panel${vs.index}').slideToggle("slow");
      		});
		});
    </script>
    
</c:forEach>
    <jsp:include page="footer.jsp"/>
</body>
</html>




