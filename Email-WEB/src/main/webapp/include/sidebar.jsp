<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid">
	<div class="row justify-content-center">
		<button class="btn btn-dark fs-4" type="button"
			onclick="location.href='/Email-WEB/email/writeForm.jsp'">메일쓰기</button>
		<ul class="navbar-nav">
			<li class="nav-item nav justify-content-center mt-2 fs-5">
				<button class="btn btn-transparent mt-2 fs-5 fw-bolder"
					type="button"
					onclick="location.href='/Email-WEB/email/receivedMailbox.jsp'">받은메일함</button>
			</li>
			<li class="nav-item nav justify-content-center mt-2 fs-5">
				<button class="btn btn-transparent mt-2 fs-5 fw-bolder"
					type="button"
					onclick="location.href='/Email-WEB/email/sentMailbox.jsp'">보낸메일함</button>
			</li>
			<li class="nav-item nav justify-content-center mt-2 fs-5">
				<button class="btn btn-transparent mt-2 fs-5 fw-bolder"
					type="button" onclick="location.href='/Email-WEB/email/bin.jsp'">휴지통</button>
			</li>
			<li class="nav-item nav justify-content-center mt-2 fs-5">
				<button class="btn btn-transparent mt-2 fs-5 fw-bolder"
					type="button"
					onclick="location.href='/Email-WEB/member/mypage.jsp'">마이페이지</button>
			</li>
			<li class="nav-item nav justify-content-center mt-2 fs-5">
				<button class="btn btn-transparent mt-2 fs-5 fw-bolder"
					type="button"
					onclick="location.href='/Email-WEB/member/logout.jsp'">로그아웃</button>
			</li>
		</ul>
	</div>
</div>