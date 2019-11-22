<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="bbs.BbsDTO" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/> 

<!-- 객체생성하는 것 대신 유즈 빈 사용 따라서 자동객체생성이 됨 -->

<% 
 
request.setCharacterEncoding("utf-8"); 

	List<BbsDTO> list = null;
	Iterator<BbsDTO> iter = null;
	boolean flag = false;



%> 
 
