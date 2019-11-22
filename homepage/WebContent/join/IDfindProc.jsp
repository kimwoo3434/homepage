<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>
<%
String jname = request.getParameter("jname");
String email = request.getParameter("email");

Map map = new HashMap();
map.put("jname", jname);
map.put("email", email);

String id = "";
String str = "";

id= dao.IDfind(map);  

if(id != null){
	
	flag = true;
	
	
}else{
	
	str="이름이나 이메일이 다릅니다.";
}


%>

<!DOCTYPE html>

<html>
<head>
  <title>아이디찾기</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function use(){
	  opener.frm.id.value='<%=id%>';
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
  <div class="well well-lg">
  찾은 아이디: <%=id %>입니다.
 
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
        <button type="button" class="btn btn-default" onclick="location.href='IDfindForm.jsp'">다시시도</button>
      </div>
    </div>
  
  <%} %>
 
    
 

  
</div>

</div>
</body>
</html>