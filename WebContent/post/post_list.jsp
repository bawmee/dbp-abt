<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.Post" %>
<%@page import="model.User" %>
<%@page import="model.service.UserManager" %>
<%@page import="model.service.UserNotFoundException" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 	@SuppressWarnings("unchecked") 
	List<Post> postList = (List<Post>)request.getAttribute("postList");
	List<Post> recomList = (List<Post>)request.getAttribute("recomList");
 	String curUserId = (String)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>

	<link rel=stylesheet href="<c:url value='/css/style.css' />" type="text/css">
	<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/font-awesome.css' />" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/responsive.css' />" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/magnific-popup.css' />" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/animate.css' />" type="text/css">
	
	
	<script type="text/javascript" src="<c:url value='/js/jquery.1.8.3.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/bootstrap.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-scrolltofixed.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.easing.1.3.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.isotope.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/wow.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/classie.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/magnific-popup.js' />"></script>
	

<title>에받템 글 리스트</title>
</head>
<body>

	<nav class="main-nav-outer" id="test">
		<div class="container">
			<ul class="main-nav">
				<li><a href="<c:url value='/main/main' />">에받템</a></li>
				<li><a href="<c:url value='/post/list' />">글 리스트</a></li>
				<li class="small-logo">
					<a href="<c:url value='/main/main' />"><img src="<c:url value='/img/small-blogo.png' />" alt=""></a>
				</li>
				<li><a href="<c:url value='/post/create/form' />">글작성</a></li>
				
				<!-- 로그인여부에 따라서 다름 -->
				<%
    				UserManager manager = UserManager.getInstance();
    				User us = manager.findUser(curUserId);
    			%>
    			
				<c:choose>
    				<c:when test='${sessionScope.user eq null}'>
    					<li><a href="<c:url value='/user/register/form' />">Sign Up</a></li>
      					<li><a href="<c:url value='/user/login/form' />">Login</a></li>
    				</c:when>
    				<c:otherwise>
      					<li><a href="<c:url value='/user/mypage'><c:param name='user_id' value='<%=us.getUser_id() %>'/></c:url>"><%=curUserId%>&nbsp;님</a></li>
      					<li><a href="<c:url value='/user/logout' />">Logout</a></li>
    				</c:otherwise>
    			</c:choose>

			</ul>
			<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
		</div>
	</nav>


	<section class="business-talking">
		<div class="container" >
			<h2>"A+" 받는 템플릿</h2>
		</div>
	</section>
	

	
	<div class="container">
	
	
	<c:if test="${empty recomList}">
  		<br>
  		<div class="alert alert-info alert-dismissible">
  				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  				회원가입 후 로그인을 하실 경우 <strong>"취향에 맞는 추천"</strong> 서비스가 제공 됩니다
		</div>
  	</c:if>
	
	<c:if test="${not empty recomList}"> 
		<div class="container team-leader-block clearfix" style="margin-top:50px; text-align:center;">
			<div class="row">
    			<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-left:50px;">
    				<H3>추천 템플릿</H3>
   					 <ol class="carousel-indicators">
   					 	<c:forEach items="${recomList}" var="post" varStatus="status">
   					 		<c:if test="${status.index == 0}">
   					 			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
   					 		</c:if>
   					 		<c:if test="${status.index != 0}">
   					 			<li data-target="#myCarousel" data-slide-to="${status.index}"></li>
   					 		</c:if>
   					 	</c:forEach>
    				</ol>

    
    				<div class="carousel-inner">
    					<c:forEach items="${recomList}" var="post" varStatus="status">
   					 		<c:if test="${status.index == 0}">
   					 			<div class="item active">
       						 		<a href="<c:url value='/post/detail' />?postId=${post.post_id}">			           
  										<img src="<c:url value='/img/${post.thumnail}' />" alt="${post.title}" style="width:100%;">
  									</a>
      							</div>
   					 		</c:if>
   					 		<c:if test="${status.index != 0}">
   					 			<div class="item">
        							<a href="<c:url value='/post/detail' />?postId=${post.post_id}">			           
  										<img src="<c:url value='/img/${post.thumnail}' />" alt="${post.title}" style="width:100%;">
  									</a>
      							</div>
   					 		</c:if>
   					 	</c:forEach>
     				</div>

    
    				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
      					<span class="fa fa-chevron-left" aria-hidden="true"></span>
      					<span class="sr-only">Previous</span>
    				</a>
    				<a class="right carousel-control" href="#myCarousel" data-slide="next">
      					<span class="fa fa-chevron-right" aria-hidden="true"></span>
      					<span class="sr-only">Next</span>
   				 </a>
  			</div>
		</div>
		</div>
	</c:if>
	</div>
	
	
		<section class="main-section paddind" id="Portfolio">
		
		<div class="container">
			<h2>POWERPOINT TEMPLATES</h2>
			<h6>🍯 템플릿을 모두 모았다 🍯</h6><br>
			<div class="portfolioFilter">
				<ul class="Portfolio-nav wow fadeIn delay-02s">
					<li><a href="#" data-filter="*" class="current">All</a></li>
					<li><a href="#" data-filter=".발표">발표</a></li>
					<li><a href="#" data-filter=".교육">교육</a></li>
					<li><a href="#" data-filter=".SNS">SNS</a></li>
					<li><a href="#" data-filter=".기획서">기획서</a></li>
				</ul>
			</div>

			
			
			<div style="float:right">
				<input class="form-control" id="myInput" type="text" placeholder="Search Color"><br>
				<span class="label label-default">
					<a href="<c:url value='/post/list' />" style="color:white;">최신순 정렬</a> 
				</span>&nbsp;
				<span class="label label-default">
					<a href="<c:url value='/post/list' />?sort=downcount" style="color:white;">다운로드 카운트순 정렬</a>
				</span>
				<br><br>
			</div>

		</div>
		<div class="portfolioContainer wow fadeInUp delay-04s">
			
			<c:forEach items="${postList}" var="post" varStatus="status">
				<div class="Portfolio-box ${post.usage}" id="${post.color[0]} ${post.color[1]}">	
					 <a href="<c:url value='/post/detail' />?postId=${post.post_id}">			           
  						<img src="<c:url value='/img/${post.thumnail}' />" alt="" width="350px" height="263px">
  					</a>         
  						<h2>${post.title}</h2>

				</div>
  			</c:forEach>
  			
		</div>
		
	</section>
	
		
	</div>
	
	
	
  
  


	
	<footer class="footer">
		<div class="container">
			<div class="footer-logo"><a href="#"><img src="<c:url value='/img/blogo.png' />" alt=""></a></div>
			<span class="copyright">&copy; TEAM ABT All Rights Reserved</span>
			<div class="credits">	
				동덕여자대학교 데이터베이스프로그래밍<br>박보람 오소영 최지수
			</div>
		</div>
	</footer>
	
	
<script>
	$(document).ready(function() {
        $("#recommendRegion").hide();

        $("input.btn").click(function() {

            $("#recommendRegion").show();

        });

    });
</script>
	<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
	  
	  
	  
    var value = $(this).val().toLowerCase();
    $(".Portfolio-box").filter(function() {
      $(this).toggle($(this).attr("id").toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

	
	<script type="text/javascript">
		$(document).ready(function(e) {

			$('#test').scrollToFixed();
			$('.res-nav_click').click(function() {
				$('.main-nav').slideToggle();
				return false

			});

			

		});
	</script>

	<script>
		wow = new WOW({
			animateClass: 'animated',
			offset: 100
		});
		wow.init();
	</script>


	<script type="text/javascript">
		$(window).load(function() {

			$('.main-nav li a, .servicelink').bind('click', function(event) {
				var $anchor = $(this);

				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top - 102
				}, 1500, 'easeInOutExpo');
				/*
				if you don't want to use the easing effects:
				$('html, body').stop().animate({
					scrollTop: $($anchor.attr('href')).offset().top
				}, 1000);
				*/
				if ($(window).width() < 768) {
					$('.main-nav').hide();
				}
				event.preventDefault();
			});
		})
	</script>

	<script type="text/javascript">
		$(window).load(function() {


			var $container = $('.portfolioContainer'),
				$body = $('body'),
				colW = 375,
				columns = null;


			$container.isotope({
				// disable window resizing
				resizable: true,
				masonry: {
					columnWidth: colW
				}
			});

			$(window).smartresize(function() {
				// check if columns has changed
				var currentColumns = Math.floor(($body.width() - 30) / colW);
				if (currentColumns !== columns) {
					// set new column count
					columns = currentColumns;
					// apply width to container manually, then trigger relayout
					$container.width(columns * colW)
						.isotope('reLayout');
				}

			}).smartresize(); // trigger resize to set container width
			$('.portfolioFilter a').click(function() {
				$('.portfolioFilter .current').removeClass('current');
				$(this).addClass('current');

				var selector = $(this).attr('data-filter');
				$container.isotope({

					filter: selector,
				});
				return false;
			});

		});
	</script>
	
	
	
	
</body>
</html>
