<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ossi.jsp" %>
<jsp:useBean id="dto" class="oldlego.OldLegoDTO"></jsp:useBean>

<%

UploadSave upload = (UploadSave)request.getAttribute("upload");




	dto.setId(UploadSave.encode(upload.getParameter("id")));    
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	FileItem fileItem = upload.getFileItem("fname"); 

	int size = (int)fileItem.getSize();

	if(size >0){
		String fname = UploadSave.saveFile(fileItem, upDir);
		dto.setFname(fname);
	}else{
		dto.setFname("lego.jpg");
	}

	flag = dao.create(dto); 

	





%>

<!DOCTYPE html>

<html>
<head>
  <title>이미지등록</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <div class="well well-lg">
  <% 
  if(flag){
	  out.print("이미지등록성공");
  }else{
	  out.print("이미지등록실패");
  }
  
  %>
  
</div>
  <button onclick="location.href='list.jsp'" class="btn btn-default">목록</button>
  <!-- <button onclick="location.href='../index.jsp'" class="btn btn-default">홈</button> -->

</div>
</body>
</html>