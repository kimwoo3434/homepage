<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ossi.jsp" %>

<%
UploadSave upload = new UploadSave(request,-1,-1,tempDir);
OldLegoDTO dto = new OldLegoDTO();

String passwd = UploadSave.encode(upload.getParameter("passwd"));
String id = UploadSave.encode(upload.getParameter("id"));
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));


Map map = new HashMap();
map.put("id", id);
map.put("passwd", passwd);

pflag = dao.passwdCheck(map);

if(pflag){ 

FileItem fileItem = upload.getFileItem("fname");
long size = fileItem.getSize();

if(size > 0){
	 
	if(oldfile!=null && !oldfile.equals("lego.jpg")){
	UploadSave.deleteFile(upDir, oldfile);
	}
}
String fname = UploadSave.saveFile(fileItem, upDir);

dto.setFname(fname);
dto.setId(id);
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));


flag = dao.update(dto); 

}else{
	str="비밀번호가 다릅니다.";
	
}
%>

<!DOCTYPE html>

<html>
<head>
  <title>이미지수정</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function listM(){
	  var url = "list.jsp";
	 
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
  if(!pflag){
	out.print(str);
	out.print("<br>");
	%>
	<button type="button" class="btn btn-default" onclick="history.back()">취소</button> 
	<button class="btn btn-default" onclick="listM()">이미지목록</button>
  <% 
  }else if(flag){
	  out.print("수정성공<br><br>");
	  %>
	  <button class="btn btn-default" onclick="location.href='read.jsp?id=<%=dto.getId()%>'">이미지정보</button>
	  <button class="btn btn-default" onclick="listM()">이미지목록</button>
	  	
  <% 
  }else{
	  out.print("수정실패<br>");
	  
 %> 
 	<br>
	<button type="button" class="btn btn-default" onclick="history.back()">취소</button> 
	<button class="btn btn-default" onclick="listM()">이미지목록</button>
 <% 
  }
  
  %>
  
  </div>
 
</div>
  


</body>
</html>