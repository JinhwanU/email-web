<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일작성</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script src="/Email-WEB/resources/js/myJS.js"></script>
<script>
	let checkForm = function() {
		let f = document.inputForm
		if (isNull(f.title, '제목을 입력해주세요')) {
			return false
		}
		if (isNull(f.receiver, '받는이를 입력해주세요')) {
			return false
		}
		if (isNull(f.contents, '내용을 입력해주세요')) {
			return false
		}
		if (checkReceiver(f.sender, f.receiver)) {
			return false
		}

		return true
	}

	let checkReceiver = function(sender, receiver) {
		if (sender.value == receiver.value) {
			alert('자기 자신에게 보낼수없습니다')
			receiver.focus()
			return true
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
				<p align="left" class="fw-bold fs-1">메일쓰기</p>
				<form name="inputForm" action="write.jsp" method="post"
					onsubmit="return checkForm()">
					<input type="hidden" name="sender" value="${ userVO.userId }">
					<table style="width: 100%">
						<tr>
							<th style="text-align: center;" width="20%">보낸이</th>
							<td><c:out value="${ userVO.userId }"></c:out></td>
						</tr>
						<tr>
							<th style="text-align: center;" width="20%">받는이</th>
							<td><input type="text" name="receiver" size="60"></td>
						</tr>
						<tr>
							<th style="text-align: center;" width="20%">제목</th>
							<td><input type="text" name="title" size="60"></td>
						</tr>
						<tr>
							<th style="text-align: center;" width="20%">내용</th>
							<td><textarea rows="7" cols="60" name="contents"></textarea></td>
						</tr>
					</table>
					<button class="btn btn-secondary col-2 fs-6 fw-bold mt-3" type="submit">보내기</button>
				</form>
			</div>
		</section>
	</div>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>