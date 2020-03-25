<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<style>
	   * { font-family: 'Noto Sans KR', sans-serif; }
	</style>
</head>
<body>
   <div class="container-fluid" style="background-color: #212529; height: 30px;">
   </div>
   <div class="container" style="border: 5px solid #745d46; width: 70%; margin-top: 40px;">
   		<div class="container" id="writer"></div>
   		<div class="container" id="receiver" style="border-bottom: 1px solid #745d46;"></div>
   		<div class="container" id="content" style="margin: 20px 0; border: 1px solid #745d46; height: 200px;"></div>
   </div>
</body>
	<script>
		$(document).ready(function(){
			var messageNo = getParam("messageNo");
			var webNote = {
					messageno: messageNo
			}
			
			$.ajax({
	            url: "http://localhost:8080${pageContext.request.contextPath}/chat/messageContent",
	            type: "POST",
	            dataType: "json",
	            data: webNote,
	            success: function(data){
	            	console.log(data.regdate);
	            	$('#writer').text('보낸 사람: ' + data.writer);
	            	$('#receiver').text('받은 사람: ' + data.receiver);
	            	$('#regdate').text(data.regdate);
	            	$('#content').text(data.messagecontent);
	            },
	            error: function(){
	                alert("serialize err");
	            }
     	   })
		});
		
		function getParam(sname) {
		    var params = location.search.substr(location.search.indexOf("?") + 1);
		    var pram = "";

		    params = params.split("&");

		    for (var i = 0; i < params.length; i++) {
		        temp = params[i].split("=");
		        if ([temp[0]] == sname) { 
		        	pram = temp[1]; 
		        }
		    }
		    return pram;
		}
		
	</script>
</html>