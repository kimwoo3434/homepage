<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ossi.jsp" %>

<% 
String id = request.getParameter("id"); 
OldLegoDTO dto = dao.read(id);
 
%>



<!DOCTYPE html>

<html>
<head>
  <title>삭제</title>
  <meta charset="utf-8">
  
  <style type="text/css">
  	#red{
  		color :Red;
  	}
  
  </style>
  
</head>

<body>
<jsp:include page = "/menu/top.jsp"/>
<div class="container">
  


  <h1 class="col-sm-offset-2 col-sm-10">삭제</h1>
  <form class="form-horizontal"  
  	action="./deleteProc.jsp"
  	method="post">
    
   <input type="hidden" name="id" value="<%=id %>">
   <input type="hidden" name="oldimage" value="<%=dto.getFname()%>">
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="passwd">비밀번호</label>
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd">
      </div>
    </div>
    
    <p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구 할 수 없습니다.</p>
    
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
      
        <button type="submit" class="btn btn-default">삭제</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>
  </form>
  
</div>
  


</div>
</body>
</html>