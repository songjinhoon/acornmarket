<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>도토리 대화방</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chatForm.css">
</head>
<body>
	<h1>도토리 마켓 오픈 채팅방</h1>
	<div class="container line" style="background-color: black; height: 2px; margin-bottom: 50px; width: 20%; ">
	</div>
	<div class="container chattingform">
		<div class="container" id="section1">
			<div class="row">
				<div class="col-sm-2 chattinglist">
					<div class="row" id="userListWindow">
						<div class="container-fluid section1">
							<p>채팅접속자</p>
						</div>
					</div>
				</div>
				<div class="col-sm-1">
				</div>
				<div class="col-sm-9 contentform">
					<div class="row" id="messageWindow">
					</div>			
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-7">
					<div class="row">
						<input type="text" id="inputMessage" onkeydown="enterkey()"></input>
					</div>
				</div>
				<div class="col-sm-3"></div>
				<div class="col-sm-2">
					<div class="row">
						<input class="button" type="button" value="글 입력" onclick="send()"></input>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
	<script type="text/javascript">
		var textarea = document.getElementById('messageWindow');
		var userlsitarea = document.getElementById('userListWindow');
		var webSocket = new WebSocket('ws://211.63.89.78:8080<%= request.getContextPath() %>/chat');
		var inputMessage = document.getElementById('inputMessage');
		
		webSocket.onerror = function(event){ onError(event) };
		webSocket.onopen = function(event){ onOpen(event) };
		webSocket.onmessage = function(event){ onMessage(event) };
		
		function onMessage(event){
			var check = event.data;
			if(check.startsWith('[djalwjc1542]')){
				check = check.split(']');
				for(var i in check){
					if(i == 1){
						textarea.innerHTML += "<div class='container-fluid' style='padding: 0;'>"+ check[i] +"</div>";
						textarea.scrollTop = textarea.scrollHeight;						
					}
				}
			}else{
				textarea.innerHTML += "<div class='col-sm-6 you'>" + event.data + "</div>";
				textarea.innerHTML += "<div class='col-sm-6'>";
				textarea.scrollTop = textarea.scrollHeight;
			}
		}
		function opClose(event){
			textarea.innerHTML += "<div class='container-fluid' style='padding: 0;'>${ userName }님이 퇴장 하셨습니다.</div>";
			webSocket.send("${ userName }님이 퇴장 하였습니다.");
		}
		function onOpen(event){
			userlsitarea.innerHTML += "<div class='container-fluid section2'>${ userName }</div>"
			textarea.innerHTML += "<div class='container-fluid' style='padding: 0;'>채팅방에 입장하셨습니다.</div>";
			webSocket.send("[djalwjc1542]${ userName }님이 입장하셨습니다.");
		}
		function onError(event){
			alert(event.data);
		}
		function send(){
			textarea.innerHTML += "<div class='col-sm-6'>";
			textarea.innerHTML += "<div class='col-sm-6 me'>" + inputMessage.value + "</div>";
			webSocket.send("${ userName }: " + inputMessage.value);
			inputMessage.value = "";
			textarea.scrollTop = textarea.scrollHeight;
		}
		
		function enterkey() {
	        if (window.event.keyCode == 13) {
	             send();
	        }
		}
	</script>
</html>