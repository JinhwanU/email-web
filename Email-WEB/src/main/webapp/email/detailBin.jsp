<%@page import="kr.ac.kopo.email.vo.EmailVO"%>
<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int no = Integer.parseInt(request.getParameter("no"));

EmailDAO emailDao = new EmailDAO();
EmailVO email = emailDao.selectBinByNo(no);
pageContext.setAttribute("email", email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script>
	let doAction = function(type){
		switch(type){
		case 'R':
			location.href = "restore.jsp?no="+${ email.no }
			break
		case 'D':
			if(confirm("이메일을 삭제하시겠습니까?"))
				location.href = "deleteBin.jsp?no="+${ email.no }
			break
		case 'L':
			location.href = "bin.jsp"
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
				<p align="left" class="fw-bold fs-1">상세보기</p>
				<div align="right">
					<button class="btn btn-secondary col-2 fs-6 fw-bold mb-3" onclick="doAction('R')">복구하기</button>
					<button class="btn btn-secondary col-2 fs-6 fw-bold mb-3" onclick="doAction('D')">영구삭제</button>
					<button class="btn btn-light col-2 fs-6 fw-bold mb-3" onclick="doAction('L')">목록으로</button>
				</div>
				<table style="width: 100%" border="1">
					<tr>
						<th width="25%">보낸이</th>
						<td>${ email.sender }</td>
					</tr>
					<tr>
						<th width="25%">받는이</th>
						<td>${ email.receiver }</td>
					</tr>
					<tr>
						<th width="25%">받은시간</th>
						<td>${ email.createdAt }</td>
					</tr>
					<tr>
						<th width="25%">삭제된시간</th>
						<td>${ email.deletedAt }</td>
					</tr>
					<tr>
						<th width="25%">제목</th>
						<td>${ email.title }</td>
					</tr>
					<tr>
						<th width="25%">내용</th>
						<td>${ email.contents }</td>
					</tr>
				</table>
			</div>
		</section>
	</div>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>