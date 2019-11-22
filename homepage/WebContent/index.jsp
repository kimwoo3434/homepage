<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
 <%String root = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본페이지</title>
</head> 
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>

<div class="container"> 

  <div class="thumbnail">
        <a href="<%=root %>/menu/images/레고1.jpg" target="_blank">
          <img src="<%=root %>/menu/images/레고1.jpg" style="width:50%">
          <div class="caption">
          <h2><p>레고랜드에 온 것을 환영합니다.안녕</p><h2>	
          </div>
        </a>
      </div>

 <div class="row">
  <div class="col-sm-4">
  <h3>Column 1</h3>
      <iframe width="400" height="300"
		src="https://www.youtube.com/watch?v=aWy6isYQlR0">
	</iframe>
 
  </div>
  <div class="col-sm-4">
      <h3>Column 2</h3>
     <iframe width="420" height="315"
		src="https://www.youtube.com/embed/tgbNymZ7vqY">
	</iframe>
    </div>
     <div class="col-sm-4">
      <h3>Column 3</h3>        
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit...</p>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris...</p>
    </div>

 </div>


</div>
</body>
</html>