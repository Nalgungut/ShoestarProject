/**
 * 상품 정보를 읽어오는 자바스크립트 모음
 * @author 배정훈
 */


/* ------------------------------------- 상수 ------------------------------------- */

/** 상품 이미지 저장소의 URL */
const PROD_IMAGE_STORATE_URL = "/shoestarStorage/prod/";

/** 상품 이미지 저장소의 URL */
const PROD_THUMB_STORATE_URL = "/shoestarStorage/prod/thumb/";

/** 상품 페이지의 uri */
const PROD_URI_MAPPING = "/product/";

const PROD_NO_IMAGE = "/resources/images/product/noimage.png";


/* ------------------------------------- prod 관련 함수들 ------------------------------------- */

/**
 * 상품 목록을 보여주는 함수
 * @param searchReq 요청값
 */
function showProductList(searchReq) {
	stopSearchForSecond = true;
	toggleLightbox(true);
	
	$.ajax({
		url: "/product/getList" + searchReq,
		type: "get",
		dataType: "json",
		error: function() {
			$("#itemList").append(createErrorList("상품 정보를 불러올 수 없었습니다.", "div").addClass("text-center emptyResult"));
			toggleLightbox(false);
		},
		success: function(data) {
			if(!jQuery.isEmptyObject(data)) {
				$.each(data, function(index, stack) {
					$("#itemList").append(createProductDiv(stack));
					$("#itemList").append(createProductDiv(stack));
					$("#itemList").append(createProductDiv(stack));
					$("#itemList").append(createProductDiv(stack));
					$("#itemList").append(createProductDiv(stack));
				});
			} else {
				if($("#itemList").html().isEmpty()) {
					$("#itemList").append(createErrorList("검색 결과가 없습니다.", "div").addClass("text-center emptyResult"));
				} else {
					endOfSearch = true;
				}
			}
			stopSearchForSecond = false;
			toggleLightbox(false);
		}
	});
}

/**
 * 로딩 라이트박스 토글
 * @param toggleTo 표시하려면 true
 */
function toggleLightbox(toggleTo) {
	$("body").append($(".loadingLightbox"));
	$(".loadingLightbox").prop("hidden", !toggleTo);
}

/**
 * 상품정보를 매개변수로 이미지와 가격등이 표시되는 div를 만들어내는 함수
 * @param prodVO 상품 정보를 담은 ProdVO JSON 객체
 * @param noLink 링크 없애기
 * @returns jQuery div 객체
 */
function createProductDiv(prodVO, noLink) {
	// 이미지 부분
	var pImageSection = $("<div>").addClass("prodImage text-center");
	var imgUrl;
	if(prodVO.pim_main == null) {
		imgUrl = PROD_NO_IMAGE;
	} else {
		imgUrl = PROD_THUMB_STORATE_URL + prodVO.pim_main;
	}
	var pImage = $("<img>").attr({
			"src" : imgUrl,
			"alt" : prodVO.pd_name
		}).addClass("img-rounded").css({
			"width":200,
			"height":200
		});
	pImageSection.append(pImage);
	
	// 신규, 인기, 세일, 품절등 정보 표시란
	var pEventSection = $("<div>").addClass("prodEvent text-right");
	// 공백 잡기
	var prodStatEmpty = $("<span>").addClass("prodStat invisible");
	// 세일가 표시
	pEventSection.append(prodStatEmpty).append(createDiscountLabel(prodVO, false));
	// 기타 상태
	var prodStatNew = $("<span>").text("신규").addClass("prodStat prodStat_new");
	var prodStatHot = $("<span>").text("인기").addClass("prodStat prodStat_hot");
	if(!jQuery.isEmptyObject(prodVO.pd_status)) {
		switch (prodVO.pd_status.toLowerCase()) {
		case "n": // 신규
			pEventSection.append(prodStatNew);
			break;
		case "h": // 인기
			pEventSection.append(prodStatHot);
			break;
		case "b": // 둘 다
			pEventSection.append(prodStatNew);
			pEventSection.append(prodStatHot);
			break;
		default: // 아무 것도 안하기
			break;
		}
	}
	
	// 이름 표시
	var pNameSection = $("<div>").text(prodVO.pd_name).addClass("prodName text-left");
	// 분류  표시
	var pCtgSection = $("<div>").text(prodVO.pct_name).addClass("prodCtg text-left");
	
	// 가격 표시
	var pPriceSection = $("<div>").addClass("priceSection text-right");
	var pSmallPrice = $("<span>").addClass("prodPrice prodPrice_depricate");
	var pActualPrice = $("<span>").addClass("prodPrice");
	pPriceSection.append(pSmallPrice).append(pActualPrice);
	// 할인 정보 존재 시 정보 표시  
	if(!isNaN(prodVO.pd_discount) && prodVO.pd_discount != 0) {
		pSmallPrice.text(prodVO.pd_price + "원");
		pActualPrice.text(calculateDiscount(prodVO.pd_price, prodVO.pd_discount) + "원").addClass("prodPrice_discount");
	} else {
		pSmallPrice.text("e").addClass("invisible");
		pActualPrice.text(prodVO.pd_price + "원").addClass("prodPrice_normal");
	}
	
	// 별점 표시
	var pRatingSection = $("<div>").addClass("ratingSection text-center");
	pRatingSection.append(createRatingLabel(prodVO, false));
	
	// 조립
	var pColumn = $("<div>").addClass("prodContainer");
	pColumn.append(pImageSection).append(pEventSection).append(pNameSection).append(pCtgSection).append(pPriceSection).append(pRatingSection);
	
	var hrefLink = PROD_URI_MAPPING + "prod?";
	var pclno = null;
	try {
		var pclno = getRequestValue("color");
	} catch (e) {
	}
	
	if(pclno != null) {
		hrefLink = hrefLink + "pd_no=" + prodVO.pd_no + "&color=" + pclno;
	} else if(prodVO.pi_main != 0) {
		hrefLink = hrefLink + "pi_no=" + prodVO.pi_main;
	} else {
		hrefLink = hrefLink + "pd_no=" + prodVO.pd_no;
	}
	
	if(noLink == null || noLink == false) {
		pColumn.css({"cursor":"pointer"}).on("click", function() {
			location.href = hrefLink;
		});
	}
	
	return pColumn;
}


/* ------------------------------------- prodDetail 관련 함수들 ------------------------------------- */

/**
 * 상품 페이지의 다른 색상 정보를 표시하는 박스 생성
 * @param pinsVO
 * @param pinoToExclude 제외할 pi_no 번호
 * @returns li 객체
 */
function createPinsBox(pinsVO, pinoToExclude) {
	if(pinsVO.pi_no == pinoToExclude) {
		return null;
	}
	
	var pia = $("<a>").attr({
		"href" : "?pi_no=" + pinsVO.pi_no
	});
	
	var imagesrc = pinsVO.mainImage != null ? PROD_THUMB_STORATE_URL + pinsVO.mainImage : PROD_NO_IMAGE;
	var pimg = $("<img>").attr({
			"src" : imagesrc,
			"title" : pinsVO.pcl_name
		}).css({
		"width" : 50,
		"height" : 50
	});
	
	var pili = $("<li>").addClass("pinsBox");
	
	pili.append(pia.append(pimg));
	return pili;
}

/**
 * 섬네일 리스트를 만들어 li 객체를 리턴하는 ㅎ마수
 * @param pimVO prodImageVO의 json 정보
 * @param largeImage 큰 이미지를 표시할 img 객체
 * @param thumbSize 표시할 이미지 섬네일의 가로 세로 크기. 기본 값 80px
 * @returns li 객체
 */
function createImageBox(pimVO, largeImage, thumbSize) {
	
	// li
	var pimli = $("<li>").addClass("pimThumbList text-center").css({
		"width":thumbSize
	});
	if(largeImage && largeImage.attr("src") == "") {
		largeImage.attr("src", PROD_IMAGE_STORATE_URL + pimVO.pim_file);
		pimli.addClass("pimSelected");
	}
	
	// a
	var pima = $("<a>").attr({
		"href" : PROD_IMAGE_STORATE_URL + pimVO.pim_file
	}).on("click mouseover", function(event) { // 클릭 시 큰 이미지 src 변경
		event.preventDefault();
		if(largeImage) {
			largeImage.attr("src", $(this).attr("href"));
			$(".pimThumbList").each(function() {
				$(this).removeClass("pimSelected");
			});
			$(this).closest("li.pimThumbList").addClass("pimSelected");
		}
	});
	
	if(!thumbSize) {
		thumbSize = "80";
	}
	
	// img
	var pimg = $("<img>").attr({
		"src" : PROD_THUMB_STORATE_URL + pimVO.pim_file
	}).css({
		"width":thumbSize+"px",
		"height":thumbSize+"px"
	});
	
	// 조립
	pimli.append(pima.append(pimg));
	return pimli;
}


/**
 * 사이즈 정보를 읽어와 option 태그를 생성하는 함수
 * @param pinsVO
 * @returns option 객체
 */
function createSizeOption(psVO) {
	var poption = $("<option>").text(psVO.ps_size);
	if(psVO.ps_qty <= 0) {
		poption.prop("disabled", true).text(poption.text() + " 매진").addClass("outOfStock");
	} else if(psVO.ps_status != null && psVO.ps_status != "") {
		poption.prop("disabled", true).addClass("outOfStock");
	}
	
	return poption;
}


/* ------------------------------------- 유틸리티 ------------------------------------- */



/**
 * 상품 정보를 토대로 할인율 라벨을 만드는 함수
 * @param prodVO 상품 정보를 담은 prodVO JSON 객체
 * @param enlarge 라벨의 크기를 키울지 여부. 기본 값은 false.
 * @returns 할인율 %를 표시한 jQuery div 객체. 할인이 존재하지 않을 경우 sr-only로 숨겨짐
 */
function createDiscountLabel(prodVO, enlarge) {
	var discountRate = prodVO.pd_discount;
	
	// 리턴할 객체
	var dcLabel = $("<span>").addClass("prodStat prodStat_dc sr-only");
	
	// 할인 정보 담기
	if(discountRate != 0) {
		dcLabel.removeClass("sr-only").text("-" + discountRate + "%");
	}
	
	// 크기 조절
	if(typeof enlarge === "boolean" && enlarge) {
		dcLabel.addClass("prodStat_enlarge");
	}
	
	return dcLabel;
}


/**
 * 상품 정보를 토대로 평점 평균을 계산하고 라벨로 만들어주는 함수
 * @param prodVO 상품 정보를 담은 prodVO JSON 객체
 * @param 라벨의 크기를 키울지 여부. 기본 값은 false.
 * @returns 평점을 표시한 jQuery div 객체. 평점이 존재하지 않을 경우 sr-only로 숨겨짐
 */
function createRatingLabel(prodVO, enlarge) {
	
	// TODO: 평점 관련 작업
	
	// 크기 조절
	if(typeof enlarge === "boolean" && enlarge) {
		//TODO: 크게 만들기
	}
	return null;
}




/* ------------------------------------- 끝 ------------------------------------- */

