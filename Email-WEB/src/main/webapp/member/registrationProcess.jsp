<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String userId = request.getParameter("userId");
String password = request.getParameter("password");
String username = request.getParameter("username");
String email = request.getParameter("email");

MemberVO member = new MemberVO(userId, password, username, email);

MemberDAO memberDao = new MemberDAO();
memberDao.insertMember(member);
%>
<script>
	alert('회원가입 완료')
	location.href = "login.jsp"
</script>