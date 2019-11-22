<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
UploadSave upload = new UploadSave(request,-1,-1,tempDir);
String id = UploadSave.encode(upload.getParameter("id"));
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
String col= UploadSave.encode(upload.getParameter("col"));
String word= UploadSave.encode(upload.getParameter("word"));


FileItem fileItem = upload.getFileItem("fname");

if(oldfile!=null && !oldfile.equals("member.jpg")){
	UploadSave.deleteFile(upDir, oldfile);	
}

long size = fileItem.getSize();
String fname="";
if(size >0){
	
	fname = UploadSave.saveFile(fileItem, upDir);
}



Map map = new HashMap();
map.put("id", id);
map.put("fname", fname);
flag = dao.updateFile(map); 
%>

<!DOCTYPE html>

<html>
<head>
  <title>사진수정</title>
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

  <h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
  <div class="well well-lg">
  <%
  if(flag){
	  out.print("사진수정성공");
  }else{
	  out.print("사진수정실패");
  }
  
  %>
</div>  
  <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" onclick="location.href='read.jsp?id=<%=id%>'">나의정보</button>
        <button type="button" class="btn btn-default" onclick="history.back()">취소</button>
        <!-- <button class="btn btn-default" onclick="listM()">회원목록</button> -->
      </div>
</div>
  



</body>
</html>