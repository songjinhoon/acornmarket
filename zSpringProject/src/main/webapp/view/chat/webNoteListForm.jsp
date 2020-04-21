<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/webNoteListForm.css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                	<p style="font-weight: bold; color: black; ">보낸쪽지함</p>            	
            	</c:if>           	
                <div onclick="messageEvent()"><span>쪽지쓰기</span></div>
            </div>
            <div class="col-sm-10" id="section3">
                <div class="container-fluid">
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
                        <c:forEach var="webNote" items="${webNoteList}" varStatus="status">
                        	<tr>
	          	                <td>    
	                                <div class="form-check">
	                                	<input type="checkbox" class="form-check-input" name="chk" value="${webNote.messageno}">
                                	</div>
	                            </td>
	                            <c:if test="${categoryCheck == 1}">
	                            	<td onclick="messageContent(${webNote.messageno})">${webNote.writer}</td>
	                            </c:if>
	                            <c:if test="${categoryCheck == 2}">
	                            	<td onclick="messageContent(${webNote.messageno})">${webNote.receiver}</td>
	                            </c:if>
	                            <td onclick="messageContent(${webNote.messageno})">${webNote.messagecontent}</td>
								<td onclick="messageContent(${webNote.messageno})">${webNote.regdate}</td>
                        	</tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                	<div class="col-sm-4"></div>
                	<div class="col-sm-4">
                		<div class="pagebutton">
	                		<c:if test="${startPage > bottomLine}">
			            		<a href="webNoteListForm?categoryCheck=${categoryCheck}&pageNum=${startPage-bottomLine}">&lt;</a>
			         		</c:if>
			         		<c:forEach var="index" begin="${startPage}" end="${endPage}">
			          			<a href="${pageContext.request.contextPath}/chat/webNoteListForm?categoryCheck=${categoryCheck}&pageNum=${index}">${index}</a>           				
			   				</c:forEach>
			         		<c:if test="${endPage < pageCount}">
			            		<a href="webNoteListForm?categoryCheck=${categoryCheck}&pageNum=${startPage+bottomLine}">&gt;</a>
			         		</c:if>
		         		</div>
                	</div>
                	<div class="col-sm-4">
                		<button id="deleteBtn" class="btn btn-outline-secondary">삭제</button>
                	</div>
                </div>
            </div>
        </div>
    </div>
   	<script>
		function pageChange1(){
			window.location.href="http://localhost:8080/zSpringProject/chat/webNoteListForm?categoryCheck=2";
		}
		function pageChange2(){
			window.location.href="http://localhost:8080/zSpringProject/chat/webNoteListForm?categoryCheck=1";
		}
		function messageEvent(){
			var popupX = (window.screen.width / 2) - (400 / 2);
			var popupY= (window.screen.height / 2) - (400 / 2);
			window.open('http://localhost:8080/zSpringProject/common/messageForm.jsp','쪽지','width=400,height=400,location=no,status=no,scrollbars=yes, left=' + popupX + ', top=' + popupY);
		}
   		function messageContent(messageNo){
   			var webNote = {
   					messageno: messageNo
   			}
   			
   			$.ajax({
	            url: "http://localhost:8080${pageContext.request.contextPath}/chat/messageContent",
	            type: "POST",
	            dataType: "json",
	            data: webNote,
	            success: function(data){
	            	var popupX = (window.screen.width / 2) - (400 / 2);
	    			var popupY = (window.screen.height / 2) - (400 / 2);
	    			var url = "http://localhost:8080/zSpringProject/common/messageContentForm.jsp?messageNo=" + data.messageno;					
 	    			window.open(url,'쪽지','width=400,height=400,location=no,status=no,scrollbars=yes, left=' + popupX + ', top=' + popupY);					 
	            },
	            error: function(){
	                alert("serialize err");
	            }
	        }); 
   		}
		
		$('#deleteBtn').on('click', function(){
			var arrCheckNo = new Array();
			var k = 0;
			$('input:checkbox[name=chk]').each(function() {
			   if($(this).is(':checked')){
				   arrCheckNo[k] = ($(this).val());
				   k++;
			   }
			});
			var data = {
					messageNoList: arrCheckNo
			}
			
   			$.ajax({
	            url: "http://localhost:8080${pageContext.request.contextPath}/chat/messsageDelete",
	            type: "POST",
	            data: JSON.stringify(data),
	            contentType: "application/json",
	            success: function(){
	            	$('input:checkbox[name=chk]').each(function() {
	     			   if($(this).is(':checked')){
	     				   $(this).closest("tr").css("display", "none");
	     			   }
	     			});
	            },
	            error: function(){
	                alert("serialize err");
	            }
	        });
		})
	</script>	
</body>
</html>