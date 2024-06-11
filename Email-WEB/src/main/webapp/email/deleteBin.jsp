<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int no = Integer.parseInt(request.getParameter("no"));
EmailDAO emailDao = new EmailDAO();
emailDao.deleteBinByNo(no);
%>
<script>
	alert('이메일 영구삭제 완료')
	location.href = "bin.jsp"
</script>