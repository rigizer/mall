<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>

<%
	if (session.getAttribute("loginMemberEmail") == null) { // 세션이 유지되어 있는 경우
		%>
			<script>
				alert("로그인이 필요합니다.");
			</script>
		<%
		
		response.sendRedirect(request.getContextPath() + "/member/login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
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
		<%
			int productId = Integer.parseInt(request.getParameter("productId"));
			System.out.println("productId: " + productId);	// productId 디버깅
			
			Product product = new ProductDao().selectProductOne(productId); // 하나의 메소드만 호출할 때 사용
			System.out.println(product);
		%>
		
		<div>
			<!-- headMenu 항목을 include한다 -->
			<jsp:include page="/inc/headMenu.jsp"></jsp:include>
		</div>
		
		<div style="margin-top: 35px;"></div>
		
		<div class="container">
			<h3>상품 상세보기</h3>
			
			<br>
			
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<td>상품 이미지</td>
					<td>
						<img width="300px" height="300px" src="/mall-admin/image/<%=product.getProductPic() %>">
					</td>
				</tr>
				<tr>
					<td>상품 고유번호</td>
					<td><%=product.getProductId() %></td>
				</tr>
				<tr>
					<td>카테고리 번호</td>
					<td><%=product.getCategoryId() %></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><%=product.getProductName() %></td>
				</tr>
				<tr>
					<td>상품 가격</td>
					<td><%=product.getProductPrice() %></td>
				</tr>
				<tr>
					<td>상품 내용</td>
					<td><%=product.getProductContent() %></td>
				</tr>
				<tr>
					<td>품절/판매 여부</td>
					<td>
						<%
							if (product.getProductSoldout().equals("Y")) { // 품절시
								%><button type="button" class="btn btn-danger btn-sm">&nbsp;&nbsp;품절&nbsp;&nbsp;</button><%
							} else {	// 판매중
								%><button type="button" class="btn btn-success btn-sm">판매중</button><%
							}							
						%>
					</td>
				</tr>
				
				<form method="post" action="<%=request.getContextPath() %>/orders/addOrdersAction.jsp">
					<input type="hidden" name="productId" value="<%=product.getProductId() %>">
					<input type="hidden" name="productPrice" value="<%=product.getProductPrice() %>">
					
					
					<tr>
						<td>
							주문수량
						</td>
						<td>
							<select class="form-control" name="ordersAmount">
								<%
									for (int i = 1; i <= 10; i++) {
										%><option value="<%=i %>"><%=i %></option><%
									}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							배송지
						</td>
						<td>
							<input type="text" class="form-control" name="ordersAddr">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="btn btn-primary btn-block" type="submit">주문하기</button>
						</td>
					</tr>
				</form>
			</table>
		</div>
		
		<div style="margin-top: 60px;"></div>
		
		<!-- 하단 메뉴 -->
		<div>
			<!-- tailMenu 항목을 include한다 -->
			<jsp:include page="/inc/tailMenu.jsp"></jsp:include>
		</div>
	</body>
</html>