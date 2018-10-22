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
   
    function buytrade_aply() {
    	document.f.action="tradeAply2.do";
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
        
        
        var more = 3;
		var num = parseInt($("#more").val());
		var count = $("#count").val();

		$(".morebtn").click(function() {
			if (!num){
				more = more + 3;
			} else {
				more = num + 3;
			}
			location.href="reference_room1.do?more="+more;
		});
		if (count <= num){
			$(".morebtn").css("display","none");
		}
        
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
					<h2>매수등록</h2>
				</div>
				<div class="viewTbl">
					<table class="general_board">
						<caption class="hidden">문서,서식,출판 게시판 목록 : 게시글의 제목, 첨부, 작성자, 날짜, 조회수를 보여줍니다.</caption>
						<colgroup>
							<col class="dp_pc w10p">
							<col>
							<col class="dp_pc w8p">
							<col class="dp_pc w15p">
							<col class="dp_pc w10p">
							<col class="dp_pc w10p">
						</colgroup>
						<thead>
							<tr>
								<th class="dp_pc" scope="col">No</th>
								<th scope="col">제목</th>
								<th class="dp_pc" scope="col">첨부</th>
								<th class="dp_pc" scope="col">작성자</th>
								<th class="dp_pc" scope="col">날짜</th>
								<th class="dp_pc" scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="k" items="${list}" varStatus="v">
								<tr>
									<td class="dp_pc">${v.index+1}</td>
									<td class="title"><a href="reference_view.do?data_idx=${k.data_idx}">${k.d_title}</a></td>
									<td class="dp_pc"><img src="resources/images/ic_file.gif" alt="첨부파일 있음"></td>
									<td class="dp_pc">${k.d_department}</td>
									<td class="dp_pc">${k.t_day}</td>
									<td class="dp_pc">${k.t_count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div>
					<p class="morebtn">더보기</p>
					<input type="hidden" id="more" name="more" value="${more}">
					<input type="hidden" id="count" name="more" value="${count}">
				</div>
			</div>
		</section>
		<jsp:include page="left_baner.jsp"></jsp:include>
		<jsp:include page="right_baner.jsp"></jsp:include>
		<jsp:include page="footerInc.jsp"></jsp:include>
	</section>
</body>
</html>