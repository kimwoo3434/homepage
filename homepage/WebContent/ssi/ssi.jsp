<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>
<%@ page import="memo.MemoDTO" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<jsp:useBean id="dto" class="memo.MemoDTO"/>

<!-- 객체생성하는 것 대신 유즈 빈 사용 따라서 자동객체생성이 됨 -->

<% 
 
request.setCharacterEncoding("utf-8"); 



List<MemoDTO> list = null;
Iterator<MemoDTO> iter = null;
boolean flag = false;



%>  

