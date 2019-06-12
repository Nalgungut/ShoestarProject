<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세 페이지</title>

<script type="text/javascript"
	   src="/resources/include/js/jquery-1.12.4.min.js"></script>

<style type="text/css">
	/* 전체 가운데로 정렬점 */
	#container{ 
		/* position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%); */
	    margin-left: 80px;
		width: 100%;
		height: 100%;   
	}
    	
	#htitle{
		text-align: center; font-weight: bold; 
		font-size: 45px; /* text-decoration: underline; */
		margin-bottom: 5px; margin-right: 90px; 
		/* border-bottom: 2px solid black; border-bottom-width: 100px; */
	}
	
	.marg5{margin: 5px; }
	.margT3{
		margin-top: 3px; height: 2px; margin-bottom: 10px;
	}
	
	#borBottom{border-bottom: 2px solid black; }
	.gray{color: gray;}
	.Dinline{display: inline;}
	.Dblock{display: inline-block;}
	#ev_date, #ev_edate{font-size: 21px; color:gray; }
	#ev_title{font-size: 30px; font-weight: bold; clear: both;}
	#EDetail_title{margin-bottom: 10px; margin-top: 20px;}
	.Eventimage{width: 80%; height: 80%;}
	
	#Event_note{}
	#cont{background-color: #ECE8ED; margin: 10px; width: 80%;}
	#Event_note_title{font-size: 20px; font-weight: bold; margin-top: 15px;}
	#Event_note_title:{}
	#ev_img{size: 500px;}
	hr {
		color: #2E2C41; background-color: #2E2C41; border-color: #2E2C41;
		width: 82%; height: 2px; float: left; margin-top: 5px; 
		}
	#ev_content{clear: both;  padding: 10px;}
	#evListBtn{
		width: 100px; height:40px;
		border: 0px; color: white;
		margin-left: 280px; margin-bottom: 5px;
	}
	#evListBtn:hover{
		background-color: #BFBFBF;
	}
</style>

<script type="text/javascript">
	$(function() {
		$("#ev_content").hide();
		
		
		$("#Event_note_title").click(function(){
			$("#ev_content").toggle();
		});
		
		var img = $("<img>");
			img.attr({"src":"/shoestarStorage/event/${detail.ev_img}",
					  "alt":"${detail.ev_title}"});
			img.addClass("Eventimage");
			$("#ev_img").append(img);
	
	
		$("#evListBtn").click(function() {
			location.href="/event/list";
		})	
	
	
	});
</script>
</head>
<body>
	<div id="container">
		<div id="title">
			<h1 id="htitle">이벤트</h1>
			<!-- <br class="marg5" />
			
			<br class="marg5" /> -->
			
		<div id="EDetail_title">
			<div id="ev_title" class="Dinline">
				${detail.ev_title}
			</div>
				 <span class="gray" style="font-size: 30px; margin-left: 10px; margin-right: 10px;">|</span> 
			<div id="ev_date" class="Dinline">
				<fmt:formatDate pattern="yyyy-MM-dd" value="${detail.ev_date}" />
			</div>
				 ~ 
			<div id="ev_edate" class="Dblock">
				<!-- c:chose 해서 값이 != null 이면 무기한 이라고 써놓기 null 아니면 날짜 뜨는 형식 -->
				<fmt:formatDate pattern="yyyy-MM-dd" value="${detail.ev_edate}" />
			</div>
			
			<!-- 여기도 마찬가지로 값이 null이면 margin-right로 넒게하기 -->
			<input type="button" id="evListBtn" value="이벤트 목록" />
			
			<hr class="margT3"/>
			
		</div>
			
		
		</div>
		
		
		
		<div id="ev_img">
		
		</div>
		
		<br />
		
		<div id="Event_note">
			<div id="Event_note_title">
				설명 및 유의 사항
			</div>
			
			<hr />
			<br id="flet" />
			
			<div id="cont">
				<div id="ev_content">
						${detail.ev_content}
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>