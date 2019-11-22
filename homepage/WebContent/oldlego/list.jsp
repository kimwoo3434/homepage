<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ossi.jsp" %>
<%

/*  String col = "";
String word = "";

int nowPage = 1;
int recordPerPage = 3;

if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int sno = ((nowPage-1) * recordPerPage)+1;
int eno = nowPage * recordPerPage;

Map map = new HashMap();
map.put("sno", sno);
map.put("eno", eno); 
 */
int total = dao.total(); 
list = dao.list(); 



%>

<!DOCTYPE html>

<html>
<head>
  <title>이미지게시판</title>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <meta charset="utf-8">
  <script type="text/javascript">
<%--   $(function(){
	  $("#img1").mouseover(function(){
		  $("#images").attr("src", "<%=root %>/oldlego/storage/<%=dto.getFname() %>").attr("alt","<%=dto.getFname() %>").attr("style","max-width:100%; height:500px; align: center;");
	  })
	  $("#img2").mouseover(function(){
		  $("#images").attr("src", "<%=root %>/oldlego/storage/<%=dto.getFname() %>").attr("alt","<%=dto.getFname() %>").attr("style","max-width:100%; height:500px; align: center;");
	  })
  })
   --%>
  
  
  function read(id){
	  var url = "read.jsp";
	  url += "?id="+id;
	   
	  location.href = url;
  }
  
 
  
  </script>
  
 
  

  
</head>

<body>

	
<jsp:include page = "/menu/top.jsp"/>
<div class="container">


   <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <!--  <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>  -->
    
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
	<% 
	for(int i=0; i<list.size(); i++){
	OldLegoDTO dto = list.get(i);
	if(i==0){
	%>
		
		
	
	<div class="item active">
	<script>
	
	  $("#img1").mouseover(function(){
		  $("#images").attr("src", "<%=root %>/oldlego/storage/<%=dto.getFname() %>").attr("alt","<%=dto.getFname() %>").attr("style","max-width:100%; height:500px; align: center;");
	  })
	
	</script>
	<a href="javascript:read('<%=dto.getId()%>')">
    	<img class="center-block" src="<%=root %>/oldlego/storage/<%=dto.getFname() %>" 
    	id="img1" alt="<%=dto.getFname() %>" style="max-width:100%; height:230px;">
    </a>
    
   </div>
   
  

  <%}else{ %>
  
	   
	 <div class="item">
	<script type="text/javascript">
	
		  $("#img2").mouseover(function(){
			  alert("<%=dto.getFname()%>");
			  $("#images").attr("src", "<%=root %>/oldlego/storage/<%=dto.getFname() %>").attr("alt","<%=dto.getFname() %>").attr("style","max-width:100%; height:500px; align: center;");
		  })
		
	
	</script>
	 <a href="javascript:read('<%=dto.getId()%>')">
        <img class="center-block" src="<%=root %>/oldlego/storage/<%=dto.getFname() %>" 
        id="img2" alt="<%=dto.getFname() %>" style="max-width:100%; height:230px;">
      </a>
        
      </div>
	<% }
	     			  
	}
	%>
    
    
      

    
    
      
    </div> 

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div><!-- max-width:100%; -->
  <div class="col-lg-2"></div>
  <div class="col-lg-8">
  	<img id="images" src="" alt="" style=""/>
  </div>
  <div class="col-lg-2"></div>
  

</div>
 
 

</body>
</html>