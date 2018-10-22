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
	<script type="text/javascript" src="resources/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var more = 3;
			var num = parseInt($("#more").val());
			var count = $("#count").val();

			$(".morebtn").click(function() {
				if (!num){
					more = more + 3;
				} else {
					more = num + 3;
				}
				location.href="buylistNum.do?more="+more;
			});
			if (count <= num){
				$(".morebtn").css("display","none");
			}
		})
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
			<div class="contsTrade">
				<div class="trade_box">
					<div class="sch_title">
						<ul>
							<li style="width:99%; text-align: center;">매수 리스트</li>
						</ul>
					</div>
					<div class="sch_view">
						<div class="view_content">
							<ul>
								<c:forEach var="k" items="${list}" varStatus="v">
									<li class="v_listBox">
										<a href="listView.do?viewNum=${k.treadebuy_idx}&u_idx=${mvo.u_idx}" >
											<div class="trade_img"><img src="resources/images/db/${k.t_image_1}"></div>
											<div class="trade_text">
												<p class="name"><span style="padding-right:20px;">매물정보 : <span class="k_idx">${k.treadebuy_idx}</span></span><span>판매자 : ${k.u_name}</span></p>
												<p class="count">조회수 : ${k.edu_hit}</p>
												<p class="title">${k.b_edu_title}</p>
												<p class="price">순이익 : <span>${k.b_deposit}</span></p>
											</div>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div>
							<p class="morebtn">더보기</p>
							<input type="hidden" id="more" name="more" value="${more}">
							<input type="hidden" id="count" name="more" value="${count}">
						</div>
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