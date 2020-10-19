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
	<script src="https://code.jquery.com/jquery-latest.js"/>
</head>
<body>
	<jsp:include page="header.jsp"/>
<form name="signupForm" action="signupSave.do" method='post'>	
	<table class='table_signup' border="0" cellspacing='0'>
        <tr>
            <td>아이디</td>
            <td>
            	<input type="text" name="custid" class="id" value='${custid}'>
            	<input type="button" class='idcheck_button' value="중복확인" onclick="open_pop();"></a>
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="custpassword" class="password" value='1234'></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="custname" class="name" value='박단비'></td>
        </tr>
        <tr>
            <td>프랑스어 <br>레벨</td>
            <td>
                <select name="clevel" class="level">
                    <option value="A1" checked>A1</option>
                    <option value="A2">A2</option>
                    <option value="B1">B1</option>
                    <option value="B2">B2</option>
                    <option value="C1">C1</option>
                    <option value="C2">C2</option>
                </select>
            </td>
        </tr>
        <tr><td colspan="2">
            <input type="submit" class="write_submit" value="완료">
            <a href="main.do"><button class='write_cancel'>취소</button></a>
        </td></tr>
    </table>
</form>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
	function open_pop(){
		var id = document.signupForm.custid.value;

		var pop_title="idchecking"
		var size="width=400, height=200, left=700, top=300";
		window.open("", pop_title, size);
			
		var form = document.signupForm;
		form.target = pop_title;
		form.action = "idcheck.do"; 
		
		form.submit();
	}
</script>
</body>
</html>