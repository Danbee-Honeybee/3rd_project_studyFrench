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
            <td>이름</td>
            <td><input type="text" name="custname" class="name" value='박단비'></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td>
            	<input type="text" name="custid" class="id" value='user1'>
            	<input type="button" class='idcheck_button' onclick='open_pop()' value="중복확인">
            </td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="custpassword" class="password" value='1234'></td>
        </tr>
        <tr>
            <td>프랑스어 레벨</td>
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


<form name="modalForm" action="idcheck.do" method="post">
<!-- The Modal -->
 <div id="myModal" class="modal">
      <!-- Modal content -->
      <div class="modal-content">
                <br>
                	<div class='id_content'>
	                	<input type="text" name="madal_id" class='modal_id'>
	                	<a class="button" href="idcheck.do">중복확인</a>
	                	<input type='hidden' name="cnt" value='${cnt}' onblur="cnt()">
	                	<br><span id='id_notice'></span>
                	</div>
                </p>
                <p><br/></p>
            	<div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;">완료</span>
            </div>
      </div>
 </div>
<!--End Modal-->
</form>
	<script type="text/javascript">
	  function open_pop(){
		   $('#myModal').show();
		   var beforeVal = signupForm.custid.value;
		   modalForm.madal_id.value = beforeVal;
		   return;
      }
	  function close_pop(flag) {
	       $('#myModal').hide();
	  }
	  function cnt(){
		  var cnt = modalForm.cnt.value;
		  console.log("cnt : "+cnt);
		  if(cnt>0){
			  msg="<font color='red'>이미 사용중인 아이디입니다.</font>"
			  document.getElementById("id_notice").innerHTML = msg;	  
			  return;
		  } else {
			  msg = "<font color='red'>사용가능한 아이디입니다.</font>";
		      document.getElementById("id_notice").innerHTML = msg;
		      return;
		  }
      }
	</script>
	
	
<jsp:include page="footer.jsp"/>
</body>
</html>




