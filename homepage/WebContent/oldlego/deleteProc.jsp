<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ossi.jsp" %>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String oldimage = request.getParameter("oldimage");
out.print(oldimage);

Map map = new HashMap();
map.put("id", id);
map.put("passwd", passwd);

 
pflag = dao.passwdCheck(map);

if(pflag){
flag = dao.delete(id); 
}



%>

<!DOCTYPE html>

<html>
<head>
  <title>guest</title>
  <meta charset="utf-8">
 
  <script type="text/javascript">
  
  function listb(){
	  var url = "list.jsp";
	 <%--  url += "?col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>"; --%>
	  location.href = url;
	  
  }
  
  </script>
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="well well-lg">
	<%  if(!pflag){
			out.print("비번이 다릅니다.");
	
		}else if(flag){
			out.print("삭제 성공입니다.<br>");
				if(oldimage != null && !oldimage.equals("lego.jpg")){
					UploadSave.deleteFile(upDir, oldimage);
				}
		}else{
			out.print("삭제 실패입니다.<br>");
			
		}
	
	%>



  
</div>
  <%if(!pflag){%> 
	
	<button class="btn btn-default" onclick="history.back()">다시시도</button>
	<%}else{%>
	<button class="btn btn-default" onclick="location.href='./createForm.jsp'">다시등록</button>
	<button class="btn btn-default" onclick="listb()">목록</button>
	<%} %>
</body>
</html>