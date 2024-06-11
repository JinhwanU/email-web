<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");

String userId = request.getParameter("userId");
String username = request.getParameter("username");
String email = request.getParameter("email");

MemberVO member = new MemberVO(userId, username, email);
MemberDAO memberDao = new MemberDAO();
pageContext.setAttribute("member", memberDao.updateTempPassword(member));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<script src="/Email-WEB/resources/js/myJS.js"></script>
<script>
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
	<header>
		<%-- <jsp:include page="/include/topMenu.jsp"></jsp:include> --%>
	</header>
	<section>
		<div class="row">
			<div align="center">
				<br> <br> <br> <br>
				<p class="text-white bg-dark fs-1 py-5">비밀번호 찾기</p>
				<br> <br>
				<div class="col-5">
					<c:if test="${ member.password == null }">
						<h2>일치하는 정보가 없습니다</h2>
					</c:if>
					<c:if test="${ member.password != null }">
						<h2>임시 비밀번호 : ${ member.password }</h2>
					</c:if>

					<button class="btn btn-dark col-3 fs-6 mt-5 fw-bold"
						onclick="doAction('L')">로그인 창으로</button>
				</div>
			</div>
		</div>
	</section>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>


</html>