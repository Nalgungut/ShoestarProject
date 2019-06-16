<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
           <script type="text/javascript" src="/resources/include/js/common.js"></script>
            <!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/bootstrap.css"/> -->
            <link rel="stylesheet" href="/resources/include/css/default.css"/>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
            <!-- lightbox 라이브러리 -->
            <link rel="stylesheet" href="/resources/include/css/lightbox.css"/>
            <script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
           <script type="text/javascript">
				
			</script>
		</head>
	<body>
		<div class="table">
                            <table summary="주문일자, 상품명, 결제금액, 주문상세">
                                <caption>최근 주문 정보 목록</caption>
                                <colgroup>
                                    <col width="150">
                                    <col width="*">
                                    <col width="140">
                                    <col width="140">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><div class="tb-center">주문일자</div></th>
                                        <th><div class="tb-center">상품명</div></th>
                                        <th><div class="tb-center">결제금액</div></th>
                                        <th><div class="tb-center">주문상세</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                                                        <tr>
                                        <td><div class="tb-center">2018.08.08</div></td>
                                        <td><div class="tb-left">브레이브아머골지 외 1건</div></td>
                                        <td><div class="tb-center">52,820원</div></td>
                                        <td><div class="tb-center"><a href="javascript:order_detail('20180808142537-27377675220');"><img src="/images/d3/modern_simple/btn/btn_h14_search.gif" alt="조회"></a></div></td>
                                    </tr>
                                                                        <tr>
                                        <td><div class="tb-center">2017.06.05</div></td>
                                        <td><div class="tb-left">브레이브아머골지 외 1건</div></td>
                                        <td><div class="tb-center">44,500원</div></td>
                                        <td><div class="tb-center"><a href="javascript:order_detail('20170605190829-11631129358');"><img src="/images/d3/modern_simple/btn/btn_h14_search.gif" alt="조회"></a></div></td>
                                    </tr>
                                                                        <tr>
                                        <td><div class="tb-center">2017.04.29</div></td>
                                        <td><div class="tb-left">브레이브아머 면</div></td>
                                        <td><div class="tb-center">44,500원</div></td>
                                        <td><div class="tb-center"><a href="javascript:order_detail('20170429153402-17042321862');"><img src="/images/d3/modern_simple/btn/btn_h14_search.gif" alt="조회"></a></div></td>
                                    </tr>
                                                                        <tr>
                                        <td><div class="tb-center">2015.02.02</div></td>
                                        <td><div class="tb-left"><br><b>브레이브아머 골지</b><br><font color="fd6767"><b>어깨 2cm 업되는 효과!!</b></font><br>무한감격! 브레이브아머 골지!<br><font color="#808080"> 외 2건</font></div></td>
                                        <td><div class="tb-center">32,400원</div></td>
                                        <td><div class="tb-center"><a href="javascript:order_detail('20150202083240-58100154062');"><img src="/images/d3/modern_simple/btn/btn_h14_search.gif" alt="조회"></a></div></td>
                                    </tr>
                                                                        <tr>
                                        <td><div class="tb-center">2014.11.20</div></td>
                                        <td><div class="tb-left"><br><font color="fd6767"><b>[오늘주문 오늘받자!]</b></font><br><b>브레이브아머 골지</b><br><font color="fd6767"><b>어깨 2cm 업되는 효과!!</b></font><br>무한감격! 브레이브아머 골지!<br><font color="#808080"></font></div></td>
                                        <td><div class="tb-center">27,500원</div></td>
                                        <td><div class="tb-center"><a href="javascript:order_detail('20141120182132-49352284514');"><img src="/images/d3/modern_simple/btn/btn_h14_search.gif" alt="조회"></a></div></td>
                                    </tr>
                                                                                                    </tbody>
                            </table>
                        </div>
	</body>
</html>