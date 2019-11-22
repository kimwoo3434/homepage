<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
String id = request.getParameter("id");
String oldfile = request.getParameter("oldfile"); 


%>

<!DOCTYPE html>

<html>
<head>
  <title>회원탈퇴</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">회원탈퇴</h1>
  <form class="form-horizontal" 
  	action="deleteProc.jsp"
  	method="post">
  	<input type="hidden" name="id" value="<%=id %>">
  	<input type="hidden" name="oldfile" value="<%=oldfile %>">
       회원탈퇴를 하시려면 밑의 버튼을 눌러주세요
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">탈퇴</button>
      </div>
    </div>
  </form>
</div>
  


</div>
</body>
</html>