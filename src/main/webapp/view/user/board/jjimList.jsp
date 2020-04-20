<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>리스트입니다</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/list.css" />
</head>

<body>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>




	<!-- 카테고리창 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<!-- Category -->
				<div class="single category">
					<h3 class="side-title">관심목록</h3>
				</div>
			</div>
			<div class="col-sm-9 ">
				<c:if test="${empty list}">
						관심가지는 게시글이 없습니다.
					</c:if>



				<!-- 게시글이 없습니다추가해주기 -->
				<div style="float: left;">
					<div class="row" float="left">
						<!-- 리스트뿌려주는곳 -->

						<c:if test="${!empty list}">
							<c:forEach items="${list}" var="list">
								<div class="col-md-4 col-sm-6">
									<div class="product-grid8">
										<div class="product-image8">
											<%-- <a href="${pageContext.request.contextPath}/board/content?num=${list.boardnum}"> 
										<img class="pic-1" src="${pageContext.request.contextPath}/uploadFile/${list.filename}">
									</a> --%>
											<a href="${pageContext.request.contextPath}/board/content?num=${list.boardnum}">
												<img class="pic-1" src="${pageContext.request.contextPath}/img/list/aa.png">
											</a>
										</div>
										<div class="product-content">
											<div class="price">${list.subject}</div>
											<span class="product-shipping">${list.price}원</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>


					</div>
				</div>
			</div>
		</div>
		<br> <br>

	</div>

</body>
</html>
