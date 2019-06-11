<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/">슈즈스타 쇼핑몰 페이지로</a>
	</div>
	<div id="navbar" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li><a href="/admin/product/list">상품</a></li>
			<li><a href="#">판매</a></li>
			<li><a href="#">브랜드</a></li>
			<li><a href="/admin/event/list">이벤트</a></li>
			<li><a href="/admin/cscenter/csAdminMain">문의</a></li>
			<li><a href="#">회원</a></li>
			<li><a href="/adminMember/adminLogin">관리자로그인</a></li>
			<li><a href="/adminMember/adminJoin">관리자계정생성</a></li> <!-- 임시 -->
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
	</div><!--/.nav-collapse -->
</div>