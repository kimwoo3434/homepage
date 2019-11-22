<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="guest.GuestDTO" %>
<%@ page import="utility.Utility" %>
<jsp:useBean id="dao" class="guest.GuestDAO"/>

<!-- 객체생성하는 것 대신 유즈 빈 사용 따라서 자동객체생성이 됨 -->

<% 
String root = request.getContextPath();
request.setCharacterEncoding("utf-8"); 

	List<GuestDTO> list = null;
	Iterator<GuestDTO> iter = null;
	boolean flag = false;



%>  