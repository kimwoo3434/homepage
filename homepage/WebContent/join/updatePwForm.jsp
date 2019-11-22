<%@ page contentType="text/html; charset=UTF-8" %> 
<%
String id = request.getParameter("id");
String col = request.getParameter("col");
String word = request.getParameter("word");
%>


<!DOCTYPE html>

<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function inCheck(f){
	  if(f.passwd.value.length == 0){
		  alert("비번을입력해주세요");
		  f.passwd.focus();
		  return false;
	  }
	  if(f.repasswd.value.length == 0){
		  alert("비번확인을입력해주세요");
		  f.repasswd.focus();
		  return false;
	  }
	  if(f.passwd.value != f.repasswd.value){
		  alert("비번과 비번확인이 같아야 합니다.");
		  f.passwd.value="";
		  f.repasswd.value="";
		  f.passwd.focus();
		  return false;
	  }
  }
  
  </script>
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">비밀번호변경</h1>
  <form class="form-horizontal" 
  	action="updatePwProc.jsp"
  	method="post"
  	onsubmit="return inCheck(this)">
  	
  	<input type="hidden" name="id" value="<%=id %>">
  	<input type="hidden" name="col" value="<%=col %>">
  	<input type="hidden" name="word" value="<%=word%>">
  	
    <div class="form-group">
      <label class="control-label col-sm-2" for="passwd">비밀번호</label>
      <div class="col-sm-6">
        <input type="password" class="form-control" id="passwd" placeholder="Enter passwd" name="passwd">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="repasswd">비밀번호확인</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="repasswd" placeholder="Enter repassword" name="repasswd">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">변경</button>
        <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
      </div>
    </div>
  </form>
</div>
  


</div>
</body>
</html>