<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="join.JoinDTO" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="join.JoinDAO"/>

<!-- 객체생성하는 것 대신 유즈 빈 사용 따라서 자동객체생성이 됨 -->

<% 
String root = request.getContextPath();
request.setCharacterEncoding("utf-8"); 

	List<JoinDTO> list = null;
	Iterator<JoinDTO> iter = null;
	boolean flag = false;
	String upDir = application.getRealPath("/join/storage");
	String tempDir = application.getRealPath("/join/temp");


%>  