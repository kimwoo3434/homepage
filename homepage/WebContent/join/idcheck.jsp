<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="join.JoinDAO"/>
    <%
    String id = request.getParameter("id");
    boolean flag = dao.passid(id);
    String str = "";
    if(flag){
    	str = id +" 중복입니다.";
    }else{
    	str = id +" 중복이 아닙니다.";
    }
    out.print(str);
    
    %>
