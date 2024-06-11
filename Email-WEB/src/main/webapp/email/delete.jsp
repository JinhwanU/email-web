<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//MemberVO userVO = (MemberVO) session.getAttribute("userVO");

int no = Integer.parseInt(request.getParameter("no"));
EmailDAO emailDao = new EmailDAO();
emailDao.deleteByNo(no);
%>
<script>
	alert('이메일 삭제 완료')
	location.href = "bin.jsp"
</script>