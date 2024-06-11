<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
MemberVO userVO = (MemberVO) session.getAttribute("userVO");

MemberDAO memberDao = new MemberDAO();
memberDao.deleteMember(userVO);
%>
<script>
	alert('회원탈퇴 완료')
	location.href = "login.jsp"
</script>