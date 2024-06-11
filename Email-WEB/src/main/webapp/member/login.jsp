<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
Cookie[] cookies = request.getCookies();
StringBuilder sb = new StringBuilder();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		String cName = cookie.getName();
		String cValue = cookie.getValue();

		//decoding
		cName = URLDecoder.decode(cName, "utf-8");
		cValue = URLDecoder.decode(cValue, "utf-8");

		if (cName.equals("saveId")) {
	pageContext.setAttribute("saveId", cValue);
	break;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<script src="/Email-WEB/resources/js/myJS.js"></script>
<script>
	let checkForm = function() {
		let f = document.loginForm

		if (isNull(f.userId, "아이디를 입력하세요"))
			return false

		if (isNull(f.password, "패스워드를 입력하세요"))
			return false

		return true
	}

	let doAction = function(type) {
		switch (type) {
		case 'R':
			location.href = "registration.jsp"
			break
		case 'F':
			location.href = "find.jsp"
			break
		}
	}
</script>
</head>
<body>
	<header>
		<%-- <jsp:include page="/include/topMenu.jsp"></jsp:include> --%>
	</header>
	<section>
		<div class="row">
			<div align="center">
				<br>
				<br>
				<br>
				<br>
				<p class="text-white bg-dark fs-1 py-5">로그인</p>
				<br>
				<br>
				<div class="col-5">
					<form action="loginProcess.jsp" method="post" name="loginForm"
						onsubmit="return checkForm()">
						<div class="row g-3 align-items-center justify-content-center">
							<div class="col-2">
								<label for="inputId" class="col-form-label fw-bold"> ID
								</label>
							</div>
							<div class="col-auto">
								<input id="inputId" class="form-control" type="text"
									name="userId" value="${ saveId }">
							</div>
							<span id="saveId" class="m-0"> <c:choose>
									<c:when test="${ saveId.length() > 0 }">
										<input class="form-check-input" type="checkbox"
											name="saveIdChk" checked>
									</c:when>
									<c:otherwise>
										<input class="form-check-input" type="checkbox"
											name="saveIdChk">
									</c:otherwise>
								</c:choose> 아이디저장
							</span>
						</div>
						<div class="row g-3 align-items-center justify-content-center">
							<div class="col-2">
								<label for="inputPassword" class="col-form-label fw-bold">PASSWORD</label>
							</div>
							<div class="col-auto">
								<input id="inputPassword" class="form-control" type="password"
									name="password">
							</div>
						</div>
						<div align="center">
							<button class="btn btn-dark col-6 fs-5 mt-3 fw-bold">로그인</button>
						</div>
					</form>

					<div class="container">
						<button class="btn btn-light col-3 fs-6 fw-bold"
							onclick="doAction('R')">회원가입</button>
						<button class="btn btn-light col-3 fs-6 fw-bold"
							onclick="doAction('F')">ID/PW 찾기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>

</body>
</html>