<%@page import="java.net.URLEncoder"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String userId = request.getParameter("userId");
String password = request.getParameter("password");
String saveIdChk = request.getParameter("saveIdChk");

MemberVO loginVO = new MemberVO(userId, password);
MemberDAO memberDao = new MemberDAO();
MemberVO userVO = memberDao.login(loginVO);

String url = "";
String msg = "";

if (userVO == null) {
	//로그인 실패
	url = "login.jsp";
	msg = "아이디 또는 패스워드를 잘못입력하셨습니다";
} else {
	//로그인 성공

	//아이디저장 체크된 경우 쿠키에 아이디 저장
	if (saveIdChk != null) {
		String cName = URLEncoder.encode("saveId", "utf-8");
		String cValue = URLEncoder.encode(userId, "utf-8");
		Cookie cookie = new Cookie(cName, cValue);

		response.addCookie(cookie);

	} else { // 아이디저장 체크 안된 경우 쿠키에 null 저장
		response.addCookie(new Cookie("saveId", null));
	}
	session.setAttribute("userVO", userVO);
	url = "/Email-WEB/email/receivedMailbox.jsp";
	msg = userVO.getUsername() + "님 환영합니다";
}
pageContext.setAttribute("url", url);
pageContext.setAttribute("msg", msg);
%>

<script>
	alert('${ msg }')
	location.href = '${ url }'
</script>

