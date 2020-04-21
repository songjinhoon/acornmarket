<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Reply</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/content.css" />

<body>
	<h3>MyReply</h3>


	<div class="commentbox">
		<c:set var="before" value="" />
		<c:forEach var="li" items="${list}" varStatus="status">
			<div style="align: center;">
				<div style="width: 80%;">
					<c:if test="${status.index == 0 }">
						<c:set var="before" value="${li.boardnum}" />
					</c:if>
					
					<c:if test="${li.boardnum == before}">
						<div style="border: 4px dotted skyblue;">
							<h4>
								<strong>${li.userid}</strong>
							</h4>
							${li.regdate}
							<p>${li.comments}</p>
						
							</div>
					</c:if>
				
					
					<c:if test="${li.boardnum != before}">
					<div style="border: 4px dotted green;">
						<div id="inn">
							<h4>
								<strong>${li.userid}</strong>
							</h4>
							${li.regdate}
							<p>${li.comments}</p>
						</div>
						<hr>
					</div>
					</c:if>
					<c:if test="${status.index != 0 }">

						<c:set var="before" value="${li.boardnum}" />
					</c:if>

				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>