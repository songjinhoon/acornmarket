<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/js/sweetalert/sweetalert.js"></script>
	<script>
		function checkIt(){
			var userinput = eval("document.userinput");
			
			if(!document.user.userPasswd.value){ 
				alert("비밀번호를 입력하세요"); 
				user.userPasswd.focus();
				return false;
			}
			
			if(!document.user.userEmail.value){ 
				alert("이메일을 입력하세요"); 
				user.email.focus();
				return false;
			}
			
			if(!document.user.phone1.value){ 
				alert("핸드폰번호를 입력하세요"); 
				user.phone1.focus();
				return false;
			}
			
			if(!document.user.phone2.value){ 
				alert("핸드폰번호를 입력하세요"); 
				user.phone2.focus();
				return false;
			}
			
			if(!document.user.phone3.value){ 
				alert("핸드폰번호를 입력하세요"); 
				user.phone3.focus();
			return false;
			}
			
			if (!document.user.userAddress.value) {
				swal("주소를 입력하세요");
				user.userAddress.focus();
				return false;
			}
		}
	</script>
	<style>
		label { color: #745d46; }
		.jumbotron { 
			border: solid 10px #745d46; 
			background-color: #fffff8;
		}
	</style>
</head>
<body>
	<div align="center">
		<p>
		<br>
		<div class="col-lg-4 jumbotron w3-panel w3-round-xlarge" style="width: 70%; height: 60%;">
			<form method="post" action="${pageContext.request.contextPath}/user/joinPro" name="user" onsubmit="return checkIt()" autocomplete="off">
				<p>
				<br>
				<table style="color: white;">
					<tr>
						<td><p style="color: black;">안녕하세요.<br>추가적으로 아래에 정보를 입력하시고 회원가입을 완료하세요.</p></td>
						<c:if test="${userId ne 'emailerror'}">
							<td><input type="hidden" name="userid" value="${userId}"></td>						
						</c:if>
						<td><input type="hidden" name="username" value="${userName}"></td>
					</tr>
					<c:if test="${userId eq 'emailerror'}">
						<tr>
							<td>
								<label>ID</label>
								<input class="w3-input w3-round w3-border" size="15" type="text" name="userid" placeholder="카카오톡 계정과 동일하게 입력하세요.">
							</td>
						</tr>
					</c:if>
					<tr>
						<td>
							<label>Password</label> 
							<input class="w3-input w3-round w3-border" size="15" type="password" name="userpasswd">
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label> 
							<input class="w3-input w3-round w3-border" size="25" type="text" name="useremail">
						</td>
					</tr>
					<tr>
						<td>
							<label>Phone</label><br> 
							<label><input class="w3-input w3-round w3-border" size="14" type="text" name="phone1"></label> - 
							<label><input class="w3-input w3-round w3-border" size="15" type="text" name="phone2"></label> - 
							<label><input class="w3-input w3-round w3-border" size="15" type="text" name="phone3"></label>
						</td>
					</tr>
					<tr>
						<td>
							<label>Address</label> 
							<input class="w3-input w3-round w3-border" size="30" type="text" name="userAddress" id="userAddress" placeholder="주소찾기버튼을 눌러주세요."> 
							<label><input type="text" size="33" class="w3-input w3-round w3-border" style=" margin-top: 3px;"id="detailAddress" name="detailAddress" placeholder="상세주소"></label>
							<input type="button" class="w3-button w3-round-large w3-middle w3-border" style="background-color: #f0e68c; color:#745d46; margin-top: 3px;"onclick="sample3_execDaumPostcode()" value="주소 찾기">
							<br>
							<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
								<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							</div>
						</td>
					</tr>
				</table>
				<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>

				<p/>
					<br> 
					<input class="w3-button w3-round-large w3-margin-right" style="background-color: #f0e68c; width: 100px;" type="submit" value="join"/> 
					<input class="w3-button w3-round-large w3-margin-left" style="background-color: #f0e68c; width: 100px;" type="reset" value="reset"/> 
					<br> <br>
			</form>
		</div>
	</div>
	<script>
	    // 주소 찾기 찾기 화면을 넣을 element
	    var element_wrap = document.getElementById('wrap');
	
	    function foldDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_wrap.style.display = 'none';
	    }
	
	    function sample3_execDaumPostcode() {
	        // 현재 scroll 위치를 저장해놓는다.
	        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드
	
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	               
	                if (data.userSelectedType === 'R') {
	                	 // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { 
	                	// 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합
	                if(data.userSelectedType === 'R'){
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               // document.getElementById('sample3_postcode').value = data.zonecode;
	                document.getElementById("userAddress").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';
	
	                // 주소 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	            },
	            // 주소번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
    	}
	</script>
</body>
</html>