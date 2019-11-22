<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String col = request.getParameter("col");
String word = request.getParameter("word");

Map map = new HashMap();

map.put("id", id);
map.put("pw", passwd);

flag = dao.updatePw(map);  

%>
<!DOCTYPE html>

<html>
<head>
  <title>비밀번호 변경확인</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function listM(){
	  var url = "list.jsp";
	  url +="?col=<%=col%>";
	  url +="&word=<%=word%>";
	  location.href = url;
  }
  </script>
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">비밀번호 변경확인</h1>
  
  <%
  if(flag){
	  out.print("비번변경이 성공했습니다.");
  }else{
	  out.print("비번변경이 실패했습니다.");
  }
  
  %>
  
    
  
  <button class="btn btn-default" onclick="location.href='loginForm.jsp'">로그인</button>
  <button class="btn btn-default" onclick="history.back()">다시시도</button>
 <!--  <button class="btn btn-default" onclick="listM()">회원목록</button> -->
  


</div>
</body>
</html>