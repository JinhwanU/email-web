<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script src="/Email-WEB/resources/js/myJS.js"></script>
<script>
	let checkForm = function() {
		let f = document.changeForm

		if (isNull(f.password, "패스워드를 입력하세요"))
			return false

		if (isNull(f.passwordCheck, '비밀번호 확인이 필요합니다')) {
			return false
		}

		if (isNotEqual(f.password, f.passwordCheck, '비밀번호가 일치하지 않습니다')) {
			return false
		}
		return true
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
				<p align="left" class="fw-bold fs-1">비밀번호 변경</p>
				<form action="changeProcess.jsp" method="post" name="changeForm"
					onsubmit="return checkForm()">
					<table style="text-align:center; width: 60%">
						<tr>
							<th>변경할 비밀번호</th>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="passwordCheck"></td>
						</tr>
					</table>
					<div align="center">
						<button class="btn btn-secondary col-2 fs-6 fw-bold mt-3">변경하기</button>
					</div>
				</form>
			</div>
		</section>
	</div>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>

</body>
</html>