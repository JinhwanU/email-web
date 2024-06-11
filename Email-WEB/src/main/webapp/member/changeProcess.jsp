<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
MemberVO userVO = (MemberVO) session.getAttribute("userVO");
String password = request.getParameter("password");

MemberVO member = new MemberVO(userVO.getUserId(), password);
MemberDAO memberDao = new MemberDAO();
memberDao.updatePassword(member);
%>
<script>
	alert('비밀번호 변경 완료')
	location.href = 'mypage.jsp'
</script>