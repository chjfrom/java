<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>점포 매물 사이트</title>
	<link rel="stylesheet" type="text/css" href="resources/css/common.css" />
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.bxslider.css" />
	<script type="text/javascript" src="resources/js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="resources/js/jquery.bxslider.js"></script>
	<script type="text/javascript">
   
    function trade_aply() {
    	document.f.action="tradeAply.do";
		document.f.submit();	
	}
    
    $(document).ready(function(){
        $('.bxslider').bxSlider({
  	  		auto: true,
  			autoControls: true,
  			stopAutoOnClick: true,
  			pager: true,
  			slideWidth: 800
  		});
      });
  </script>
</head>
<body>
	<section id="wrap">
		<jsp:include page="headerInc.jsp"></jsp:include>
		<section id="container">
			<div class="contsTop">
				<div class="bxslider">
					<div><img src="resources/images/img01.jpg" alt=""></div>
					<div><img src="resources/images/img01.jpg" alt=""></div>
				</div>
			</div>
			<div class="trade_aply">
				<div id="sub_tit">
					<h2>매물등록</h2>
				</div>
				<div class="viewTbl">
					<form method="post" name="f" enctype="multipart/form-data">
						<table class="table_st01" summary="">
							<caption></caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">학원분류</th>
									<td colspan="3">
										<select name="eduK_step1" style="width:120px; margin-right:10px;">
											<option value="">분류선택</option>
											<option value="학습지">학습지</option>  
											<option value="어학원">어학원</option>           
											<option value="입시/보습">입시/보습</option>          
											<option value="피아노/미술">피아노/미술</option>          
											<option value="독서실">독서실</option>          
											<option value="기타학원">기타학원</option>                
										</select>
										<select name="eduK_step2" style="width:120px;">
											<option value="">상세분류</option>
											<option value="영어학원">영어학원</option>
											<option value="영어유치원">영어유치원</option>
											<option value="놀이학교">놀이학교</option>
											<option value="성인어학원">성인어학원</option>
											<option value="기타어학원">기타어학원</option>
											<option value="어학원시설">어학원시설</option>
											<option value="중국어학원">중국어학원</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">지역</th>
									<td colspan="3">
										<select name="areaK_step1" style="width:120px; margin-right:10px;">
											<option value="">시/도(선택)</option>
											<option>서울특별시</option>
											<option>경기도</option>
											<option>인천광역시</option>
											<option>부산광역시</option>
											<option>대구광역시</option>
											<option>대전광역시</option>
											<option>광주광역시</option>
											<option>울산광역시</option>
											<option>강원도</option>
											<option>경상남도</option>
											<option>경상북도</option>
											<option>전라남도</option>
											<option>전라북도</option>
											<option>충청남도</option>
											<option>충청북도</option>
											<option>제주특별자치시</option>
											<option>세종특별자치시</option>
										</select>
										<select name="areaK_step2" style="width:140px;">
											<option value="">군/구(선택)</option>
											<option>강남구</option>
											<option>강동구</option>
											<option>강북구</option>
											<option>강서구</option>
											<option>관악구</option>
											<option>광진구</option>
											<option>구로구</option>
											<option>금천구</option>
											<option>노원구</option>
											<option>도봉구</option>
											<option>동대문구</option>
											<option>동작구</option>
											<option>마포구</option>
											<option>서대문구</option>
											<option>서초구</option>
											<option>성동구</option>
											<option>성북구</option>
											<option>송파구</option>
											<option>양천구</option>
											<option>영등포구</option>
											<option>용산구</option>
											<option>은평구</option>
											<option>종로구</option>
											<option>중구</option>
											<option>중랑구</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">층수구분</th>
									<td><input type="text" name="bulid_h" style="width:30px;"> 층 </td>
									<th scope="row">면적</th>
									<td>분양 <input type="text" name="edu_extends" style="width:30px;"> 평</td>
								</tr>
								<tr>
									<th scope="row">보증금</th>
									<td><input type="text" name="deposit"> 만원</td>
									<th scope="row">월세</th>
									<td><input type="text" name="monthly_rent"> 만원</td>
								</tr>
								<tr>
									<th scope="row">원생수</th>
									<td><input type="text" name="student_num"> 명</td>
									<th scope="row">월세매출</th>
									<td><input type="text" name="month_sales"> 만원</td>
								</tr>
								<tr>
									<th scope="row">순이익</th>
									<td><input type="text" name="netprofit"> 만원</td>
									<th scope="row">권리금</th>
									<td><input type="text" name="premium"> 만원</td>
								</tr>
								<tr>
									<th scope="row">학원소개</th>
									<td colspan="3">
										<textarea name="edu_introduce" style="width:100%; height:100px;">학원소개(입지,시설,상태,수입지출,내역등)</textarea>
									</td>
								</tr>
								<tr>
									<th scope="row">매물 제목</th>
									<td colspan="3"><input type="text" name="edu_title" style="width:100%;"></td>
								</tr>
								<tr>
									<th scope="row">비밀번호</th>
									<td><input type="text" name="trade_pass"></td>
									<th scope="row">학원이름</th>
									<td><input type="text" name="edu_name"></td>
								</tr>	
								<tr>
									<th scope="row">이미지1</th>
									<td><input type="file" name="t_image_1"></td>
									<th scope="row">이미지2</th>
									<td><input type="file" name="t_image_2"></td>
								</tr>
								<input type="hidden" name="u_idx" value="${mvo.u_idx}" />
								<input type="hidden" name="u_name" value="${mvo.u_name}" />
							</tbody>
						</table>
					</form>
					<div class="btn_cen">
						<a class="btn_st04"><span onclick="trade_aply()">등록하기</span></a>
						<a class="btn_st03"><span>다시작성</span></a>
					</div>
				</div>
			</div>
		</section>
		<jsp:include page="left_baner.jsp"></jsp:include>
		<jsp:include page="right_baner.jsp"></jsp:include>
		<jsp:include page="footerInc.jsp"></jsp:include>
	</section>
</body>
</html>