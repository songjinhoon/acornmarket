<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/marketMain.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-sm bg-light navbar-light"> <!-- Brand/logo --> <!-- Links -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#"></a></li>
		</ul>
		<form id="custom-search-form" class="form-search form-horizontal pull-right" style="margin-left: 60%;">
			<input type="text" class="search-query" placeholder="Search">
			<button type="submit" class="btn">
				<i class="icon-search"></i>
			</button>
		</form>
		<input type="button" class="btn btn-primary" value="글쓰기" onclick="window.open('${pageContext.request.contextPath}/market/market_write', 'write', 'top=300px, left=600px,width=1000px, height=600px,'); return false"> </nav>

		<c:forEach var="article" items="${li}">
			<div class="col-sm-12">
				<div class="bs-calltoaction bs-calltoaction-default">
					<div class="row">
						<div class="col-md-9 cta-contents">
							<h1 class="cta-title">${article.subject }</h1>
							<div class="cta-desc">
								<p>[지역] ${article.region}</p>
								<p>[기간] ${article.sdate} ~ ${article.edate}</p>
								<p>[시간] ${article.stime} ~ ${article.etime}</p>
								<c:if test="${article.category eq 'sell'}">
									<p>
										판매 ( <label id="result" />
									</p>
								</c:if>
								<c:if test="${article.category eq 'share'}">
									<p>
										나눔 ( <label id="result" />
									</p>
								</c:if>
							</div>
						</div>
						<div class="col-md-3 cta-button">
							<a href="${pageContext.request.contextPath}/market/market_content?num=${article.num}" class="btn btn-lg btn-block btn-default">자세히보기</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</body>
<script>
	function to_date(date_str) {
		var yyyyMMdd = String(date_str);
		var sYear = yyyyMMdd.substring(0, 4);
		var sMonth = yyyyMMdd.substring(5, 7);
		var sDate = yyyyMMdd.substring(8, 10);

		//alert("sYear :"+sYear +"   sMonth :"+sMonth + "   sDate :"+sDate);
		return new Date(Number(sYear), Number(sMonth) - 1, Number(sDate));
	}
	//strikerhan.tistory.com/22 [KS Princess and MH Prince 's House]
	
	var today = new Date();
	
	if (today >= to_date(li.sdate) || today <= to_date(li.edate)) {
		var message = '진행중';
	}

	var resultDiv = document.getElementById('result');
	resultDiv.innerHTML = message;
</script>
</html>