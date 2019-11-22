<%@ page contentType="text/html; charset=UTF-8" %> 


<!DOCTYPE html>

<html>
<head>
  <title>이미지등록</title>
  <meta charset="utf-8">
  <style type="text/css">
  #need{
  	color:red;
  }
  
  </style>
  
  <script type="text/javascript">
  
  function idCheck(id){
	  if(id==''){
		  alert("아이디를 입력하세요");
		  document.frm.id.focus();
	  }else{
		  var url = "id_proc.jsp";
		  url +="?id="+id;
		  
		  var wr = window.open(url, "아이디중복확인","width=500,height=500");
		  wr.moveTo((window.screen.width-500)/2, (window.screen.height-500)/2);
	  }
  }
  
  
  
  </script>
  
  
  <script type="text/javascript">
  function inCheck(f){
	  if(f.id.value==''){
		  alert("아이디를 입력하세요");
		  f.id.focus();
		  return false;
	  }
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
  
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">이미지등록</h1>
 
  <form class="form-horizontal"
  action="preProc.jsp"
  method="post"
  name='frm'
  enctype="multipart/form-data"
  onsubmit="return inCheck(this)">
  
  <div class="form-group">
  	<label class="control-label col-sm-2" for="fname">사진</label>
  	<div class="col-sm-4">
  		<input type="file" class="form-control" id="fname" name="fname" accept=".jpg,.gif,.png" >
	    		
  	
  	</div>
  </div>
  <div class="form-group">
  	<label class="control-label col-sm-2" for="id">아이디</label>
  	<div class="col-sm-3">
  		<input type="text" class="form-control" id="id" placeholder="Enter id" name="id">
  	</div>
  		<button type="button" class="btn btn-default" onclick="idCheck(document.frm.id.value)">ID중복확인</button>
  		
  </div>	 
  <div class="form-group">
  	<label class="control-label col-sm-2" for="passwd">패스워드</label>
  	<div class="col-sm-3">
  		<input type="password" class="form-control" id="passwd" placeholder="Enter passwd" name="passwd">
  	</div>
  		
  </div>
  <div class="form-group">
  	<label class="control-label col-sm-2" for="title">제목</label>
  	<div class="col-sm-3">
  		<input type="text" class="form-control" id="title" name="title">
  	</div>  		
  </div>
 <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-6">
      	<textarea rows="12" cols="6" id="content" name="content" class="form-control"></textarea>        
      </div>
    </div>
       
  
   
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-5">
        <button type="submit" class="btn btn-default">등록</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>

</form>  


</div>
</body>
</html>