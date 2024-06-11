<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script>
	let doAction = function(type) {
		switch (type) {
		case 'P':
			location.href = "changePassword.jsp"
			break
		case 'W':
			if (confirm('정말 탈퇴하시겠습니까?'))
				location.href = "withdraw.jsp"
			break
		}
	}
</script>
</head>
<body class="d-flex flex-column h-100">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<jsp:include page="/include/topMenu.jsp"></jsp:include>
	</nav>
	<div class="container-fluid">
		<nav class="col-sm-3 sidenav">
			<jsp:include page="/include/sidebar.jsp"></jsp:include>
		</nav>
		<section class="col-sm-9 page">
			<div align="center">
				<p align="left" class="fw-bold fs-1">마이페이지</p>
				<table style="width: 100%" border="1">
					<tr>
						<th style="text-align: center;" width="25%">아이디</th>
						<td>${ userVO.userId }</td>
					</tr>
					<tr>
						<th style="text-align: center;" width="25%">이름</th>
						<td>${ userVO.username }</td>
					</tr>
					<tr>
						<th style="text-align: center;" width="25%">이메일</th>
						<td>${ userVO.email }</td>
					</tr>
				</table>
				<button class="btn btn-secondary col-2 fs-6 fw-bold mt-3" onclick="doAction('P')">비밀번호 변경</button>
				<button class="btn btn-secondary col-2 fs-6 fw-bold mt-3" onclick="doAction('W')">회원탈퇴</button>
			</div>
		</section>
	</div>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>