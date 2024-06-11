<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	<c:if test="${ userVO.userId == null }">
	location.href = "/Email-WEB/member/login.jsp"
	</c:if>
</script>
<div class="container px-5">
	<a class="navbar-brand" href="/Email-WEB/email/receivedMailbox.jsp""><img
		alt="LOGO" src="/Email-WEB/resources/images/logo.jpg" width="100" /></a>
	<p class="navbar-brand">JH'S Email Service</p>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
		data-bs-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
		<span class="navbar-text align-right">[${ userVO.username }(${ userVO.userId })
			님 로그인중] </span>
	</div>
</div>


<%-- <table style="width: 100%">
	<tr>
		<td rowspan="2"><a href="/Email-WEB/email/receivedMailbox.jsp">
				<div style="height: 45px; width: 200px; text-align: center;">
					<img alt="LOGO" src="/Email-WEB/resources/images/logo.jpg"
						height=100% />
				</div>
		</a></td>
		<td><a class="navbar-brand" href="index.html">JH's Email Service</a>
		</td>
		<td align="right">[${ userVO.username }(${ userVO.userId }) 님
			로그인중...]</td>
	</tr>
	<tr>
		<td><a href="/Email-WEB/email/receivedMailbox.jsp">받은메일함</a> | <a
			href="/Email-WEB/email/sentMailbox.jsp">보낸메일함</a> | <a
			href="/Email-WEB/email/writeForm.jsp">메일쓰기</a> | <a
			href="/Email-WEB/email/bin.jsp">휴지통</a> | <a
			href="/Email-WEB/member/mypage.jsp">마이페이지</a> | <c:if
				test="${ not empty userVO }">
				<a href="/Email-WEB/member/logout.jsp">로그아웃</a>
			</c:if></td>
	</tr>
</table> --%>
