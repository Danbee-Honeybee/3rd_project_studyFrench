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
	<div class='div_login__box'>
	<form action="loginprocess.do" method="post"> 
        <table class='table_login__box' border='0' cellspacing='0'>
            <tr>
                <td>아이디 </td>
                <td><input type="text" class="id" name="custid" value='user1'><br></td>
            </tr>
            <tr>
                <td>비밀번호 </td>
                <td><input type="password" class="password" name="custpassword" value='1234'></td>
            </tr>
            <tr>
                <td colspan="2">
                    	<input class='loing_submit_button' type='submit' value='로그인'>
                   </div>
                </td>
            </tr>
        </table>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>




