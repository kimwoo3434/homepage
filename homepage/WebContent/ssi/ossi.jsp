<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="oldlego.OldLegoDTO" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="oldlego.OldLegoDAO"/>

<!-- 객체생성하는 것 대신 유즈 빈 사용 따라서 자동객체생성이 됨 -->

<% 
String root = request.getContextPath();
request.setCharacterEncoding("utf-8"); 

	List<OldLegoDTO> list = null;
	Iterator<OldLegoDTO> iter = null;
	boolean flag = false;
	boolean pflag = false;
	
	String upDir = application.getRealPath("/oldlego/storage");
	String tempDir = application.getRealPath("/oldlego/temp");
	String str="";


%>  