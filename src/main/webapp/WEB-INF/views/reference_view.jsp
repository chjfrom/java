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
					<div class="board_view">
						<p class="title">${onelist.d_title}</p>
						<ul class="datalist">
							<li>
								<dl>
									<dt>작성자</dt>
									<dd>${onelist.d_write}</dd>
								</dl>
								<dl>
									<dt>작성일</dt>
									<dd>${onelist.t_day}</dd>
								</dl>
								<dl>
									<dt>조회수</dt>
									<dd>${onelist.t_count}</dd>
								</dl>
							</li>
							<li>
								<dl>
									<dt>담당부서</dt>
									<dd>${onelist.d_department}</dd>
								</dl>
								<dl>
									<dt>전화번호</dt>
									<dd>${onelist.d_phon}</dd>
								</dl>
							</li>
							<li class="addfile">
								<dl>
									<dt>첨부파일</dt>
									<dd>
										<ul>	
											<li>
												<a href="file_down.do?d_filename=${onelist.d_filename}&data_idx=${onelist.data_idx}" target="_blank">${onelist.d_filename}</a>
											</li>
										</ul>
									</dd>
								</dl>
							</li>
						</ul>
						<div class="con">
							${onelist.d_title}
						</div>																					
					</div>
					<p class="btnBox">	
						<a href="reference_room.do" class="btns btn_back">목록</a>						
					</p>
					<ul class="other_con">	
						<li>
							<span class="prev">이전글</span>
							<c:choose>
								<c:when test="${beforelist == null}">
									<p>이전글이없습니다.</p>
								</c:when>
								<c:otherwise>
									<a href="reference_view.do?data_idx=${beforelist.data_idx}" title="이전글">${beforelist.d_title}</a>
								</c:otherwise>
							</c:choose>				
						</li>
						<li>			
							<span class="next">다음글</span>
							<c:choose>
								<c:when test="${afterlist == null}">
									<p>다음글이없습니다.</p>
								</c:when>
								<c:otherwise>
									<a href="reference_view.do?data_idx=${afterlist.data_idx}" title="다음글">${afterlist.d_title}</a>
								</c:otherwise>
							</c:choose>	
						</li>
					</ul>
				</div>
			</div>
		</section>
		<jsp:include page="left_baner.jsp"></jsp:include>
		<jsp:include page="right_baner.jsp"></jsp:include>
		<jsp:include page="footerInc.jsp"></jsp:include>
	</section>
</body>
</html>