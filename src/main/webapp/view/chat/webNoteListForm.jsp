<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/webNoteListForm.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script type="text/javascript">
		var webSocket = new WebSocket("ws://localhost:8080/zSpringProject/webNoteListForm");
		webSocket.onerror = function(event){ onError(event) };
		webSocket.onopen = function(event){ onOpen(event) };
		webSocket.onmessage = function(event){ onMessage(event) };
		webSocket.onclose = function(event){ onClose(event) };
		
		function disconnect() {
			webSocket.close();
		}
		function onOpen(event) {
			webSocket.send("[dwaci2]writer:${ userName }");
		}
		function onMessage(event) {
			var data = event.data;
			if (data.substring(0, 4) == "msg:") {
				appendMessage(data.substring(4));
			}
		}
		function onClose(event) {
			appendMessage("연결을 끊었습니다.");
		}
		
		function send() {
			var nickname = $("#nickname").val();
			var msg = $("#message").val();
			webSocket.send("msg:"+nickname+":" + msg);
			$("#message").val("");
		}
		function appendMessage(msg) {
		}
		function pageChange1(){
			webSocket.send("[dwaci2]pageChange1 요청");
			window.location.href="http://localhost:8080/zSpringProject/chat/webNoteListForm?categoryCheck=2";
		}
		function pageChange2(){
			webSocket.send("[dwaci2]pageChange1 요청");
			window.location.href="http://localhost:8080/zSpringProject/chat/webNoteListForm?categoryCheck=1";
		}
		
	</script>
</head>
<body>
    <div class="container" id="section1">
        <div class="row container-fluid">
            <div class="col-sm-2" id="section2">
            	<c:if test="${ categoryCheck == 1 }">
					<p style="font-weight: bold; color: black; ">받은쪽지함</p>
                	<p onClick="pageChange1()">보낸쪽지함</p>            	
            	</c:if>
    	        <c:if test="${ categoryCheck == 2 }">
					<p onClick="pageChange2()">받은쪽지함</p>
                	<p style="font-weight: bold; color: black;">보낸쪽지함</p>            	
            	</c:if>           	
                <div onclick="messageEvent()"><span>쪽지쓰기</span></div>
            </div>
            <div class="col-sm-10" id="section3">
                <div class="container-fluid">
                <form action="#" method="POST" ></form>
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th></th>
                            <c:if test="${categoryCheck == 1}">
                            	<th>보낸사람</th>
                            </c:if>
                            <c:if test="${categoryCheck == 2}">
                            	<th>받은사람</th>
                            </c:if>
                            <th style="width: 50%;">내용</th>
                            <th>날짜</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="webNote" items="${webNoteList}">
                        	<tr>
	          	                <td>    
	                                <div class="form-check"><input type="checkbox" class="form-check-input" id="check1" value=""></div>
	                            </td>
	                            <c:if test="${categoryCheck == 1}">
	                            	<td>${webNote.writer}</td>
	                            </c:if>
	                            <c:if test="${categoryCheck == 2}">
	                            	<td>${webNote.receiver}</td>
	                            </c:if>
	                            <td>${webNote.messagecontent}</td>
	                            <td>${webNote.regdate}</td>
                        	</tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
          		<c:forEach var="index" begin="1" end="${pageCount}">
          			<a href="${pageContext.request.contextPath}/chat/webNoteListForm?categoryCheck=${categoryCheck}&pageNum=${index}">${index}</a>           				
   				</c:forEach>
                <button type="submit" class="btn btn-outline-secondary">삭제</button>
            </div>
        </div>
    </div>
   	<script>
		function messageEvent(){
			var popupX = (window.screen.width / 2) - (400 / 2);
			var popupY= (window.screen.height / 2) - (400 / 2);
			window.open('http://localhost:8080/zSpringProject/common/messageForm.jsp','window_name','width=400,height=400,location=no,status=no,scrollbars=yes, left=' + popupX + ', top=' + popupY);
		}
	</script>	
</body>
</html>