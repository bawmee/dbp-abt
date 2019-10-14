<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.User" %>
<%@page import="model.service.UserManager" %>
<%@page import="model.service.UserNotFoundException" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
	String curUserId = (String)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">


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
<title>회원가입 From</title>


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
			<h2>에받템 회원가입</h2>
		</div>
	</section>

	
	
	<div class="container">

		<section class="main-section team" id="team">
			
			<div class="container">
				<div class="row">
				
				<div class="featured-work">

						
						<c:if test="${registerFailed}">
							<div class="alert alert-warning alert-dismissible">
 								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  								<strong><i class="fa fa-exclamation-circle" aria-hidden="true"></i> &nbsp;
  									${exception.getMessage()}
  								</strong>
							</div>
						</c:if>
					</div>
					
					
					<script>
					function check() {
						
						var sum = 0;
						var count = fr.interest.length;
						  for(var i=0; i < count; i++ ){
						       if( fr.interest[i].checked == true ){
							    sum += 1;
								}
						  } 
						if(sum < 3){
							alert("관심 색상 " + (3 - sum) + "개를 더 선택해주세요"  );
							return false;}
		
  						if(fr.user_id.value == "") {
							alert("아이디는 필수 항목 입니다");
							fr.user_id.focus();
							return false;}
  						else if(fr.password.value == "") {
							alert("비밀번호는 필수 항목 입니다");
							fr.password.focus();
							return false;}
  						else if(fr.nickname.value == "") {
							alert("닉네임은 필수 항목 입니다");
							fr.nickname.focus();
							return false;}
						else return true;

				}
			</script>
				
					<form name="fr" action="<c:url value='/user/register' />" method="post"  onsubmit="return check()" role="form" class="contactForm">
			<div class="form-group">
				<input type="text" name="user_id" class="form-control input-text" id="user_id"
					placeholder="Id" data-rule="minlen:4"
					data-msg="Please enter your Id" />
				<div class="validation"></div>
			</div>
			<div class="form-group">
				<input type="password" class="form-control input-text"
					name="password" id="password" placeholder="Password"
					data-rule="password" data-msg="Please enter Your password" />
				<div class="validation"></div>
			</div>
			<div class="form-group">
				<input type="text" class="form-control input-text" name="nickname"
					id="nickname" placeholder="Nickname"
					data-msg="Please enter Your nickname" />
				<div class="validation"></div>
			</div>
			
			<script language=Javascript>

				var maxChecked = 3;   //선택가능 갯수
				var totalChecked = 0; // 설정 끝

				function CountChecked(field) {
    				if (field.checked)
        				totalChecked += 1;
    				else
       					totalChecked -= 1;

    				if (totalChecked > maxChecked) {
        				alert ("최대 3개 까지만 가능합니다.");
    					field.checked = false;
    					totalChecked -= 1;
    				}
    
				}

				function ResetCount(){
    				totalChecked = 0;
				}

			</script>
			
			최대 <script>document.write(maxChecked);</script>까지만 선택할 수 있습니다.
			<div class="form-group">
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="red" onclick=CountChecked(this)> 빨강</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="orange" onclick=CountChecked(this)> 주황</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="yellow" onclick=CountChecked(this)> 노랑</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="green" onclick=CountChecked(this)> 초록</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="blue" onclick=CountChecked(this)> 파랑</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="purple" onclick=CountChecked(this)> 보라</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="gray" onclick=CountChecked(this)> 회색</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="pink" onclick=CountChecked(this)> 핑크</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="black" onclick=CountChecked(this)> 검정</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="white" onclick=CountChecked(this)> 흰색</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="navy" onclick=CountChecked(this)> 네이비</label>
				<label class="checkbox-inline"><input type="checkbox" name="interest" value="lime" onclick=CountChecked(this)> 라임</label>
				<div class="validation"></div>


			<div class="text-center">
				<button type="submit" class="link delay-1s servicelink">회원가입</button>
			</div>
		</form>
				</div>
			</div>
		</section>
	</div>
	
	
	
	
	

		

		
	



</body>
</html>