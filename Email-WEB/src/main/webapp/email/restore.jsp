<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@page import="kr.ac.kopo.email.vo.EmailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int no = Integer.parseInt(request.getParameter("no"));
MemberVO userVO = (MemberVO) session.getAttribute("userVO");

EmailDAO emailDao = new EmailDAO();
EmailVO email = emailDao.selectBinByNo(no);
email.setUserId(userVO.getUserId());
emailDao.restoreEmail(email);
emailDao.deleteBinByNo(no);
%>
<script>
	alert('복구 완료')
	location.href = "bin.jsp"
</script>