<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/jssi.jsp" %>


<!DOCTYPE html>

<html>
<head>
  <title>비밀번호 찾기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=root %>/js/ajaxError.js"></script> 
  <script type="text/javascript">
  function PWfind(){
	  var url = "PWfindProc.jsp";
	  param ="id=" +document.frm.id.value;
	  param +="&jname=" +document.frm.jname.value;
	  
	  $.get(url, param, function(data, textStatus) {
		  $("#emailcheck").text("");
			$("#emailcheck").append(data);
		  
		})
  }
  
  </script>
</head>

<body>

<div class="container">

  <h1 class="col-sm-offset-2 col-sm-10">비밀번호 찾기</h1>
  <form class="form-horizontal" 
  	action="PWfindProc.jsp"
  	method="post"
  	name="frm">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">ID:</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="id" placeholder="Enter id" name="id"  value="dog"
        required="required">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="jname">이름:</label>
      <div class="col-sm-6">          
        <input type="text" class="form-control" id="jname" placeholder="Enter jname" name="jname" value="개"
        required="required">
      </div>
    </div>
   
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-8">
        <button type="button" class="btn btn-default" onclick="PWfind()">비밀번호찾기</button>
        <button type="reset" class="btn btn-default">취소</button>
      </div>
    </div>
    <div id=emailcheck></div>
  </form>
</div>
  



</body>
</html>