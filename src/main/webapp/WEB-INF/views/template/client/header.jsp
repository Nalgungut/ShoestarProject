<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<style>
	#head_link{
	float:right;}
	#ss{
	font-color:black;}
</style>
<body>
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/">슈즈스타</a>
	</div>
	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="/product/showList?pd_sex=m">남자</a></li>
			<li><a href="/product/showList?pd_sex=f">여자</a></li>
			<li><a href="/product/showList?pd_age=k">어린이</a></li>
			<li><a href="/brand/brandMain">브랜드</a></li>
			<li><a href="/event/list">이벤트</a></li>
			<li><a href="/cscenter/">문의</a></li>   
			<li><a href="/myPage/main">마이페이지</a></li>
			<li><a href="/adminMember/adminLogin">관리T</a></li>
			<%-- 
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li class="divider"></li>
					<li class="dropdown-header">Nav header</li>
					<li><a href="#">Separated link</a></li>
					<li><a href="#">One more separated link</a></li>
				</ul>
			</li>
			--%>
			
			
			
		</ul>
	<div id="head_link">
		<ul>
		   <c:choose>
		   
		     <c:when test="${not empty login && login.mem_no != 0}">
		     <%-- <c:when test="${login==true and not empty adminLogin}"> --%>
			   <a href="${contextPath}/member/logout"><mark>로그아웃</mark></a>
			   <a href="${contextPath}/myPage/main"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>마이페이지</a>
			   <a href="${contextPath}/#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>장바구니</a>
			   <a href="#"><span class="glyphicon glyphicon-plane" aria-hidden="true"></span>주문배송</a>
			 </c:when>
			 <c:otherwise>
			   <a href="${contextPath}/member/login"><mark>로그인</mark></a>
			   <a href="${contextPath}/member/join" id="ss"><strong>회원가입</strong></a>
			 </c:otherwise>
			</c:choose>
			  
		</ul>
	</div>
	</div><!--/.nav-collapse -->
</div>
</body>