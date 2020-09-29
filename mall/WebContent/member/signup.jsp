<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("loginMemberEmail") != null) {	// 로그인 세션 체크
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join.jsp</title>

		<!-- Bootstrap Framework 사용 -->
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	</head>
	<body>
		<!-- 상단 메뉴 -->
		<div>
			<!-- headMenu 항목을 include한다 -->
			<jsp:include page="/inc/headMenu.jsp"></jsp:include>
		</div>
		
		<div style="margin-top: 35px;"></div>
		
		<div class="container">
			
			<table style="margin: auto; text-align: center;">
				<tr>
					<td><h3 style="margin: auto;">회원가입</h3></td>
				</tr>
			</table>
			
			<br>
			
			<form method="post" action="<%=request.getContextPath() %>/member/signupAction.jsp">
				<table width="40%" style="margin: auto; text-align: center;">
					<tr>
						<td>ID</td>
						<td>
							<input type="text" class="form-control" name="memberEmail">
						</td>
					</tr>
					<tr>
						<td>PW</td>
						<td>
							<input type="password" class="form-control" name="memberPw">
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
							<input type="text" class="form-control" name="memberName">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit" class="btn btn-primary btn-block">가입</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<div style="margin-top: 60px;"></div>
		
		<!-- 하단 메뉴 -->
		<div>
			<!-- tailMenu 항목을 include한다 -->
			<jsp:include page="/inc/tailMenu.jsp"></jsp:include>
		</div>
	</body>
</html>