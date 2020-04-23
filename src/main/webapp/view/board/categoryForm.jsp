<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>카테고리폼</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!-- 검색창  -->
<!-- <script type="text/javascript">
function search() {
	
	})
}
</script>
 -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/categoryForm.css" />
</head>

<body>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

	<!-- 검색창 -->
	<nav class="nav1">
		<div class="container">
			<div class="right">
				<form class="form-inline" action="search();">
					<input class="form-control mr-sm-2" id="search_subject" type="text"
						placeholder="도토리 찾기">
					<button class="btn btn-outline-warning" type="submit"
						style="height: 40px;" onclick="search();">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
	</nav>
	<br>

	<!-- 카테고리창 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<!-- Category -->
				<div class="single category">
					<h3 class="side-title">카테고리</h3>
					<ul class="list-unstyled">
						<li><a
							href="${pageContext.request.contextPath}/board/categoryForm?category=디지털/가전"
							title="">디지털/가전</a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=가구/인테리어" title="">가구/인테리어</a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=여성패션/잡화" title="">여성패션/잡화 </a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=남성패션/잡화" title="">남성패션/잡화 </a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=뷰티/미용" title="">뷰티/미용</a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=반려동물용품" title="">반려동물용품</a></li>
						<li><a href="${pageContext.request.contextPath}/board/categoryForm?category=기타중고물품" title="">기타중고물품</a></li>
					</ul>
				</div>
			</div>

			<!-- 리스트  -->

			<div class="col-sm-8">

				<div class="container">
					<div class="row">
						<div class="well well2">
							
							
						 <c:if test="${userid ne null}">
							<div class="writebutton">
							<input type="submit" 
								onclick="location.href='${pageContext.request.contextPath}/board/write'"
								value="글쓰기">
								</div>
						 </c:if> 
						
							<c:if test="${userid eq null }">
							<div class="writebutton">
							<input type="submit" 
								onclick="location.href='${pageContext.request.contextPath}/user/selectJoinForm'"
								value="글쓰기">
								</div>
							
							</c:if>	  				
							
							<p></p>

							
							<c:if test="${empty li}">
								게시물이 없습니다.
							</c:if>
							
							

							<div class="list-group">
							<c:if test="${!empty li}">
								<c:forEach items="${li}" var="list">
									<a href="#" class="list-group-item">
										<div class="media col-md-3">
											<figure class="pull-left">
												<img class="media-object img-rounded img-responsive round"
													src="${pageContext.request.contextPath}/uploadFile/${list.filename}"  alt=""></figure>
													
										</div>

										<div class="col-md-6">
											<!-- 반복문으로 돌린다 -->

											<table>
												<tr>
													<td> ${list.subject}</td>
												</tr>
												</table>

												<p class="list-group-item-text">${list.price} 원</p>
										</div>
										
								
										
										<div class="col-md-3 text-center">
										
										<c:if test="${list.likecheck == -1 || list.likecheck == 0 }">
										<img src='${pageContext.request.contextPath}/img/list/dislike.png' onclick="like(${list.boardnum},'${list.userid}');" id='${list.boardnum}like_img' style="width: 21%; height: 5%;">
										</c:if>
										
										<c:if test="${list.likecheck == 1}">
										<img src='${pageContext.request.contextPath}/img/list/like.png' onclick="like(${list.boardnum},'${list.userid}');" id='${list.boardnum}like_img' style="width: 21%; height: 5%;">
										</c:if>
								
										
										<c:if test="${list.soldout == 0}">
											<button type="button" class="btn btn-info btn-md btn-block blue" 
											onclick="location.href='${pageContext.request.contextPath}/board/content?num=${list.boardnum}'">판매중</button>
										</c:if>
										
										<c:if test="${list.soldout != 0}">
											<button type="button" class="btn btn-danger btn-md btn-block blue" 
											onclick="location.href='${pageContext.request.contextPath}/board/content?num=${list.boardnum}'">판매완료</button>
										</c:if>
										</div>
										
									</a>
								</c:forEach>
									</c:if>
							</div>
						</div>
					</div>
					<!-- </form> -->
				</div>
			</div>

		</div>
	</div>
		
	<!-- 좋아요 -->
	<script>
	function like(boardnum, userid){

			var action = "${pageContext.request.contextPath}/board/like";
			var data = {boardnum: boardnum, userid : userid};
		
		  $.ajax({
		    type: "GET",
		    url: action,
		    cache: false,
		    dataType: "json",
		    data: data,
		    success: function(data) {
		      
		      var like_img = '';
		      
		      if(data.likecheck == 1) { //좋아요 누름
		        like_img = '${pageContext.request.contextPath}/img/list/like.png';
		      } else {
		    	like_img = '${pageContext.request.contextPath}/img/list/dislike.png';
		    	
		      }      
				console.log("like_img::"+like_img);
				$('#'+boardnum+'like_img').attr('src', like_img);
			
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });
		}
	  </script> 
</body>
</html>