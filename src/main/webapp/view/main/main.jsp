<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="zxx">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>도토리 마켓</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="single_slider slider_bg_1 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-6">
                        <div class="slider_text" style="position: absolute; top: 50%; transform: translateY(-50%);">
                            <h3>우리 동네 <br><span>중고 직거래</span> 마켓</h3>
                            <p>동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</p>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6">
                    </div>
                    <div class="col-lg-5 col-md-6 fcan">
                    	<p class="text-center" style="color: black; font-weight: bold;">온도가 가장 높은 도토리인 TOP 6</p>
                    	<canvas id="myChart1" width="400" height="250"></canvas>
                    	<p class="text-center" style="color: black; font-weight: bold;">조회수가 가장 많은 게시글 TOP 6</p>
                    	<canvas id="myChart2" width="400" height="250"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="service_area">
        <div class="container">
            <div class="row justify-content-center ">
                <div class="col-lg-7 col-md-10">
                    <div class="section_title text-center mb-95">
                        <h3>도토리 마켓은 이런점이 달라요.</h3>
                        <p>동네 주민들과 가깝고 따듯한 거래를 지금 경험해보세요.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6">
                    <div class="single_service">
                         <div class="service_thumb service_icon_bg_1 d-flex align-items-center justify-content-center">
                             <div class="service_icon">
                             </div>
                         </div>
                         <div class="service_content text-center">
                            <h3>거래 장소 지정</h3>
                            <p>거래할 장소를 직접 선택 가능해요.</p>
                         </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_service active">
                         <div class="service_thumb service_icon_bg_2 d-flex align-items-center justify-content-center">
                             <div class="service_icon">
                             </div>
                         </div>
                         <div class="service_content text-center">
                            <h3>거래 매너 온도</h3>
                            <p>거래 후 당신의 온도를 올려보세요.</p>
                         </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_service">
                         <div class="service_thumb service_icon_bg_3 d-flex align-items-center justify-content-center">
                             <div class="service_icon">
                             </div>
                         </div>
                         <div class="service_content text-center">
                            <h3>채팅하고 쪽지 보내기</h3>
                            <p>채팅과 쪽지로 의사소통을 진행하세요.</p>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- JS here -->
    <script src="${pageContext.request.contextPath}/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ajax-form.js"></script>
    <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scrollIt.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="${pageContext.request.contextPath}/js/contact.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script>
    	$(document).ready(function(){

 			$.ajax({
	            url: "http://211.63.89.78:8080${pageContext.request.contextPath}/main/chart1",
	            type: "GET",
	            success: function(user){
	            	/* chart1 정의 */            	
	            	var ctx = document.getElementById('myChart1');
					var myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: [user[0].userid, user[1].userid, user[2].userid, user[3].userid, user[4].userid, user[5].userid],
					        datasets: [{
					            label: '도토리인 Top 6',
					            data: [user[0].userscore, user[1].userscore, user[2].userscore, user[3].userscore, user[4].userscore, user[5].userscore],
					            backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)',
					                'rgba(255, 159, 64, 0.2)'
					            ],
					            borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)',
					                'rgba(255, 159, 64, 1)'
					            ],
					            borderWidth: 1
					        }]
					    },
					    options: {
					        scales: {
					            yAxes: [{
					                ticks: {
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					});
	    
	            },
	            
	            error: function(){
	                alert("serialize err");
	            }
	        });
 			
   			$.ajax({
	            url: "http://211.63.89.78:8080${pageContext.request.contextPath}/main/chart2",
	            type: "GET",
	            success: function(data){
	        		var ctx = document.getElementById('myChart2');
	        		var myChart = new Chart(ctx, {
	        		    type: 'pie',
	        		    data: {
	        		        labels: [data[0].subject, data[1].subject, data[2].subject, data[3].subject, data[4].subject, data[5].subject],
	        		        datasets: [{
	        		            label: '# of Votes',
	        		            data: [data[0].readcount, data[1].readcount, data[2].readcount, data[3].readcount, data[4].readcount, data[5].readcount],
	        		            backgroundColor: [
	        		                'rgba(255, 99, 132, 0.2)',
	        		                'rgba(54, 162, 235, 0.2)',
	        		                'rgba(255, 206, 86, 0.2)',
	        		                'rgba(75, 192, 192, 0.2)',
	        		                'rgba(153, 102, 255, 0.2)',
	        		                'rgba(255, 159, 64, 0.2)'
	        		            ],
	        		            borderColor: [
	        		                'rgba(255, 99, 132, 1)',
	        		                'rgba(54, 162, 235, 1)',
	        		                'rgba(255, 206, 86, 1)',
	        		                'rgba(75, 192, 192, 1)',
	        		                'rgba(153, 102, 255, 1)',
	        		                'rgba(255, 159, 64, 1)'
	        		            ],
	        		            borderWidth: 1
	        		        }]
	        		    },
	        		    options: {
	        		        scales: {
	        		            yAxes: [{
	        		                ticks: {
	        		                    beginAtZero: true
	        		                }
	        		            }]
	        		        }
	        		    }
	        		});
	            },
	            
	            error: function(){
	                alert("serialize err");
	            }
	        });
    	}) 
    
    
    
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            disableDaysOfWeek: [0, 0],
        });
        
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
        var timepicker = $('#timepicker').timepicker({
        	format: 'HH.MM'
     	});
        
    </script>
</body>
</html>




