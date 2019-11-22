<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<jsp:useBean id="dto" class="join.JoinDTO"></jsp:useBean>

<%
UploadSave upload = (UploadSave)request.getAttribute("upload");

dto.setId(UploadSave.encode( upload.getParameter("id")));
dto.setJname(UploadSave.encode(upload.getParameter("jname")));
dto.setTel(UploadSave.encode(upload.getParameter("tel")));
dto.setZipcode(UploadSave.encode(upload.getParameter("zipcode")));
dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));  
dto.setEmail(UploadSave.encode(upload.getParameter("email")));

FileItem fileItem = upload.getFileItem("fname"); 
int size = (int)fileItem.getSize();

if(size >0){
	String fname = UploadSave.saveFile(fileItem, upDir);
	dto.setFname(fname);
}else{
	dto.setFname("member.jpg");
}

flag = dao.create(dto);

%>

<!DOCTYPE html>

<html>
<head>
  <title>회원</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <div class="well well-lg">
  <%
  if(flag){
	  out.print("회원가입성공");
  }else{
	  out.print("회원가입실패");
  }
  
  %>
  
</div>
  <button onclick="location.href='loginForm.jsp'" class="btn btn-default">로그인</button>
  <button onclick="location.href='../index.jsp'" class="btn btn-default">홈</button>

</div>
</body>
</html>