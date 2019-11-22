<%@ page contentType="text/html; charset=UTF-8" %> 


<!DOCTYPE html>

<html>
<head>
  <title>notice</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">공지사항 생성</h1>
  <form class="form-horizontal" 
  	action="./createProc.jsp"
  	method="post">
    <!-- <div class="form-group">
      <label class="control-label col-sm-2" for="wname">작성자:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="wname" placeholder="Enter 작성자" name="wname">
      </div>
    </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="title" placeholder="Enter 제목" name="title">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-6">
      	<textarea rows="12" cols="6" id="content" name="content" class="form-control"></textarea>        
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="passwd">비밀번호</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="passwd" placeholder="Enter 비밀번호" name="passwd">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="submit" class="btn btn-default">등록</button>
        <button type="reset" class="btn btn-default" onclick="location.href='./list.jsp'">취소</button>
        
      </div>
    </div>
    
  </form>
  
</div>
  


</div>
</body>
</html>