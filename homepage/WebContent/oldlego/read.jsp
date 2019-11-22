<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ossi.jsp" %>
<%
String id = request.getParameter("id");
OldLegoDTO dto = dao.read(id); 

%>

<!DOCTYPE html>

<html>
<head>
  <title>이미지조회</title>
  <meta charset="utf-8">
  
  <script type="text/javascript">
  function updateF(){
	  var url ="updateForm.jsp";
	  url +="?id=<%=dto.getId()%>";
	 
	  location.href = url;
  }
  
  function deleteF(){
	  var url = "deleteForm.jsp";
	  url += "?id=<%=dto.getId()%>";
	  
	  location.href = url;
  }
  
  
  </script>
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1>이미지조회</h1>
  <div class="panel panel-default">
  	<div class="panel-heading">작성자</div>
  	<div class="panel-body"><%=dto.getId() %></div>
  	<div class="panel-heading">제목</div>
  	<div class="panel-body"><%=dto.getTitle() %></div>
  	<div class="panel-heading">내용</div>
  	<div class="panel-body"><img src="<%=root %>/oldlego/storage/<%=dto.getFname() %>"></div>
  	<br><br><br> 
  	<div class="panel-body" style="height: 200px"><%=dto.getContent() %></div>

  	<div class="panel-heading">등록일</div>
  	<div class="panel-body"><%=dto.getMdate() %></div>
  	
 </div>
   <button onclick="updateF()" class="btn btn-default">이미지수정</button>
   <button onclick="deleteF()"class="btn btn-default">삭제</button>
   <button onclick="location.href='list.jsp'" class="btn btn-default">목록</button>


</div>
</body>
</html>