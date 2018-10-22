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
	<script>
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
			<div class="contsTrade">
				<div class="trade_box">
					<div class="sch_title addType">
						<ul>
							<li class="on"><a href="MyController?cmd=h_index">내가찜한점포</a></li>
							<li><a href="modify_agree.do">나의정보수정</a></li>
						</ul>
					</div>
					<div class="sch_view">
						<div class="view_content">
							<ul>
								<c:forEach var="k" items="${list}" varStatus="v">
									<li>
										<a href="MyController?cmd=listView&viewNum=${k.treade_idx}&u_idx=${mvo.u_idx}" >
											<div class="trade_img"><img src="resources/images/db/${k.t_image_1}" alt=""></div>
											<div class="trade_text">
												<p class="name"><span style="padding-right:20px;">매물정보 : ${k.treade_idx}</span><span>판매자 : ${k.u_name}</span></p>
												<p class="count">조회수 : ${k.edu_hit}</p>
												<p class="title">${k.edu_title}</p>
												<p class="price">순이익 : <span>${k.netprofit}</span></p>
											</div>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="paging_box">
							<!-- <ol class="paging">
								이전
						    	<li class="disable">이전으로</li>
						    	블록안에 들어간 페이지번호들	
								<li class="now">1</li>
								<li><a href="MyController?cmd=1&amp;cPage=2">2</a></li>
								<li><a href="MyController?cmd=1&amp;cPage=3">3</a></li>
								다음
						    	<li><a href="MyController?cmd=1&amp;cPage=4">다음으로 </a></li>		    
							</ol> -->
							<%-- <ol class="paging">
							<!-- 이전 -->
							    <c:choose>
							    	<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
							    		<li class="disable">이전으로</li>
							    	</c:when>
							    	<c:otherwise>
							    		<c:if test="${h_price == null && L_price == null}">
							    			<li>
								    			<a href="MyController?cmd=index&cPage=${pvo.beginPage-pvo.pagePerBlock }">	이전으로 </a>
								    		</li>
							    		</c:if>
							    		<c:if test="${h_price == 'h_price'}">
							    			<li>
								    			<a href="MyController?cmd=h_index&cPage=${pvo.beginPage-pvo.pagePerBlock }">	이전으로 </a>
								    		</li>
							    		</c:if>
							    		<c:if test="${L_price == 'L_price'}">
							    			<li>
								    			<a href="MyController?cmd=l_index&cPage=${pvo.beginPage-pvo.pagePerBlock }">	이전으로 </a>
								    		</li>
							    		</c:if>
							    		
							    	</c:otherwise>
							    </c:choose>
							    <!-- 블록안에 들어간 페이지번호들 -->
								<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage}" step="1">
									<c:choose>
										<c:when test="${k==pvo.nowPage }">
											<li class="now">${k}</li>
										</c:when>
										<c:otherwise>
											<c:if test="${h_price == null && L_price == null}">
												<li><a href="MyController?cmd=index&cPage=${k}">${k}</a></li>
											</c:if>
											<c:if test="${h_price == 'h_price'}">
												<li><a href="MyController?cmd=h_index&cPage=${k}">${k}</a></li>
											</c:if>
											<c:if test="${L_price == 'L_price'}">
												<li><a href="MyController?cmd=l_index&cPage=${k}">${k}</a></li>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 다음 -->
								<c:choose>
							    	<c:when test="${pvo.endPage >= pvo.totalPage }">
							    		<li class="disable">다음으로</li>
							    	</c:when> 
							    	<c:otherwise>
							    		<c:if test="${h_price == null && L_price == null}">
							    			<li><a href="MyController?cmd=index&cPage=${pvo.beginPage+pvo.pagePerBlock }">다음으로 </a></li>
							    		</c:if>
							    		<c:if test="${h_price == 'h_price'}">
							    			<li><a href="MyController?cmd=h_index&cPage=${pvo.beginPage+pvo.pagePerBlock }">다음으로 </a></li>
							    		</c:if>
							    		<c:if test="${L_price == 'L_price'}">
							    			<li><a href="MyController?cmd=l_index&cPage=${pvo.beginPage+pvo.pagePerBlock }">다음으로 </a></li>
							    		</c:if>
							    		
							    	</c:otherwise>
							    </c:choose>
							</ol> --%>
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