<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/gssi.jsp" %>

<%
int guestno = Integer.parseInt(request.getParameter("guestno"));
GuestDTO dto = dao.reply_read(guestno);


%>


<!DOCTYPE html>

<html>
<head>
  <title>guest</title>
  <meta charset="utf-8">
   <script type="text/javascript">
  function input(){
	  var f = document.frm;
	  if(f.wname.value.length==0){
		  alert("이름을 입력하세요.");
		  f.wname.focus();
		  return
	  }
	  if(f.title.value.length==0){
		  alert("제목을입력하세요");
		  f.title.focus();
		  return
	  }
	  if(f.content.value.length==0){
		  alert("내용을입력하세요");
		  f.content.focus();
		  return
	  }
	  if(f.passwd.value.length==0){
		  alert("비번을입력하세요");
		  f.passwd.focus();
		  return
	  }
	  
	  f.submit();
	 
  }
  
  </script>
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">방명록 답변</h1>
  <form class="form-horizontal" 
  	action="./replyProc.jsp"
  	method="post" name="frm">
  	
  	<input type="hidden" name="guestno" value="<%=guestno %>"> <!-- 부모글에 대한 grpno, indent, ansnum을 넘겨줌 -->
  	<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
  	<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
  	<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
  	<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
  	<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
  	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  	
    <div class="form-group">
      <label class="control-label col-sm-2" for="wname">작성자:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="wname" value="" name="wname">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="title" value="<%=dto.getTitle() %>" name="title">
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
        <input type="password" class="form-control" id="passwd" name="passwd">
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" onclick="input()">답변</button>
        <button type="reset" class="btn btn-default" onclick="location.href='./list.jsp'">취소</button>
        
      </div>
    </div>
    
  </form>
  
</div>
  


</div>
</body>
</html>