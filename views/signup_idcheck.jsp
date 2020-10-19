<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IDcheck</title>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript">
     function first(){
         open_form.ID.focus();
     }
     function notice(){
         var cnt = document.open_form.cnt.value;
         var span = document.getElementById('spanForNotice');
         if(${cnt}>0){
        	 span.innerHTML="<font color='red'>이미 사용중인 아이디입니다.</font>";
        	 return;
         }
         if(${cnt}==0){
        	 span.innerHTML="<font color='red'>사용 가능한 아이디입니다. <br>3초후 팝업창이 닫힙니다.</font>";
        	 setTimeout('close();', 3000);
        	 setTimeout("location.href='idcheck_complete.do", 3000); 
        	 return;
         }
     }
</script>
</head>
<body onLoad="notice();">
<% 
	String custid=request.getParameter("custid"); 
%>
<div class="pop_box">
   <form name="open_form" method="post" action="idcheckSave.do">
        아이디   
        <input type="text"   class="pop_custid" name="custid" value='<%=custid%>'>
        <input type="hidden" name='cnt' value="${cnt}" onchange='notice();'>
        <input type="submit" class="pop_button" value="중복확인">
        <br><span id='spanForNotice'></span>
   </form>
</div>

</body>
</html>