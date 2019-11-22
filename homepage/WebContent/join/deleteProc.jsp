<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
String id = request.getParameter("id");
String oldfile = request.getParameter("oldfile");

flag = dao.delete(id); 

if(flag && !oldfile.equals("member.jpg")){
	
	UploadSave.deleteFile(upDir, oldfile);	
}

%>

<!DOCTYPE html>

<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">회원탈퇴</h1>
  <div class ="well well-lg">
  <%if(flag){ 
  out.print("탈퇴가 정상적으로 이루어졌습니다.");
  session.removeAttribute("id");
  }else{
	  out.print("탈퇴불가능");
  }
  %>
  <button class="btn btn-default" onclick="location.href='../index.jsp'">홈</button>
  
  </div>
 
</div>
  



</body>
</html>