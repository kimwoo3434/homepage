<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
String id = request.getParameter("id");
if(id == null){
	id = (String)session.getAttribute("id");
}
String grade = (String)session.getAttribute("grade");

String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));
JoinDTO dto = dao.read(id);


%>


<!DOCTYPE html>

<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function updateFile(){
	  var url = "updateFileForm.jsp";
	  url +="?id=<%=dto.getId()%>";
	  url +="&oldfile=<%=dto.getFname()%>";
	  url +="&col=<%=col%>";
	  url +="&word=<%=word%>";
	  location.href = url;
  }
  
  function updateM(){
	  var url = "updateForm.jsp";
	  url +="?id=<%=dto.getId()%>";
	  url +="&col=<%=col%>";
	  url +="&word=<%=word%>";
	  
	  location.href = url;
  }
  function updatePw(){
	  var url = "updatePwForm.jsp";
	  url +="?id=<%=dto.getId()%>";
	  url +="&col=<%=col%>";
	  url +="&word=<%=word%>";
	  
	  location.href = url;
  }
  function deleteM(){
	  var url = "deleteForm.jsp";
	  url +="?id=<%=dto.getId()%>";
	  url +="&oldfile=<%=dto.getFname()%>";
	  url +="&col=<%=col%>";
	  url +="&word=<%=word%>";
	  
	  location.href = url;
  }
  function listM(){
	  var url = "<%=request.getContextPath()%>/admin/list.jsp";
	  url +="?col=<%=col%>";
	  url +="&word=<%=word%>";
	  location.href = url;
  }
  </script>
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10"><%=dto.getId() %>의 회원정보</h1>
  <table class="table table-bordered">
  <tr>
  	<td colspan="2" style="text-align: center">
  	<img src="<%=root %>/join/storage/<%=dto.getFname() %>" 
  	width="250px" height="250px"></td>
  </tr>
  <tr>
  	<th>아이디</th>
  	<td><%=dto.getId() %></td>
  </tr>
  <tr>
  	<th>이름</th>
  	<td><%=dto.getJname() %></td>
  </tr>
  <tr>
  	<th>전화번호</th>
  	<td><%=dto.getTel() %></td>
  </tr>
  <tr>
  	<th>주소</th>
  	<td><%=dto.getAddress1() %> <%=dto.getAddress2() %></td>
  </tr>
  <tr>
  	<th>우편번호</th>
  	<td><%=dto.getZipcode() %></td>
  </tr>
  <tr>
  	<th>email</th>
  	<td><%=dto.getEmail() %></td>
  </tr>
  
  </table>	
  <div style="text-align: center">
  <%if(id !=null && !grade.equals("A")){ %>
  <button class="btn btn-default" onclick="updatePw()">비밀번호수정</button>
  <button class="btn btn-default" onclick="updateM()">정보수정</button>
  <button class="btn btn-default" onclick="updateFile()">사진수정</button>
  <%}else if(id != null && grade.equals("A")){ %>
  <button class="btn btn-default" onclick="deleteM()">회원탈퇴</button>
  <button class="btn btn-default" onclick="listM()">회원목록</button>
 	<%} %>
 	
</div>
  

</div>

</body>
</html>