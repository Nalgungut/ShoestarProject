<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>이벤트</title>

	
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
	  <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />

	  <link rel="stylesheet" href="/resources/include/css/eventList.css" >
	  <script type="text/javascript" src="/resources/include/js/eventList.js" ></script>

	  <!-- 상위 버전 링크 추가 + jquery + bootstrap.js : 쓸 시 아래 주석 -->
	  <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script> -->
	  
	  <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js" ></script>
      <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>


	<style type="text/css">
		img{width: 500px; height: 400px;}
		li{list-style: none; }
		*{text-align: left;}
		#rowEventArea{margin-top: 100px;}
		.thumbnail{
			/* width: 315px; height: 145px; */ 
			width: 315px; height: 145px;
			padding: 0px; 
		}
		#thumImg{/* width: 315px; height: 145px; */width: 100%; height: 100%;}
		#cols{width: 340px;}
		.Event_td{padding: 0px;}
		.ts{width: 293px;}
		.topBorder{background-color: #F2EADF;} /* 제목 배경색 나중에 하자 ★ */
	</style>

	<script type="text/javascript">
		 $(function(){
			
			$(".EventTitle").click(function() {
				   var ev_no = $(this).parents("tr").attr("data-num");
					
			         $("#ev_no").val(ev_no);
			
			         $("#EventListform").attr({
			            "method" : "get",
			            "action" : "/event/detail"
			         });
			         $("#EventListform").submit();
		      });
			
			$(".EventTitle").hover(function(){
				
			/* 	// 이미지 속성 부여하면 같은 이미지로만 슬라이드..
				var ss = $(this).attr("data-thumb");
				//console.log(ss);
				var uThumb = "/shoestarStorage/eventThumb/"+ss;
				$(this).parents().find(".item").find("img").attr("src",uThumb);
	
				 */
				 
				// 제목 부트 스트랩 마우스 오버시 CSS 
				$("li").css("list-style","none");
				
				$(this).parent().css("list-style","disc");
			});
			
			
			// 부트스트랩 + 제이쿼리 상위 버전으로 제목에 커서 올릴 시 이동.. (상위버전 쓰면 충돌.. 사용 불가)
			/* $('.EventTitle').hover(function(){ // (e)는  작동하기 위해? 누른 값을 가져오는 얘 (없어도 있어도 상관 X)
				var value = $(this).attr("data-title");
				console.log(parseInt(value));
				
				//$(this).parents().find(".item").find("img").attr("data-slide-to",value);
				$('.carousel ol li').attr("data-slide-to", value);
				$('.carousel').carousel(parseInt(value));
				
			}, function() { // 이거는 썸네일이미지로 속성 변경시로 쓰면 될 듯.
				console.log("아닐시~");
				$('.carousel').carousel({
					  interval: 2000
					})
			});
			*/
		
			
			
		}); // function 종료
	

	</script>

	</head>
<body>
	<div id="Container">
	
	
		<div id="EvcontainerTitle"><h2 id="EvconTitle">이벤트</h2></div>
		
		<div id="EventList">
			<form id="EventListform" name="EventListform">
				<div id="EventTable">
					
				<input type="hidden" name="ev_no" id="ev_no" />
					
					<table id="EvnetViewTable">
						<tr>
							
							<!-- 시작 -->
							
							<!-- 이벤트 제목인  event_tab_A~D를 hover하면 그 제목에 해당하는 이미지로 뜬다. -->
							<td rowspan="7" class="Event_td" id="liSize">

									<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
									
									  <ol class="carousel-indicators">
									    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
									    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
									  </ol>
							
									  <div class="carousel-inner" role="listbox">
									  	
									  	
										<c:forEach var="evt" items="${eventList}" varStatus="status" end="3">
									  
									  	  <c:choose>
										  		<c:when test="${status.index == 0}">
											    <div class="item active">
												      <a class="EventImage" href="/event/detail?ev_no=${evt.ev_no}">
												      		<img class="siz" src="/shoestarStorage/eventThumb/${evt.ev_thumb}" alt="...">
												      </a>
											    </div>
											    </c:when>
											    
											    <c:otherwise>
											    <div class="item">
											      <a class="EventImage" href="/event/detail?ev_no=${evt.ev_no}">
											      		<img class="siz" src="/shoestarStorage/eventThumb/${evt.ev_thumb}" alt="...">
											      </a>
											    </div>
										    	</c:otherwise>
									    	</c:choose>
										 </c:forEach>
																			   	
									  </div>
									
									 
									  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
									    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									    <span class="sr-only">Previous</span>
									  </a>
									  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
									    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									    <span class="sr-only">Next</span>
									  </a>
									</div>									
					
							
							<!-- 끝 -->
							</td>
						</tr>
					
						<tr>
							<td style="border-bottom: 2px solid #595959;"></td></tr>
					
						<!-- 이벤트 4개 선택하면 그 항목 보이고 선택 안하면 최신별4개 ex: -->
						<c:forEach var="evt" items="${eventList}" varStatus="status" end="3">
							<tr class="evtno" data-num="${evt.ev_no}">
								
								<td class="Event_td ts topBorder" style="padding: 30px">
									<ul>
										<li>
											<a class="EventTitle" data-title="${status.index}" data-thumb="${evt.ev_thumb}">
													${evt.ev_title}							
											</a>
										</li>
									</ul>
									
								</td>
							</tr>
						</c:forEach>
						
						<tr>
							<td style="border-top: 2px solid #595959;"></td></tr>
					</table>
					
<!-- 					
					<table id="table2">
						<tr>
							<td id="tableB"><img alt="즉시 할인 상품 바로 보기" src="">즉시 할인 상품 바로 보기</td>
						</tr>
					</table>
		 -->
		 
				</div>
			</form>
		</div>
		
		<!-- 
						동적 생성할 event 리스트  : 생성 할 때마다 추가됨. >> 동적 말고 c:forEach 로 ㄱㄱ  여기서 forEach로 썸네일 이미지 + 링크 보여주기 > detail-->
		<%-- 이벤트 리스트 영역 --%>
		<div class="row" id="rowEventArea">
					
					 
		<c:forEach var="evt" items="${eventList}" varStatus="status">
			<div class="col-sm-6 col-md-4" id="cols">
				<div class="thumbnail">
					<a href="/event/detail?ev_no=${evt.ev_no}" data-lightbox="roadtrip">
						<img id="thumImg" src= "/shoestarStorage/eventThumb/thumbnail/thumbnail_${evt.ev_thumb}" alt="${evt.ev_title}">
					</a>
				</div>
			</div>
		</c:forEach>
	
		</div>
	</div>
</body>
</html>