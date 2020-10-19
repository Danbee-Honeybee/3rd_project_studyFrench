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
<body>
	<jsp:include page="header.jsp"/>
	 <div class='div_write_box'>
		<table class='table_write_box' border='0' cellspacing='0'>
			<tr>
                <td>
                    <select name="" class="write_topic">
                        <option value="">유학</option>
                        <option value="">자격증</option>
                        <option value="">학원/과외</option>
                        <option value="">거래</option>
                        <option value="">기타</option>
                    </select>
                    <input type="text" name="title" class="write_title" placeholder="제목을 입력해주세요"
                ></td>
            </tr>
            <tr>
                <td><textarea name="content" class="write_content" placeholder="내용을 입력해주세요"></textarea></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" class="write_submit" value="완료">
                    <a href="main.do"><button class='write_cancel'>취소</button></a>
                </td>
            </tr>
		</table>
	</div>
    <jsp:include page="footer.jsp"/>
</body>
</html>




