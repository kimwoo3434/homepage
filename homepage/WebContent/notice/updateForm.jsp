<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/nssi.jsp" %>

<%
int no = Integer.parseInt(request.getParameter("no"));
NoticeDTO dto = dao.read(no);


%>


<!DOCTYPE html>

<html>
<head>
  <title>notice</title>
  <meta charset="utf-8">
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">공지사항 수정</h1>
  <form class="form-horizontal" 
  	action="./updateProc.jsp"
  	method="post">
  	
  	<input type="hidden" name="no" value="<%=no %>">
  	<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
  	<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
  	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
  	
    <%-- <div class="form-group">
      <label class="control-label col-sm-2" for="wname">작성자:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="wname" value="<%=dto.getWname() %>" name="wname">
      </div>
    </div> --%>
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="title" value="<%=dto.getTitle() %>" name="title">
      </div>
    </div>
     <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용:</label>
      <div class="col-sm-6">
      	<textarea rows="12" cols="6" id="content" name="content" class="form-control"><%=dto.getContent() %></textarea>        
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
        <button type="submit" class="btn btn-default">수정</button>
        <button type="reset" class="btn btn-default" onclick="location.href='./list.jsp'">취소</button>
        
      </div>
    </div>
    
  </form>
  
</div>
  


</div>
</body>
</html>