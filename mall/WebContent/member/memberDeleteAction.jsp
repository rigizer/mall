<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>

<html>
	<body>
		<%
			if (session.getAttribute("loginMemberEmail") == null) { // 세션이 없는 경우
				%>
					<script>
						alert("로그인이 필요합니다.");
					</script>
				<%
				
				response.sendRedirect(request.getContextPath() + "/member/login.jsp");
				return;
			}
		%>
		
		<%
			//요청 인코딩 설정
			request.setCharacterEncoding("UTF-8");
			
			String loginEmail = session.getAttribute("loginMemberEmail").toString(); // 현재 로그인된 계정
			
			Member member = new Member();	// Member 데이터 타입을 생성
			member.setMemberEmail(loginEmail);
			
			MemberDao memberDao = new MemberDao();
			memberDao.updateMemberSubscription(member);
			
			session.invalidate();	// 세션 지우기
			
			%>
				<script>
					alert("탈퇴되었습니다");
					location.href="<%=request.getContextPath() %>/index.jsp";
				</script>
			<%
			//response.sendRedirect(request.getContextPath() + "/index.jsp"); // 페이지 이동
		%>
	</body>
</html>