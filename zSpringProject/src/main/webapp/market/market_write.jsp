<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8991dcddbea1441d0e4099c7db39cef2&libraries=services,clusterer,drawing"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<style>
.container {
	display: grid;
	grid-template-columns: 200px 200px 200px 200px;
	grid-template-rows: 50px 50px 50px;
	grid-template-columns: repeat(auto-fill, minmax(15%, auto));
	gap: 10px 20px;
	/* row-gap: 10px; column-gap: 20px; */
}

.container:before {
	content: none;
}

.item:nth-child(1) {
	grid-column: 1/6;
}

.item:nth-child(3) {
	grid-column: 2/4;
}

.item:nth-child(9) {
	grid-column: 4/6;
}

.item:nth-child(13) {
	grid-column: 1/4;
}

.item:nth-child(14) {
	grid-column: 1/4;
}

.item:nth-child(15) {
	grid-column: 1/4;
}

.item:nth-child(16) {
	grid-column: 1/1;
}
</style>
<body>
	<form name="writeform" id="form" role="form" method="post">
		<input type="hidden" name="readCount" value="0">
		<div class="container">

			<div class="item">
				<H3 style="FONT-SIZE: 18px; BORDER-BOTTOM: #D29953 1px solid; PADDING-BOTTOM: 1px; PADDING-TOP: 0px; PADDING-LEFT: 10px; MARGIN: 10px 0px 5px; BORDER-LEFT: #D29953 5px solid; LETTER-SPACING: -0.07em; LINE-HEIGHT: 30px; PADDING-RIGHT: 10px">
					<i style='font-size: 24px' class='far'>&#xf02e;</i>&nbsp&nbsp&nbsp마켓 등록
				</H3>
			</div>

			<div class="item">
				<label for="category">분류</label>
				<select name="category" class="form-control" id="sel1">
					<option value="share">나눔</option>
					<option value="sell">판매</option>
				</select>
			</div>

			<div class="item">
				<label for="subject">제목</label> <input type="text" class="form-control" name="subject" placeholder="제목을 입력해 주세요" id="subject">
			</div>

			<div class="item">
				<label for="passwd">비밀번호</label> <input type="text" class="form-control" name="passwd" id="usr">
			</div>

			<div class="item">
				<label for="regdate">등록일</label> <input type="date" class="form-control" name="regdate" id="now_date">
			</div>

			<div class="item">
				<label for="sel1">지역</label>
				<select name="region" class="form-control" id="sel1">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="강원">강원</option>
					<option value="충북">충북</option>
					<option value="전남">전남</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
					<option value="기타">기타</option>
				</select>
			</div>

			<div class="item">
				<label for="sdate">시작일자</label> <input type="date" class="form-control" name="sdate" id="usr">
			</div>

			<div class="item">
				<label for="edate">종료일자</label> <input type="date" class="form-control" name="edate" id="usr">
			</div>

			<div class="item">
				<div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden; margin-top: 20px; margin-bottom: 20px;"></div>
			</div>

			<div class="item">
				<label for="writer">작성자</label> <input type="text" class="form-control" name="writer" id="usr">
			</div>

			<div class="item">
				<label for="stime">시작시간</label> <input type="time" class="form-control" name="stime" id="usr">
			</div>

			<div class="item">
				<label for="etime">종료시간</label> <input type="time" class="form-control" name="etime" id="usr">
			</div>

			<div class="item">
				<label for="address">주소</label> <input type="text" onclick="sample5_execDaumPostcode()" class="form-control" id="sample5_address" name="address">
			</div>

			<div class="item">
				<label for="address">상세주소</label> <input type="text" class="form-control" name="detailaddress">
			</div>

			<div class="item">
				<label for="content">내용</label>
				<textarea class="form-control" rows="10" name="content" id="content"></textarea>
			</div>

			<div class="item">
				<button onclick=mySubmit(1)>등록</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">

CKEDITOR.replace(
		'content',{
			height:'200px', 
			filebrowserUploadUrl : "${pageContext.request.contextPath}/imageUpload.do"
			}
		);
		
function checkForm() {
	
	var subject = document.getElementById('subject');
    // 아이디 입력 유무 체크
    if(subject.value == '') {
        window.alert("제목을 입력하시오");
        document.fmField.subject.focus();
        document.getElementById('subject').select();
        return false; // 아이디 입력이 안되어 있다면 submint 이벤트를 중지
    }
    
    var uerPw = document.getElementById('userPw');
    // 암호 입력 유무 체크
    if(document.fmField.userPw.value == ''){
        alert('암호를 입력하세요.');
        userPw.focus();
        return false;
    }
}
</script>

<script>
	function mySubmit(index) {

	if (index == 1) {

		document.writeform.action = '${pageContext.request.contextPath}/market/market_writePro';

	}
	}
	
	document.getElementById('now_date').valueAsDate = new Date();

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    
 	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
    if (navigator.geolocation) {
        
        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {
            
            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도
            
            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
            
            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
                
          });
        
    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
        
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
            message = 'geolocation을 사용할수 없어요..'
            
        displayMarker(locPosition, message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({  
            map: map, 
            position: locPosition
        }); 
        
        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });
        
        // 인포윈도우를 마커위에 표시합니다 
        infowindow.open(map, marker);
        
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);      
    }    


    function sample5_execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        
                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({  
                            map: map, 
                            position: locPosition
                        }); 
                        
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</html>