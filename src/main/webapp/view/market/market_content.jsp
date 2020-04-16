<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<link href="css/navbar-fixed-top.css" rel="stylesheet">
<script src="js/ie-emulation-modes-warning.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8991dcddbea1441d0e4099c7db39cef2&libraries=services,clusterer,drawing"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/marketcontent.css" />
</head>
<style>
</style>
<body>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						<div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden; margin-top: 20px; margin-bottom: 20px;"></div>
					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${article.subject }</h3>
						<div class="rating">
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description">${article.content}</p>
						<h4 class="price">
							주소<span>${article.address} ${article.detailaddress}</span>
						</h4>
						<p class="vote">
							<strong>날짜</strong> ${article.sdate} ~ ${article.edate }
						</p>
						<p class="vote">
							<strong>시간</strong> ${article.stime} ~ ${article.etime }
						</p>
						<div class="action">
							<button class="add-to-cart btn btn-default" type="button">delete</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-3">
				<div class="rating-block">
					<h4>Average user rating</h4>
					<h2 class="bold padding-bottom-7">
						4.3 <small>/ 5</small>
					</h2>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-warning btn-sm" aria-label="Left Align">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-grey btn-sm" aria-label="Left Align">
						<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</button>
				</div>
			</div>
			<div class="col-sm-3">
				<h4>Rating breakdown</h4>
				<div class="pull-left">
					<div class="pull-left" style="width: 35px; line-height: 1;">
						<div style="height: 9px; margin: 5px 0;">
							5 <span class="glyphicon glyphicon-star"></span>
						</div>
					</div>
					<div class="pull-left" style="width: 180px;">
						<div class="progress" style="height: 9px; margin: 8px 0;">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="5" style="width: 1000%">
								<span class="sr-only">80% Complete (danger)</span>
							</div>
						</div>
					</div>
					<div class="pull-right" style="margin-left: 10px;">1</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width: 35px; line-height: 1;">
						<div style="height: 9px; margin: 5px 0;">
							4 <span class="glyphicon glyphicon-star"></span>
						</div>
					</div>
					<div class="pull-left" style="width: 180px;">
						<div class="progress" style="height: 9px; margin: 8px 0;">
							<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="4" aria-valuemin="0" aria-valuemax="5" style="width: 80%">
								<span class="sr-only">80% Complete (danger)</span>
							</div>
						</div>
					</div>
					<div class="pull-right" style="margin-left: 10px;">1</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width: 35px; line-height: 1;">
						<div style="height: 9px; margin: 5px 0;">
							3 <span class="glyphicon glyphicon-star"></span>
						</div>
					</div>
					<div class="pull-left" style="width: 180px;">
						<div class="progress" style="height: 9px; margin: 8px 0;">
							<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="3" aria-valuemin="0" aria-valuemax="5" style="width: 60%">
								<span class="sr-only">80% Complete (danger)</span>
							</div>
						</div>
					</div>
					<div class="pull-right" style="margin-left: 10px;">0</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width: 35px; line-height: 1;">
						<div style="height: 9px; margin: 5px 0;">
							2 <span class="glyphicon glyphicon-star"></span>
						</div>
					</div>
					<div class="pull-left" style="width: 180px;">
						<div class="progress" style="height: 9px; margin: 8px 0;">
							<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="5" style="width: 40%">
								<span class="sr-only">80% Complete (danger)</span>
							</div>
						</div>
					</div>
					<div class="pull-right" style="margin-left: 10px;">0</div>
				</div>
				<div class="pull-left">
					<div class="pull-left" style="width: 35px; line-height: 1;">
						<div style="height: 9px; margin: 5px 0;">
							1 <span class="glyphicon glyphicon-star"></span>
						</div>
					</div>
					<div class="pull-left" style="width: 180px;">
						<div class="progress" style="height: 9px; margin: 8px 0;">
							<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5" style="width: 20%">
								<span class="sr-only">80% Complete (danger)</span>
							</div>
						</div>
					</div>
					<div class="pull-right" style="margin-left: 10px;">0</div>
				</div>
			</div>


			<div class="col-sm-6">
				<hr />
				<form class="star-input" method="post" action="${pageContext.request.contextPath}/market/market_cmtwrite?num=${num}">
				<input type="hidden" name = "cmt_writer" value="${userId}">
				<input type="hidden" name = "num" value="${num}">
					<div class="review-block">
						<div class="row">
							<div class="col-sm-9">
								<div class="review-block-rate">
									<span class="star-input"> 
									<span class="input"> 
									<input type="radio" name="cmt_star" id="p1" value="1"><label for="p1">1</label> 
									<input type="radio" name="cmt_star" id="p2" value="2"><label for="p2">2</label> 
									<input type="radio" name="cmt_star" id="p3" value="3"><label for="p3">3</label> 
									<input type="radio" name="cmt_star" id="p4" value="4"><label for="p4">4</label> 
									<input type="radio" name="cmt_star" id="p5" value="5"><label for="p5">5</label> 
									<input type="radio" name="cmt_star" id="p6" value="6"><label for="p6">6</label> 
									<input type="radio" name="cmt_star" id="p7" value="7"><label for="p7">7</label> 
									<input type="radio" name="cmt_star" id="p8" value="8"><label for="p8">8</label> 
									<input type="radio" name="cmt_star" id="p9" value="9"><label for="p9">9</label> 
									<input type="radio" name="cmt_star" id="p10" value="10"><label for="p10">10</label>
									</span> 
									<output for="star-input"><b>0</b>점</output>
									</span>
								</div>
								<div class="review-block-description">
								<c:if test="${userId == null}">
									<textarea name="cmt_content" cols="65" rows="7" readonly="readonly">로그인 후 이용가능한 서비스입니다.</textarea>
									</c:if>
									<c:if test="${userId != null}">
									<textarea name="cmt_content" cols="65" rows="7"></textarea>
									</c:if>
								</div>
								<c:if test="${userId != null}">
								<input type="submit" name="submit" value="등록">
								</c:if>
							</div>
						</div>
					</div>
				</form>
				<hr/>
				<c:forEach var="article" items="${li}">
					<div class="row">
						<div class="col-sm-3">
							<img src="http://dummyimage.com/60x60/666/ffffff&text=No+Image" class="img-rounded">
							<div class="review-block-name"><a href="#">${article.cmt_writer}</a></div>
							<div class="review-block-date">${article.cmt_regdate}</div>
						</div>
						<div class="col-sm-9">
							<div class="review-block-rate">
								<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							</div>
							<div class="review-block-description">${article.cmt_content}</div>
						</div>
					</div>
					</c:forEach>
			</div>
		</div>
		<!-- /container -->


		<!-- Bootstrap core JavaScript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script>
			window.jQuery
					|| document
							.write('<script src="assets/js/vendor/jquery.min.js"><\/script>')
		</script>
		<script src="js/bootstrap.min.js"></script>
		<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<script src="js/ie10-viewport-bug-workaround.js"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${article.address}',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
		</script>
</body>
<script>
var starRating = function(){
	  var $star = $(".star-input"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".star-input>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".star-input>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".star-input :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".star-input label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".star-input>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	starRating();
</script>
</html>