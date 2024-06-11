<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@page import="kr.ac.kopo.email.vo.EmailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String sender = request.getParameter("sender");
String receiver = request.getParameter("receiver");
String title = request.getParameter("title");
String contents = request.getParameter("contents");

EmailVO email = new EmailVO(sender, receiver, title, contents);
EmailDAO emailDao = new EmailDAO();
emailDao.insertEmail(email);
%>

<script>
	alert('이메일 전송 완료')
	location.href = "sentMailbox.jsp"
</script>