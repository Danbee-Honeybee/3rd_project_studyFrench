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
		<div class='project__box'>
        <div class='project__content'>
            <h3>프로젝트 소개</h3>
            <br>3년간 불어공부를 하면서, 영어와는 달리 같이 공부 할 수 있는 커뮤니티나 컨텐츠가 없어
            <br>겪었던 불편함을 해소하고자 제작하게 되었습니다. MVC2 프로젝트는 팀원과 함께 진행했지만,
            <br>Spring 프로젝트는 DB설계, xml 설정, 값전달 흐름 등 Spring을 전체적으로 이해하고자 혼자 진행하게 되었습니다.
            <table class='project__table' border='0' cellspacing='0'>
                <tr>
                    <td><h3>커뮤니티</h3></td>
                </tr>
                <tr>
                    <td>프랑스에 거주중인 한인들이 가장 많이 이용하는 
                        '<a href="http://www.francezone.com/xe/home">프랑스존</a>'을 참고 했습니다.</td>
                </tr>
                <tr>
                    <td><a href="">바로가기</a></td>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td><h3>단어외우기</h3></td>
                </tr>
                <tr>
                    <td>
                        프랑스어 자격증 DELF를 기준으로 레벨을 6단계로 나누고 각 레벨별로 프랑스어 단어를 외울 수 있도록 했습니다.
                        추후 회화나 문장을 공부 할 수 있는 서비스도 추가하고 싶습니다.
                    </td>
                </tr>
                <tr>
                    <td><a href="">바로가기</a></td>
                </tr>
                <tr>
                    <td><hr></td>
                </tr>
                <tr>
                    <td><h3>질문/답변하기</h3></td>
                </tr>
                <tr>
                    <td>
                        한국에 있는 불어사전은 정확하지 않거나 결과가 아예 나오지 않는 경우가 정말 많습니다.
                        <br>그래서 불어공부를 하면서 어려운점이 있으면 물어볼곳이 없어서 많이 불편했던 기억이 있습니다.
                        <br>저와 같은 경험을 하고 계신 분들을 위해, 어려운 점이 있을때 언제든 편하게 질문할 수 있는 공간을 만들고자 했습니다.
                    </td>
                </tr>
                <tr>
                    <td><a href="">바로가기</a></td>
                </tr>
            </table>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>




