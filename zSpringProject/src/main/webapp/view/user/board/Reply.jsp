<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Reply</title>
</head>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/categoryForm.css" />
<body>
	<br> <p> <br> <br> <p>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="single category">
					<h3 class="side-title">작성한 댓글 목록</h3>
				</div>
			</div>
			<div class="commentbox" style="width: 75%; class="col-sm-8">
				<div style="align: center;">
					<c:set var="sub" value=" " />
					<c:forEach var="li" items="${list}">
						<c:if test="${li.subject ne sub }">
							<a href="${pageContext.request.contextPath}/board/content?num=${li.boardnum}" style="text-decoration: none;">
								<h2>${li.subject }</h2>
								<h4>
									<strong>${li.userid}</strong>
								</h4>
							</a>
						</c:if>
						<br>
						<a href="${pageContext.request.contextPath}/board/content?num=${li.boardnum}" style="text-decoration: none;"> ${li.regdate}
							<p>${li.comments}</p>
						</a>
						<c:set var="sub" value="${li.subject }" />
						<hr>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>