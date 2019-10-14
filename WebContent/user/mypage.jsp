<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@page import="model.User" %>
<%@page import="model.Post" %>
<%@page import="model.service.UserManager" %>
<%@page import="model.service.UserNotFoundException" %>
<%
	String curUserId = (String)session.getAttribute("user");
	User user = (User)request.getAttribute("user");
	List<Post> postList = (List<Post>)request.getAttribute("postList");
	List<Post> downpostList = (List<Post>)request.getAttribute("downpostList");
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
<title><%= user.getUser_id() %>&nbsp;님의 MY PAGE</title>
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
		<div class="container">
			<h2>MY PAGE</h2>
		</div>
	</section>
	<section class="main-section" id="service">
		<div class="container">
			
			<div class="row">
				<div class="col-lg-4 col-sm-6 wow fadeInLeft delay-05s">
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-gear"></i>
						</div>
						<div class="service-list-col2">
							<h3><%= user.getUser_id() %>님의 닉네임</h3>
							<p><%= user.getNickname() %></p>
						</div>
					</div>
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-paint-brush" aria-hidden="true"></i>
						</div>
						<div class="service-list-col2">
							<h3><%= user.getUser_id() %>님의 관심 색</h3>
							<p style="color:<%= user.getInterest1() %>"><b><%= user.getInterest1() %></b></p>
							<%
			  					if (user.getInterest2() != null)
			  						out.println("<p style=color:" + user.getInterest2() +"><b>" + user.getInterest2() + "</b></p>");
			  					if (user.getInterest3() != null)
			  						out.println("<p style=color:" + user.getInterest3() +"><b>" + user.getInterest3() + "</b></p>");
			  				%>
						</div>
					</div>
					<div class="service-list">
						<div class="service-list-col1">
							<i class="fa fa-star" aria-hidden="true"></i>
						</div>
						<div class="service-list-col2">
							<h3><%= user.getUser_id() %>님의 포인트</h3>
							<p><%= user.getTotal_point() %></p>
						</div>
					</div>
				</div>
			
				<div class="col-lg-6 col-sm-6 wow fadeInUp delay-05s">
					<ul class="nav nav-tabs nav-justified">
    					<li class="active">
      						<a class="nav-link active"  data-toggle="tab" href="#mypost">내가 쓴 글</a>
    					</li>
    					<li class="nav-item">
     						 <a class="nav-link"  data-toggle="tab" href="#mydown">다운로드 한 글</a>
    					</li>
    				</ul>
    				<br>
					<div class="tab-content">
						<div class="tab-pane container active col-sm-12" id="mypost">
     
      					<table class="table table-hover container">
          					<thead>
              					<tr>
              						<th>Index</th>
              						<th>카테고리</th>
              						<th>색상</th>
              						<th>제목</th>
              						<th></th>
              					</tr>
         					</thead>
         					<tbody>
         						<c:forEach items="${postList}" var="post" varStatus="status">
              						<tr>
              							<td>${status.count}</td>
              							<td>${post.usage}</td>
										<td>${post.color[0]} &nbsp; ${post.color[1]}</td>
										<td>${post.title} </td>
										<td><a class="link delay-1s servicelink btn-sm" href="<c:url value='/post/detail' />?postId=${post.post_id}">조회</a></td>
									</tr>
  								</c:forEach>
            
       					 	</tbody>
      					</table>
  						</div>
  						
  						
  						<div class="tab-pane container col-sm-12" id="mydown">
     
      					<table class="table table-hover container">
          					<thead>
              					<tr>
              						<th>Index</th>
              						<th>카테고리</th>
              						<th>색상</th>
              						<th>제목</th>
              						<th></th>
              					</tr>
         					</thead>
         					<tbody>
         						<c:forEach items="${downpostList}" var="post" varStatus="status">
              						<tr>
              							<td>${status.count}</td>
              							<td>${post.usage}</td>
										<td>${post.color[0]} &nbsp; ${post.color[1]}</td>
										<td>${post.title} </td>
										<td><a class="link delay-1s servicelink btn-sm" href="<c:url value='/post/detail' />?postId=${post.post_id}">조회</a></td>
									</tr>
  								</c:forEach>
            
       					 	</tbody>
      					</table>
  						</div>
  					</div>
				
			</div>
		</div>
		
		</div>
	</section>
	
	
	
	
	
	<footer class="footer">
		<div class="container">
			<div class="footer-logo"><a href="#"><img src="<c:url value='/img/blogo.png' />" alt=""></a></div>
			<span class="copyright">&copy; TEAM ABT All Rights Reserved</span>
			<div class="credits">	
				동덕여자대학교 데이터베이스프로그래밍<br>박보람 오소영 최지수
			</div>
		</div>
	</footer>
	
</body>
</html>