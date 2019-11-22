<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/nssi.jsp" %>

<%
int no= Integer.parseInt(request.getParameter("no"));
String passwd = request.getParameter("passwd");

Map map = new HashMap();
map.put("no", no);
map.put("passwd", passwd);

boolean pflag = dao.passCheck(map);

if(pflag){
	flag = dao.delete(no);
}



%>

<!DOCTYPE html>

<html>
<head>
  <title>notice</title>
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
<div class="well well-lg">
	<%
		if(!pflag){
			out.print("잘못된 비번입니다.");
		}else if(flag){
			out.print("글 삭제성공입니다.");
		}else{
			out.print("글 삭제 실패입니다.");
		}
	
	%>



  
</div>
  
<% if(!pflag) {%>
	<button class="btn btn-default" onclick="history.back()">다시시도</button>
	<%} %>
	<button class="btn btn-default" onclick="location.href='./createForm.jsp'">다시등록</button>
	<button class="btn btn-default" onclick="listb()">목록</button>
</div>
</body>
</html>