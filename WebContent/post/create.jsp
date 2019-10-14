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
	

<title>에받템 글작성</title>
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
			<h2>"A+" 받는 템플릿</h2>
		</div>
	</section>
	
	
	
	<div class="container">

		<section class="main-section team" id="team">
			
			<div class="container">
				<div class="row">
				<script>
					function check() {
						
						var sum = 0;
						var count = fr.color.length;
						  for(var i=0; i < count; i++ ){
						       if( fr.color[i].checked == true ){
							    sum += 1;
								}
						  } 
						if(sum < 2){
							alert("색상 " + (2 - sum) + "개를 더 선택해주세요"  );
							return false;}
						  
  						if(fr.post_title.value == "") {
							alert("제목은 필수 항목 입니다");
							fr.post_title.focus();
							return false;}
  						else if(fr.post_content.value == "") {
							alert("내용은 필수 항목 입니다");
							fr.post_content.focus();
							return false;}
  						
  						
						else return true;

				}
			</script>
				
					<form  name="fr" action="<c:url value='/post/create' />" method="post" role="form" class="contactForm" onsubmit="return check()" enctype="multipart/form-data">
					
						<div class="form-group">
  							<select class="form-control" name="usage" id="usage">
    							<option>발표</option>
    							<option>교육</option>
   								<option>SNS</option>
    							<option>기획서</option>
  							</select>
  						</div>
  						
  				<script language=Javascript>

				var maxChecked = 2;   //선택가능 갯수
				var totalChecked = 0; // 설정 끝

				function CountChecked(field) {
    				if (field.checked)
        				totalChecked += 1;
    				else
       					totalChecked -= 1;

    				if (totalChecked > maxChecked) {
        				alert ("최대 2개 까지만 가능합니다.");
    					field.checked = false;
    					totalChecked -= 1;
    				}
    
				}

				function ResetCount(){
    				totalChecked = 0;
				}

			</script>
  						
  						<div class="form-group">
  							<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="red" onclick=CountChecked(this)> 빨강</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="orange" onclick=CountChecked(this)> 주황</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="yellow" onclick=CountChecked(this)> 노랑</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="green" onclick=CountChecked(this)> 초록</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="blue" onclick=CountChecked(this)> 파랑</label>
           					<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="purple" onclick=CountChecked(this)> 보라</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="gray" onclick=CountChecked(this)> 회색</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="pink" onclick=CountChecked(this)> 핑크</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="black" onclick=CountChecked(this)> 검정</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="white" onclick=CountChecked(this)> 흰색</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="navy" onclick=CountChecked(this)> 네이비</label>
            				<label class="checkbox-inline"><input type="checkbox" name="color" id="color" value="lime" onclick=CountChecked(this)> 라임</label>
            			</div>
					
						<div class="form-group">
							<input type="text" name="post_title" class="form-control input-text" id="post_title"
								placeholder="제목입력" data-rule="maxlen:15"
								data-msg="Please enter Post Title" />
							<div class="validation"></div>
						</div>
			
						<div class="form-group">
  							<textarea class="form-control" rows="10" id="post_content" name="post_content"></textarea>
						</div>
						
						<div class="form-group">
							<input type="text" name="file_link" class="form-control input-text" id="file_link"
								placeholder="file link"
								data-msg="Please enter File Link" />
							<div class="validation"></div>
						</div>
						
						<div class="form-group">
							<input type="file" name="file" class="form-control input-text" id="file" />
							<div class="validation"></div>
						</div>
						
						<div class="form-group">
						<label for="thumnail"> thumnail</label>
							<input type="file" name="thumnail" class="form-control input-text" id="thumnail" 
							placeholder="thumnail"/>
							<div class="validation"></div>
						</div>
				
			
						<div class="text-center">
							<button type="submit" class="input-btn">작성완료</button>
						</div>
					</form>
				</div>
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
	
	
</body>
</html>