<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<jsp:useBean id="dto" class="join.JoinDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>
<%
String col = request.getParameter("col");
String word = request.getParameter("word");
flag = dao.update(dto); 

%>

<!DOCTYPE html>

<html>
<head>
  <title>회원정보수정</title>
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

  <h1 class="col-sm-offset-2 col-sm-10">정보수정확인</h1>
  <div class="well well-lg">
  <%
  if(flag){
	  out.print("수정성공");
	  %>
	  <button class="btn btn-default" onclick="location.href='read.jsp?id=<%=dto.getId()%>'">회원정보</button>
	  <button class="btn btn-default" onclick="listM()">회원목록</button>
	  	
  <% 
  }else{
	  out.print("수정실패");
 %> 
	<button type="button" class="btn btn-default" onclick="history.back()">취소</button> 
	<button class="btn btn-default" onclick="listM()">회원목록</button>
 <% 
  }
  
  %>
  
  </div>
 
</div>
  


</body>
</html>