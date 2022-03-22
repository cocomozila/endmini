<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready(function () {
	document.getElementById("logo").addEventListener("click", ()=>{
        location.href = "index.html";
    });
	var shopping = []		
	function items(kategorie,position){
		this.kategorie = kategorie;
		this.position = position;
		$.ajax({
			url: '<%=request.getContextPath() %>/ajax/login',
			data : {'id':$("#id").val(), 'password':$("#password").val() } , 
			type : 'post' ,
			dataType: 'json',
			success : function(a){ //ajax 응답 - 서버 String json형태
				// a 객체- json
				//JSON.stringify(a)스트링 변환
				alert(JSON.stringify(a));//한글
				$("#loginresult").html("<h3>" + a.role + " 로 로그인</h3>");
				$("#loginresult").append("<h3> 관리자 역할로 " + a.process + "</h3>");
			}
		this.itemsList = function(){
			for (var i = 0; i < this.kategorie.length; i++){ 
				$(this.position).append("<div class='product'>\
						<img class='p_img' src='image/"+this.kategorie[i][0]+".webp'>\
						<div><p>베스트 셀러</p></div>\
						<div><p>"+this.kategorie[i][1]+"</p></div>\
						<div><p>"+this.kategorie[i][2]+"</p></div>\
						<div><p>"+this.kategorie[i][3]+"</p></div>\
						<div><button class='btn' type='button' value="+this.kategorie[i][0]+">저장하기</button></div></div>");
			};
		}
		this.PngItemList = function(){
			for (var i = 0; i < this.kategorie.length; i++){ 
				$(this.position).append("<div class='product'>\
						<img class='p_img' src='image/"+this.kategorie[i][0]+".png'>\
						<div><p>베스트 셀러</p></div>\
						<div><p>"+this.kategorie[i][1]+"</p></div>\
						<div><p>"+this.kategorie[i][2]+"</p></div>\
						<div><p>"+this.kategorie[i][3]+"</p></div>\
						<div><button class='btn' type='button' value="+this.kategorie[i][0]+">저장하기</button></div></div>");
			};
		}//functionend
	
	}//생성자 end
	
	
	/*상품 생성*/
	var cologneAllList = new items(cologne,"#cologne");
	var faceCareAllList = new items(faceCare,"#faceCare");
	var candleAllList = new items(candle,"#candle");
	var defuserAllList = new items(defuser,"#defuser");
	
	cologneAllList.itemsList();
	faceCareAllList.itemsList();
	candleAllList.itemsList();
	defuserAllList.PngItemList();

	/*제품선택필터*/		
	$('.filter_drop input:checkbox').on('click',function(){
		if($(this).attr('checked') == undefined){
			$(this).attr('checked' , 'checked') // checked 변경
			$(".filter_drop input:checkbox[name=productKategorie]").each(function () {
				var a = ($(this).val());
				document.getElementById(a).style.display = 'none';
			
			});	
			$("input:checkbox[name=productKategorie]:checked").each(function () {
	    		var a = ($(this).val());
				document.getElementById(a).style.display = '';
			});
		}
		else{
				$(this).removeAttr('checked');//체키드상태 없애자
				var a = ($(this).val());
				document.getElementById(a).style.display = 'none';
				if($("input:checkbox[name=productKategorie]:checked").length == 0 ){
					$(".perfumeProduct div").css("display","block");
				}
		}
		 
	});
	/*필터메뉴내리고올리고*/	
	$('.filterKategorie').on('click',function(){
		$(".filterKategorie span").html("&or;");
		if(document.getElementById("a").style.display == '' ){
			document.getElementById("a").style.display = 'none';
		}
		else 
		{	$(".filterKategorie span").html("&and;");
			document.getElementById("a").style.display = '';}	
	});
	
	/*클릭한 제품 동일성 여부 판단해서 리스트에 추가함*/	
	$('.product div button').on('click',function(){
		if(shopping.indexOf($(this).val())== -1){
			shopping.push($(this).val());
			$(".Kategorie span").text(shopping.length+" pick");
			console.log(shopping);
			
		};
		
	});
	
	/*쇼핑백 클릭시 제품명 다른 html로 전달*/	
	$('.list').on('click',function(){
		$('.list').attr("value",shopping);
		newwin = open("giftGiving.html", "추천페이지", 
			"top=0, left=300, width=1200, height=1200 ");

			
	});
	/*subMostLoved page end================================================================================================================== */
	}//생성자 end
	
	//상품생성
	var chooseItem = new item(pList,"#lovedItem");
	chooseItem.pitem();
	
	/*Select Cologne 선택필터*/
	var count =0;
	var selcterE ="";
	$('.finderRight div').css('display','none');
	$('.finderRP0').css('display','block');
	$('input:radio').on('click',function(){
		if($(this).attr('checked') == undefined){
			$(this).attr('checked' , 'checked') // checked 변경	
		}
		else{
			$(this).removeAttr('checked');//체키드상태 없애자
		}
		 
	});
	var selectResult =[]
	$(document).on("click","#next_btn", function(){
		if($('.finderRP'+count).css('display')=='block'){
			var selcterE =$('input:radio[name=finder]:checked').val();
			if(selcterE != undefined){
				selectResult.push(selcterE);
			}
				
		   $('.finderRP'+count++).css('display','none');
  		   $('.finderRP'+count).css('display','block');
		}
	});
	$(document).on("click",".stresult", function(){
		var selectresulttext="";
		var b =[]; 
		for (var i = 0; i < cologne.length; i++){
				if(cologne[i][4] == selectResult[0]){
					if(b.indexOf == -1){
						b.push(cologne[i])
					}
				}
				if(cologne[i][5] == selectResult[1]){
					if(b.indexOf == -1){
						b.push(cologne[i])
					}
				}
				if(cologne[i][6] == selectResult[2]){
					if(b.indexOf == -1){
						b.push(cologne[i])
					}
				}		
		};
		for (var i = 0; i < b.length; i++){
		/*	if(selectResult[0] == b[i][4] && selectResult[1] == b[i][5] && selectResult[2] == b[i][6]){
				selectresulttext=b[i][1];
			}else*/ if(selectResult[0] == b[i][4] || selectResult[1] == b[i][5] || selectResult[2] == b[i][6]){
				selectresulttext=b[i][1];
			};
		}
		console.log(selectresulttext);
		$('#selectCologne').append('당신에게 어울리는 향수는'+'"'+selectresulttext+'"'+'입니다.');
	});	
});
</script>
        <meta charset="UTF-8">
        <Title>조말론 부티크 :: 4조</Title>
        <link rel="stylesheet" type="text/css" href="resources/css/index.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
        <script type="text/javascript" src="index.js"></script>
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png"/>
    </head>
<body>
 <body>
        <div class="wrap">
            <div class="nav_area">
                <div id="hamburger">
                    <a href=""></a>
                    <ul id="hamburger_1">
                        <li><a href="subMostLoved.html">쇼 핑 하 기</a></li>
                        <li><a href="#">선 물 하 기</a></li>
                        <li><a href="#">조 말론 런던 하우스</a></li>
                    </ul>
                </div>
                <ul id="nav_left">
                    <li id="nav_list"><a href="subMostLoved.html">쇼 핑 하 기</a></li>
                    <li id="nav_list">선 물 하 기</li>
                    <li id="nav_list">조 말론 런던 하우스</li>
                </ul>
                <div id="logo"></div>
                <div id="nav_icon_area">
                    <a>
                        <li class="icon" id="nav_icon1"></li>
                    </a>
                    <a href="Login.html">
                        <li class="icon" id="nav_icon2"></li>
                    </a>
                    <a>
                        <li class="icon" id="nav_icon3"></li>
                    </a>
                    <a href="cart.html">
                        <li class="icon" id="nav_icon4"></li>
                    </a>
                </div>
            </div><!-- nav end -->
	<div class="main">
		<div class="filterMenu">
			<div class="filterKategorie"><p>필터: 제품 카테고리 <span>&or;</span></p></div>
			<div id="a" class ="filter_drop" style="display:none;">
				<span><input type="checkbox" name="productKategorie" value="cologne">코롱</span>
				<span><input type="checkbox" name="productKategorie" value="faceCare">페이스케어</span>
				<span><input type="checkbox" name="productKategorie" value="candle">캔들</span>
				<span><input type="checkbox" name="productKategorie" value="defuser">디퓨저</span>
			</div>
		 </div>
		 <div class=product_bg>
			<div class="perfumeProduct">
				<div id ="cologne">
				</div>
				<div id ="faceCare">
				</div>
				<div id ="candle">
				</div>
				<div id ="defuser">
				</div>
			</div>
		</div>
		<div class="perfumeProductBanner"></div>
	</div>
	<div id="footer_area">
		<div id="footer_1">
			<ul class="footer_1_contents">
				<li>고객 서비스</li>
				<li>자주 묻는 질문</li>
				<li>고객관리지원팀</li>
				<li>나의프로필</li>
				<li>나의 오더</li>
				<li>주문 조회</li>
			</ul>
			<ul class="footer_1_contents">
				<li>회사 소개</li>
				<li>법인 정보</li>
				<li>법인 판매</li>
				<li>커리어</li>
			</ul>
			<ul class="footer_1_contents">
				<li>소셜 네트워크</li>
				<li>인스타그램</li>
				<li>페이스북</li>
				<li>유튜브</li>
			</ul>
		</div>
		<div id="footer_2">
			<div id="footer_2_1">
				<ul>
					<li>© Jo Malone London 2021</li>
					<li>대한민국</li>
					<li>이용약관</li>
					<li>개인정보 처리방침</li>
				</ul>
			</div>
			<div id="footer_2_2">
				<ul>
					<hr><br>
					<li>4조(주) 대표: 박멀티, 서울특별시 강남구 대치동 889-41, 06232</li>
					<li>사업자등록번호: 000-00-00000</li>
					<li>통신판매업신고번호: 강남-00000호</li>
					<li>사업자정보조회</li>
					<li>고객관리지원팀: (02) 0000-0000  multicampus@google.com</li>
					<li>호스팅서비스 사업자: ㈜멀티캠퍼스</li>
				</ul>
			</div>                    
		</div>
	</div>
</div>
</body>
</html>