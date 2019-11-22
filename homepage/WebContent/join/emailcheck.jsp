<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="join.JoinDAO"/>
    <%
    String email = request.getParameter("email");
    boolean flag = dao.duplicateEmail(email);
    String str = "";
    if(flag){
    	str = email +" 중복입니다.";
    }else{
    	str = email +" 중복이 아닙니다.";
    }
    out.print(str);
    
    %>