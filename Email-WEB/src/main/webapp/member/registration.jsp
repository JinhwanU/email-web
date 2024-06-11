<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<script src="/Email-WEB/resources/js/myJS.js"></script>
<script>
	let checkForm = function() {
		let f = document.inputForm

		if (isNull(f.id, '아이디를 입력해주세요')) {
			return false
		}
		if (isNull(f.password, '비밀번호를 입력해주세요')) {
			return false
		}
		if (isNull(f.passwordCheck, '비밀번호 확인이 필요합니다')) {
			return false
		}
		if (isNotEqual(f.password, f.passwordCheck, '비밀번호가 일치하지 않습니다')) {
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
	<header> </header>
	<section>
		<div align="center">
			<br> <br> <br> <br>
			<p class="text-white bg-dark fs-1 py-5">회원가입</p>
			<br> <br>
			<form name="inputForm" action="registrationProcess.jsp" method="post"
				onsubmit="return checkForm()">
				<table style="width: 30%" class="table me-5">
					<tr>
						<th width="30%">아이디</th>
						<td><input class="form-control" type="text" name="userId"
							size="40"></td>
					</tr>
					<tr>
						<th width="30%">비밀번호</th>
						<td><input class="form-control" type="password"
							name="password" size="40"></td>
					</tr>
					<tr>
						<th width="30%">비밀번호 확인</th>
						<td><input class="form-control" type="password"
							name="passwordCheck" size="40"></td>
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
				<div class="mt-3 ms-5">
					<button type="submit" class="btn btn-dark col-1 fs-5 fw-bold">가입하기</button>
					<button type="button" onclick="doAction('L')"
						class="btn btn-light col-1 fs-5 fw-bold">취 소</button>
				</div>
			</form>
		</div>
	</section>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>