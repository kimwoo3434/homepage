<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ossi.jsp" %>
 
<%
String id = request.getParameter("id");
OldLegoDTO dto = dao.read(id);
 
String oldfile = dto.getFname();

%>

<!DOCTYPE html>

<html>
<head>
  <title>이미지수정</title>
  <meta charset="utf-8">
  <style type="text/css">
  #need{
  	color:red;
  }
  
  </style>
  
  
  
  <script type="text/javascript">
  function inCheck(f){
	  if(f.passwd.value==''){
		  alert("비번을 입력하세요");
		  f.passwd.focus();
		  return false;
	  }
	
	  if(f.title.value==''){
		  alert("제목을 입력하세요");
		  f.title.focus();
		  return false;
	  }
	 
	 
  
	 
	  
  }
  </script>
  
   

</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">이미지수정</h1>
 
  <form class="form-horizontal"
  action="updateProc.jsp"
  method="post"
  name='frm'
  enctype="multipart/form-data"
  onsubmit="return inCheck(this)">
  
  
   <input type="hidden" name="oldfile" value="<%=oldfile %>">
  
  <div class="form-group">
  	<label class="control-label col-sm-2" for="oldfile">원본파일</label>
  	<img src="<%=root %>/oldlego/storage/<%=oldfile %>">
  </div>
  
  <div class="form-group">
  	<label class="control-label col-sm-2" for="fname">이미지수정</label>
  	<div class="col-sm-4">  		
  		<input type="file" class="form-control" id="fname" name="fname" accept=".jpg,.gif,.png" required="required">
	    		
  	
  	</div>
  </div>
  <div class="form-group">
  	<label class="control-label col-sm-2" for="id">아이디</label>
  	<div class="col-sm-3">
  		<input type="text" class="form-control" id="id" value="<%=dto.getId() %>" name="id" readonly="readonly">
  	</div>
  		
  		
  </div>	 
  <div class="form-group">
  	<label class="control-label col-sm-2" for="passwd">비밀번호</label>
  	<div class="col-sm-3">
  		<input type="password" class="form-control" id="passwd" placeholder="passwd입력" name="passwd">
  	</div>
  		
  		
  </div>
  
  <div class="form-group">
  	<label class="control-label col-sm-2" for="title">제목</label>
  	<div class="col-sm-3">
  		<input type="text" class="form-control" id="title" name="title" value="<%=dto.getTitle()%>">
  	</div>  		
  </div>
 <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-6">
      	<textarea rows="12" cols="6" id="content" name="content" class="form-control">      	     	
      	<%=dto.getContent()%>
      	</textarea>        
      </div>
    </div>
       
  
   
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-5">
        <button type="submit" class="btn btn-default">수정</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>

</form>  


</div>
</body>
</html>