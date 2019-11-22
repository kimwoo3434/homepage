<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/gssi.jsp" %>
<jsp:useBean id="dto" class="guest.GuestDTO"></jsp:useBean>
<jsp:setProperty name="dto" property="*"/>

<%
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	
	dao.reply_ansnum(map);//기존답변의 순서를 변경함
	
 	flag = dao.reply_create(dto); //답변등록    
	



%>
<!DOCTYPE html>

<html>
<head>
  <title>guest</title>
  <meta charset="utf-8">
  
  <script type="text/javascript">
  
  function listb(){
	  var url = "list.jsp";
	  url += "?col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>";
	  location.href = url;
	  
  }
  
  </script>
  
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <div class="well well-lg" >
  <%
  	
  	 if(flag){
  		out.print("글 답변 성공입니다.");
  	}else{
  		out.print("글 답변 실패입니다.");
  	}
  
  
  %>
  
  
  </div>



	<button class="btn btn-default" onclick="location.href='./createForm.jsp'">다시등록</button>
	<button class="btn btn-default" onclick="listb()">목록</button>

</div>

</body>
</html>