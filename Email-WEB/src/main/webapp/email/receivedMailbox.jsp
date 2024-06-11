<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.email.dao.EmailDAO"%>
<%@page import="kr.ac.kopo.email.vo.EmailVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");

MemberVO userVO = (MemberVO) session.getAttribute("userVO");

EmailDAO emailDao = new EmailDAO();
List<EmailVO> emailList = emailDao.selectReceivedEmailList(userVO);

//공유영역에 등록
pageContext.setAttribute("emailList", emailList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Email-WEB/resources/css/styles.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/layout.css">
<link rel="stylesheet" href="/Email-WEB/resources/css/table.css">
<script>
	let goDetail = function(emailNo) {
		<c:if test="${ not empty userVO }">
		location.href = 'detail.jsp?no=' + emailNo
		</c:if>
		<c:if test="${ empty userVO }">
		if (confirm('로그인 후 사용가능합니다\n로그인페이지로 이동하시겠습니까?'))
			location.href = '/Email-WEB/member/login.jsp'
		</c:if>
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
				<p align="left" class="fw-bold fs-1">받은메일함</p>
				<table border="1" style="width: 100%; text-align: center;" class="listodd">
					<tr>
						<th width="20%">보낸이</th>
						<th width="50%">제목</th>
						<th width="30%">받은시간</th>
					</tr>
					<c:forEach var="email" items="${ emailList }">
						<tr>
							<td>${ email.sender }</td>
							<td align="left"><a href="javascript:goDetail(${ email.no })"> <c:out
										value="${ email.title }" />
							</a></td>
							<td align="center">${ email.createdAt }</td>
						</tr>
					</c:forEach>
				</table>
				<br>
			</div>
		</section>
	</div>
	<footer class="container-fluid fixed-bottom">
		<%@ include file="/include/footer.jsp"%>
	</footer>
</body>
</html>