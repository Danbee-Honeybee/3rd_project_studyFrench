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
            <td class='category' colspan='5' align='left'>
                    <a href=""><button>전체</button></a>
                    <a href=""><button>유학</button></a>
                    <a href=""><button>자격증</button></a>
                    <a href=""><button>학원/과외</button></a>
                    <a href=""><button>거래</button></a>
                    <a href=""><button>기타</button></a>
            </td>
        </tr>
        <tr class='tr__hr'>
            <td colspan='5'><hr></td>
        </tr>
        
        <tr>
            <td class='td__search' colspan='5'>
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
            <td colspan='5'><hr></td>
        </tr>
        <tr id='tr__first'>
            <td>번호</td><td>주제</td><td>제목</td><td>작성자</td><td>작성일</td>
        </tr>
        <tr>
            <td colspan='5'><hr></td>
        </tr>
        <tr>
            <td>5</td>
            <td><span class='span_topic_ect'>기타</span></td>
            <td>단비스쿨 프랑스어 프젝시작</td>
            <td>단비</td>
            <td>2020.10.16</td>
        </tr>
        <tr>
            <td colspan='5'><hr></td>
        </tr>
        <tr>
            <td>4</td>
            <td><span class='span_topic_license'>자격증</span></td>
            <td>단비스쿨 프랑스어 프젝시작</td>
            <td>단비</td>
            <td>2020.10.16</td>
        </tr>
        <tr>
            <td colspan='5'><hr></td>
        </tr>
        <tr>
            <td>3</td>
            <td><span class='span_topic_market'>거래</span></td>
            <td>단비스쿨 프랑스어 프젝시작</td>
            <td>단비</td>
            <td>2020.10.16</td>
        </tr>
        <tr>
            <td colspan='5'><hr></td>
        </tr>
        <tr>
            <td>2</td>
            <td><span class='span_topic_abroad'>유학</span></td>
            <td>단비스쿨 프랑스어 프젝시작</td>
            <td>단비</td>
            <td>2020.10.16</td>
        </tr>
        <tr>
            <td colspan='5'><hr></td>
        </tr>
        <tr>
            <td>1</td>
            <td><span class='span_topic'>학원/과외</span></td>
            <td>단비스쿨 프랑스어 프젝시작</td>
            <td>단비</td>
            <td>2020.10.16</td>
        </tr>
        <tr>
            <td colspan='5'><hr></td>
        </tr>
    </table>
    <jsp:include page="footer.jsp"/>
</body>
</html>




