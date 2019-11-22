<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String root = request.getContextPath(); 
 String id = (String)session.getAttribute("id");
 String grade = (String)session.getAttribute("grade");
 String str = "";
 
 if(id != null && !grade.equals("A")){
	 str="안녕하세요 "+id+"님";
 }else if(id != null && grade.equals("A")){
	 str="관리자 페이지입니다.";
 }else{
	 str="처음오셨군요 환영합니다.";
 }
 
 %>
<!DOCTYPE html>

<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=root %>/js/ajaxError.js"></script>
</head>

<body>


  <img class="img-responsive" src="<%=root %>/menu/images/레고1.jpg" alt="Lights" width="35%" > 
	
	<p3><%=str %></p3>	
		

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=root %>/index.jsp">레고랜드</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">공지사항 <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <%if(id != null && !grade.equals("A")){ %>
          <li><a href="<%=root%>/notice/list.jsp">공지사항 목록</a></li>
          <%}else if(id != null && grade.equals("A")){ %>
           <li><a href="<%=root%>/notice/list.jsp">공지사항 목록</a></li>
            <li><a href="<%=root%>/notice/createForm.jsp">공지사항 등록</a></li>
          <%}else{ %>
          	<li><a href="<%=root%>/notice/list.jsp">공지사항 목록</a></li>
          <%} %>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">방명록 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=root%>/guest/list.jsp">방명록 목록</a></li>
			<li><a href="<%=root%>/guest/createForm.jsp">방명록 생성</a></li>
        </ul>
      </li>
      
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">사진 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<%=root%>/oldlego/list.jsp">이미지 목록</a></li>
          <li><a href="<%=root%>/oldlego/createForm.jsp">이미지 등록</a></li>
                  
        </ul>
      </li>
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원 <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <%if(id==null){ %>
           <li><a href="<%=root%>/join/agreement.jsp">회원가입</a></li>
           <li><a href="<%=root%>/join/loginForm.jsp">로그인</a></li>
           <%}else if(id != null && !grade.equals("A")){ %>
           
           <li><a href="<%=root%>/join/read.jsp">내정보</a></li>
           <li><a href="<%=root%>/join/logout.jsp">로그아웃</a></li>
           
			<%} %>
			
			<%if(id != null && grade.equals("A")){ %>
              <li><a href="<%=root%>/admin/list.jsp">회원목록</a></li> 
              <li><a href="<%=root%>/join/logout.jsp">로그아웃</a></li>
              
             <%} %>  
             
        </ul>
      </li>
      
    </ul>
    
	
  </div>
</nav>
  
</body>
</html>