<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
MemberVO userVO = (MemberVO) session.getAttribute("userVO");

EmailDAO emailDao = new EmailDAO();
emailDao.deleteBinAll(userVO);
%>
<script>
	alert('휴지통 비우기 완료')
	location.href = "bin.jsp"
</script>