<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<script src="/Email-WEB/resources/js/myJS.js"></script>
<script>
	let checkForm = function() {
		let f = document.inputForm

		if (isNull(f.id, '아이디를 입력해주세요')) {
			return false
		}
		if (isNull(f.name, '이름을 입력해주세요')) {
			return false
		}
		if (isNull(f.email, '이메일을 입력해주세요')) {
			return false
		}
		return true
	}

	let doAction = function(type) {
		switch (type) {
		case 'L':
			location.href = "login.jsp"
			break
		}
	}
</script>
</head>
<body>
	<div align="center">
		<br>
		<p class="text-white bg-dark fs-1 py-4">ID 찾기</p>
		<br>
		<form name="inputForm" action="findId.jsp" method="post"
			onsubmit="return checkForm()">
			<table style="width: 30%" class="table me-5">
				<tr>
					<th width="30%">이름</th>
					<td><input class="form-control" type="text" name="username"
						size="40"></td>
				</tr>
				<tr>
					<th width="30%">이메일</th>
					<td><input class="form-control" type="email" name="email"
						size="40"></td>
				</tr>
			</table>
			<div class="ms-5">
				<button class="btn btn-dark col-1 fs-6 fw-bold" type="submit">아이디
					찾기</button>
				<button class="btn btn-light col-1 fs-6 fw-bold" type="button"
					onclick="doAction('L')">취 소</button>
			</div>
		</form>
	</div>
	<br>
	<div align="center">
		<p class="text-white bg-dark fs-1 py-4">PW 찾기</p>
		<br>
		<form name="inputForm" action="findPassword.jsp" method="post"
			onsubmit="return checkForm()">
			<table style="width: 30%" class="table me-5">
				<tr>
					<th width="30%">아이디</th>
					<td><input class="form-control" type="text" name="userId"
						size="40"></td>
				</tr>
				<tr>
					<th width="30%">이름</th>
					<td><input class="form-control" type="text" name="username"
						size="40"></td>
				</tr>
				<tr>
					<th width="30%">이메일</th>
					<td><input class="form-control" type="email" name="email"
						size="40"></td>
				</tr>
			</table>
			<div class="ms-5">
				<button class="btn btn-dark col-1 fs-6 fw-bold" type="submit">비밀번호
					찾기</button>
				<button class="btn btn-light col-1 fs-6 fw-bold" type="button"
					onclick="doAction('L')">취 소</button>
			</div>
		</form>
	</div>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>