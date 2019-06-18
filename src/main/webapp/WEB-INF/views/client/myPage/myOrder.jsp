<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
   <html>
      <head>
         <meta charset="UTF-8">
         
         <!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신버전의 방식으로 HTML보여주도록 설정하는법 -->
         <meta name="viewport" content="width=device-width initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
         <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
         
         <title>Insert title here</title>
         
         <!--모바일 웹 페이지 설정-->
         <link rel="shortcut icon" href="../image/icon.png"/>
         <link rel="apple-touch-icon" href="../image/icon.png"/>
      <!--    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"> -->
         <!--모바일 웹 페이지 설정 끝-->
         <!--<link rel="stylesheet" type="text/css" href=""/>-->
         
         <!-- 인터넷익스8 이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다. -->
         <!-- [if it IE 9] > <script src="js/html5shiv.js"></script><![endif] -->
         <!-- <link rel="stylesheet" type="text/css" href="../js/jquery-1.12.4.min.js">
         <!-- jQuery프레임워크 참조 -->         
           <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
           <script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
          
           <script type="text/javascript" src="/resources/include/js/sidebar.js"></script>
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
        
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <link rel="stylesheet" href="/resources/include/css/sidebar.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <!-- lightbox 라이브러리 -->
            
            
            <Style>
            	.ss{
            	color:red;
            	font-size:12px;}
            	#detail{
            	float:right;}
            </Style>
           <script type="text/javascript">
				
			</script>
		</head>
	<body>
		
			   
			       
			             <div class="container">
   
   						<div class="side-nav">
   						<ul class="nav navbar-nav side-nav">
			                <li>
			                    <a href="#" data-toggle="collapse" data-target="#submenu-1"><i class="fa fa-fw"></i>마이페이지 <i class="fa fa-fw"></i></a>
			                    <ul id="submenu-1" class="collapse">
			                        <!-- <li><a href="/member/modify"><i class="fa fa-angle-double-right"></i> 정보수정</a></li>
			                        <li><a href="/member/delete"><i class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
			                        <li><a href="#"><i class="fa fa-angle-double-right"></i> SUBMENU 1.3</a></li> -->
			                    </ul>
			                </li>
			                <li>
			                    <a href="#" data-toggle="collapse" data-target="#submenu-2"><i class="fa fa-fw fa-star"></i> 쇼핑정보 <i class="fa fa-fw fa-angle-down pull-right"></i></a>
			                    <ul id="submenu-2" class="collapse">
			                        <li><a href="#"><i class="fa fa-angle-double-right"></i> 주문내역</a></li>
			                        <li><a href="#"><i class="fa fa-angle-double-right"></i> 배송조회</a></li>
			                        <!-- <li><a href="#"><i class="fa fa-angle-double-right"></i> SUBMENU 2.3</a></li> -->
			                    </ul>
			                </li>
			                <li>
			                    <a href="#" data-toggle="collapse" data-target="#submenu-3"><i class="fa fa-fw fa-star"></i> 고객지원 <i class="fa fa-fw fa-angle-down pull-right"></i></a>
			                    <ul id="submenu-3" class="collapse">
			                        <li><a href="/cscenter/qnaBoard"><i class="fa fa-angle-double-right"></i> 1:1문의</a></li>
			                        <!-- <li><a href="/member/delete"><i class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
			                        <li><a href="#"><i class="fa fa-angle-double-right"></i> SUBMENU 1.3</a></li> -->
			                    </ul>
			                </li>
			                <li>
			                    <a href="#" data-toggle="collapse" data-target="#submenu-4"><i class="fa fa-fw fa-search"></i> 회원정보 <i class="fa fa-fw fa-angle-down pull-right"></i></a>
			                    <ul id="submenu-4" class="collapse">
			                        <li><a href="/member/modify"><i class="fa fa-angle-double-right"></i> 정보수정</a></li>
			                        <li><a href="/member/delete"><i class="fa fa-angle-double-right"></i> 회원탈퇴</a></li>
			                        <!-- <li><a href="#"><i class="fa fa-angle-double-right"></i> SUBMENU 1.3</a></li> -->
			                    </ul>
			                </li>
			              </ul>
			            </div>
			        <!-- </div> -->
			        <!-- /.navbar-collapse -->
			    
			
			   <!--  <div id="page-wrapper">
			        <div class="container-fluid">
			        <label>MyPage</label>
			            Page Heading
			            <div class="row" id="main" >
			                <div class="col-sm-12 col-md-12 well" id="content"> -->
			                   <table class="table">
			                   <label class="ss"><strong>&nbsp;&nbsp;주문상세내역</strong></label>
			                   <tr>
						           <th>주문번호</th>
						           <th>신발번호</th>
						           <th>제품명</th>
						           <th>사이즈</th>
						           <th>주문수량</th>
						           <th>가격</th>
						       </tr>
						            <c:forEach items="${detailList}" var="detailOrder">
						                  <tr>
						                     <td>${detailOrder.od_no}</td>
						                     <td>${detailOrder.pi_no}</td>
						                     <td>${detailOrder.pd_name}</td>
						                     <td>${detailOrder.ps_size}</td>
						                     <td>${detailOrder.oi_qty}</td>
						                     <td>${detailOrder.oi_price}</td>
						                  </tr>
						            </c:forEach>
					        </table> 
					        <!-- <input type="button" id="detail" name="detail" class="btn btn-default" value="상세조회"/> -->
			                    
			               <!--  </div> -->
			       <!--      </div>
			            /.row
			        </div>
			        /.container-fluid
			    </div>
			    /#page-wrapper
			    </div> -->
			    
			
			    
		
		</div>
	</body>
</html>