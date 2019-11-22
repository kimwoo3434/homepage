<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
String jname = request.getParameter("jname");
String id = request.getParameter("id");

Map map = new HashMap();
map.put("jname", jname);
map.put("id", id);

String passwd = "";
String str = "";

passwd = dao.PWfind(map);   

if(passwd != null){
	
	flag = true;
	
	
}else{
	
	str="이름이나 아이디가 다릅니다.";
}


%>

<!DOCTYPE html>

<html>
<head>
  <title>비밀번호찾기</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function use(){
	  opener.frm.passwd.value='<%=passwd%>';
	  window.close();
	  
  }
  
  
  </script>
</head>

<body>

<div class="container">
<%
if(flag){

%>
  <h1 class="col-sm-offset-2 col-sm-10">아이디찾기</h1>
  찾은 비밀번호: <%=passwd %>입니다.
 
   <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" onclick='use()'>사용</button>
      </div>
    </div>
  <%}else{  
	  out.print(str);
  %> 
  
  
  <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" onclick="location.href='PWfindForm.jsp'">다시시도</button>
      </div>
    </div>
  
  <%} %>
 
    
 

  


</div>
</body>
</html>