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
	<!-- Ajax CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
	<script type="text/javascript" src="resources/js/jquery.bxslider.js"></script>
	<script type="text/javascript" src="resources/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$("#indexSel").change(function() {
				var chk = $("#indexSel option:checked").val();
				$(this).parent().parent().next().next().removeClass();
				$(this).parent().parent().next().next().addClass(chk);
			});
			$(document).on("click",'.title_btn',function(){ 
				var title_tex = $("#tit_tex").val();
				$(".errsch").remove();
				$(".contsTrade").css("display","none");
				function getList() {
					$.ajax({
						url : "/ajax/ajaxSearch02",
						type : "get",
						dataType : "xml",
						data : "title_tex=" + title_tex,
						success : function(data) {
							div = "<div class='contsTrade nondiv'>"
								$(data).find("member").each(function() {
								div += "<div class='view_content'>"
								div += "<ul>"
								div += "<li class='v_listBox'>"
								div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
								div += "<div class='trade_img'>"
								div += "</div>"		
								div += "<div class='trade_text'>"
								div += "<p class='name'>"	
								div += "<span style='padding-right:20px;'>"+ "매물정보 : "
								div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
								div += "</span>"
								div += "</span>"
								div += "<span> 판매자 : "+ $(this).find('u_name').text();
								div += "</span>"
								div += "</p>"	
								div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
								div += "</p>"
								div += "<p class='title'>" + $(this).find('edu_title').text();
								div += "</p>"
								div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
								div += "</p>"
								div += "</div>"
								div += "</a>"
								div += "</li>"
								div += "</ul>"
								div +="</div>";	
							});
							div += "</div>"
							$(".nondiv").remove();
							$(".contsTrade").after(div);	
						},
						/* error : function name() {
							alert("실패")
						} */
					});
				}getList();
			});
			
			// 매물번호검색
			$(".num_btn").click(function() {
				var title_tex = $("#tit_tex").val();
				$(".errsch").remove();
				$(".contsTrade").css("display","none");
				function getList() {
					$.ajax({
						url : "/ajax/ajaxSearch01",
						type : "get",
						dataType : "xml",
						data : "title_tex=" + title_tex,
						success : function(data) {
							div = "<div class='contsTrade nondiv'>"
								$(data).find("member").each(function() {
								div += "<div class='view_content'>"
								div += "<ul>"
								div += "<li class='v_listBox'>"
								div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
								div += "<div class='trade_img'>"
								div += "</div>"		
								div += "<div class='trade_text'>"
								div += "<p class='name'>"	
								div += "<span style='padding-right:20px;'>"+ "매물정보 : "
								div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
								div += "</span>"
								div += "</span>"
								div += "<span> 판매자 : "+ $(this).find('u_name').text();
								div += "</span>"
								div += "</p>"	
								div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
								div += "</p>"
								div += "<p class='title'>" + $(this).find('edu_title').text();
								div += "</p>"
								div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
								div += "</p>"
								div += "</div>"
								div += "</a>"
								div += "</li>"
								div += "</ul>"
								div +="</div>";	
							});
							div += "</div>"
							$(".nondiv").remove();
							$(".contsTrade").after(div);	
						},
						/* error : function name() {
							alert("실패")
						} */
					});
				}getList();
			});
			
			$(".btn").click(function(){
				$(".contsTrade").css("display","none");
				$(".errsch").remove();
				var sel1  = $("#sel1 option:selected").val();
				var sel2  = $("#sel2 option:selected").val();
				var sel3  = $("#sel3 option:selected").val();
				var sel4  = $("#sel4 option:selected").val();
				
				function getList() {
					$.ajax({
						url : "/ajax/ajaxSearch03",
						type : "get",
						dataType : "xml",
						data : "sel1=" + sel1 + "&" + "sel2=" + sel2 + "&" + "sel3=" + sel3 + "&" + "sel4=" + sel4,
						success : function(data) {
							div = "<div class='contsTrade nondiv'>"
								$(data).find("member").each(function() {
								div += "<div class='view_content'>"
								div += "<ul>"
								div += "<li class='v_listBox'>"
								div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
								div += "<div class='trade_img'>"
								div += "</div>"		
								div += "<div class='trade_text'>"
								div += "<p class='name'>"	
								div += "<span style='padding-right:20px;'>"+ "매물정보 : "
								div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
								div += "</span>"
								div += "</span>"
								div += "<span> 판매자 : "+ $(this).find('u_name').text();
								div += "</span>"
								div += "</p>"	
								div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
								div += "</p>"
								div += "<p class='title'>" + $(this).find('edu_title').text();
								div += "</p>"
								div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
								div += "</p>"
								div += "</div>"
								div += "</a>"
								div += "</li>"
								div += "</ul>"
								div +="</div>";	
							});
							div += "</div>"
							$(".nondiv").remove();
							$(".contsTrade").after(div);	
						},
						error : function name() {
							alert("실패")
						}
					});
				}getList();
				/*  else if ( sel3 != '' && sel2 != '' && sel1 != ''){
					function getList() {
						$.ajax({
							url : "/project01/sch03Controller",
							type : "get",
							dataType : "xml",
							data : "sel1=" + sel1 + "&" + "sel2=" + sel2 + "&" + "sel3=" + sel3,
							success : function(data) {
								div = "<div class='contsTrade nondiv'>"
									$(data).find("member").each(function() {
									div += "<div class='view_content'>"
									div += "<ul>"
									div += "<li class='v_listBox'>"
									div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
									div += "<div class='trade_img'>"
									div += "</div>"		
									div += "<div class='trade_text'>"
									div += "<p class='name'>"	
									div += "<span style='padding-right:20px;'>"+ "매물정보 : "
									div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
									div += "</span>"
									div += "</span>"
									div += "<span> 판매자 : "+ $(this).find('u_name').text();
									div += "</span>"
									div += "</p>"	
									div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
									div += "</p>"
									div += "<p class='title'>" + $(this).find('edu_title').text();
									div += "</p>"
									div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
									div += "</p>"
									div += "</div>"
									div += "</a>"
									div += "</li>"
									div += "</ul>"
									div +="</div>";	
								});
								div += "</div>"
								$(".nondiv").remove();
								$(".contsTrade").after(div);	
							},
							error : function name() {
								alert("실패")
							}
						});
					}getList();
				} else if (sel2 != '' && sel1 != ''){
					function getList() {
						$.ajax({
							url : "/project01/sch02Controller",
							type : "get",
							dataType : "xml",
							data : "sel1=" + sel1 + "&" + "sel2=" + sel2,
							success : function(data) {
								div = "<div class='contsTrade nondiv'>"
									$(data).find("member").each(function() {
									div += "<div class='view_content'>"
									div += "<ul>"
									div += "<li class='v_listBox'>"
									div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
									div += "<div class='trade_img'>"
									div += "</div>"		
									div += "<div class='trade_text'>"
									div += "<p class='name'>"	
									div += "<span style='padding-right:20px;'>"+ "매물정보 : "
									div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
									div += "</span>"
									div += "</span>"
									div += "<span> 판매자 : "+ $(this).find('u_name').text();
									div += "</span>"
									div += "</p>"	
									div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
									div += "</p>"
									div += "<p class='title'>" + $(this).find('edu_title').text();
									div += "</p>"
									div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
									div += "</p>"
									div += "</div>"
									div += "</a>"
									div += "</li>"
									div += "</ul>"
									div +="</div>";	
								});
								div += "</div>"
								$(".nondiv").remove();
								$(".contsTrade").after(div);	
							},
							error : function name() {
								alert("실패")
							}
						});
					}getList();
				} else if (sel1 != ''){
					function getList() {
						$.ajax({
							url : "/project01/sch01Controller",
							type : "get",
							dataType : "xml",
							data : "sel1="+sel1,
							success : function(data) {
								div = "<div class='contsTrade nondiv'>"
									$(data).find("member").each(function() {
									div += "<div class='view_content'>"
									div += "<ul>"
									div += "<li class='v_listBox'>"
									div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
									div += "<div class='trade_img'>"
									div += "</div>"		
									div += "<div class='trade_text'>"
									div += "<p class='name'>"	
									div += "<span style='padding-right:20px;'>"+ "매물정보 : "
									div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
									div += "</span>"
									div += "</span>"
									div += "<span> 판매자 : "+ $(this).find('u_name').text();
									div += "</span>"
									div += "</p>"	
									div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
									div += "</p>"
									div += "<p class='title'>" + $(this).find('edu_title').text();
									div += "</p>"
									div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
									div += "</p>"
									div += "</div>"
									div += "</a>"
									div += "</li>"
									div += "</ul>"
									div +="</div>";	
								});
								div += "</div>"
								$(".nondiv").remove();
								$(".contsTrade").after(div);	
							},
							error : function name() {
								alert("실패")
							}
						});
					}getList();
				} else if (sel2 != ''){
					function getList() {
						$.ajax({
							url : "/project01/sch05Controller",
							type : "get",
							dataType : "xml",
							data : "sel2="+sel2,
							success : function(data) {
								div = "<div class='contsTrade nondiv'>"
									$(data).find("member").each(function() {
									div += "<div class='view_content'>"
									div += "<ul>"
									div += "<li class='v_listBox'>"
									div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
									div += "<div class='trade_img'>"
									div += "</div>"		
									div += "<div class='trade_text'>"
									div += "<p class='name'>"	
									div += "<span style='padding-right:20px;'>"+ "매물정보 : "
									div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
									div += "</span>"
									div += "</span>"
									div += "<span> 판매자 : "+ $(this).find('u_name').text();
									div += "</span>"
									div += "</p>"	
									div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
									div += "</p>"
									div += "<p class='title'>" + $(this).find('edu_title').text();
									div += "</p>"
									div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
									div += "</p>"
									div += "</div>"
									div += "</a>"
									div += "</li>"
									div += "</ul>"
									div +="</div>";	
								});
								div += "</div>"
								$(".nondiv").remove();
								$(".contsTrade").after(div);	
							},
							error : function name() {
								alert("실패")
							}
						});
					}getList();
				} else if (sel3 != ''){
					function getList() {
						$.ajax({
							url : "/project01/sch06Controller",
							type : "get",
							dataType : "xml",
							data : "sel3="+sel3,
							success : function(data) {
								div = "<div class='contsTrade nondiv'>"
									$(data).find("member").each(function() {
									div += "<div class='view_content'>"
									div += "<ul>"
									div += "<li class='v_listBox'>"
									div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
									div += "<div class='trade_img'>"
									div += "</div>"		
									div += "<div class='trade_text'>"
									div += "<p class='name'>"	
									div += "<span style='padding-right:20px;'>"+ "매물정보 : "
									div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
									div += "</span>"
									div += "</span>"
									div += "<span> 판매자 : "+ $(this).find('u_name').text();
									div += "</span>"
									div += "</p>"	
									div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
									div += "</p>"
									div += "<p class='title'>" + $(this).find('edu_title').text();
									div += "</p>"
									div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
									div += "</p>"
									div += "</div>"
									div += "</a>"
									div += "</li>"
									div += "</ul>"
									div +="</div>";	
								});
								div += "</div>"
								$(".nondiv").remove();
								$(".contsTrade").after(div);	
							},
							error : function name() {
								alert("실패")
							}
						});
					}getList();
				} else if (sel4 != ''){
					function getList() {
						$.ajax({
							url : "/project01/sch07Controller",
							type : "get",
							dataType : "xml",
							data : "sel4="+sel4,
							success : function(data) {
								div = "<div class='contsTrade nondiv'>"
									$(data).find("member").each(function() {
									div += "<div class='view_content'>"
									div += "<ul>"
									div += "<li class='v_listBox'>"
									div += "<a href=MyController?cmd=listView&viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
									div += "<div class='trade_img'>"
									div += "</div>"		
									div += "<div class='trade_text'>"
									div += "<p class='name'>"	
									div += "<span style='padding-right:20px;'>"+ "매물정보 : "
									div += "<span class='k_idx'>"+ $(this).find('treade_idx').text();
									div += "</span>"
									div += "</span>"
									div += "<span> 판매자 : "+ $(this).find('u_name').text();
									div += "</span>"
									div += "</p>"	
									div += "<p class='count'> 조회수 : " + $(this).find('edu_hit').text();
									div += "</p>"
									div += "<p class='title'>" + $(this).find('edu_title').text();
									div += "</p>"
									div += "<p class='price'> 순이익 : " + $(this).find('netprofit').text();
									div += "</p>"
									div += "</div>"
									div += "</a>"
									div += "</li>"
									div += "</ul>"
									div +="</div>";	
								});
								div += "</div>"
								$(".nondiv").remove();
								$(".contsTrade").after(div);	
							},
							error : function name() {
								alert("실패")
							}
						});
					}getList();
				} else {
					alert("검색 조건을 모두 선택해주세요");
					$(".errsch").remove();
					$(".contsTrade:last-child").after("<div class='errsch'>잘못된 검색 다시 입력하세요</div>");
				} */
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
			<div class="contsmiddle">
				<!-- <div class="sub_menubar">
					<ul>
						<li><a href="MyController?cmd=index">어학원</a></li>
						<li onclick="sellTrade_go()">입시/보습</li>
						<li><a href="treade_aply2.jsp">피아노/미술</a></li>
						<li><a href="MyController?cmd=buylist">독서실</a></li>
						<li>기타학원</li>
					</ul>
				</div> -->
				<div class="search">
					<ul>
						<li>모두검색</li>
						<li>
							<select id="sel1" name="eduK_step1" style="width:100px; margin-right:10px;">
								<option value="">분류선택</option>
								<option value="학습지">학습지</option>  
								<option value="어학원">어학원</option>           
								<option value="입시/보습">입시/보습</option>          
								<option value="피아노/미술">피아노/미술</option>          
								<option value="독서실">독서실</option>          
								<option value="기타학원">기타학원</option>          
							</select>
						</li>
						<li>
							<select id="sel2" name="eduK_step2" style="width:100px;">
								<option value="">상세분류</option>
								<option value="영어학원">영어학원</option>
								<option value="영어유치원">영어유치원</option>
								<option value="놀이학교">놀이학교</option>
								<option value="성인어학원">성인어학원</option>
								<option value="기타어학원">기타어학원</option>
								<option value="어학원시설">어학원시설</option>
								<option value="중국어학원">중국어학원</option>
							</select>
						</li>
						<li>
							<select id="sel3" name="areaK_step1" style="width:100px; margin-right:10px;">
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
						</li>
						<li style="width:120px;">
							<select id="sel4" name="areaK_step2" style="width:120px;">
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
						</li>
						<li class="btn"><a class="btn_st04"><span>검색하기</span></a></li>
					</ul>
				</div>
				<div class="search2">
					<ul>
						<li>
							<div>
								<select id="indexSel" style="width:120px;">
									<option value="num_btn">매물번호 검색</option>
									<option value="title_btn">제목으로 검색</option>
								</select>
							</div>
						</li>
						<li><input type="text" id="tit_tex" name="tit_sch"></li>
						<li class="num_btn"><a class="btn_st04"><span>검색하기</span></a></li>
					</ul>
				</div>
				<div class="advertisement">
					<h2>베스트 매물</h2>
					<ul>
						<c:forEach var="t" items="${best_list}" varStatus="vs">
							<li>
								<div class="ad_box">
									<a class="aLink" href="listView.do?viewNum=${t.treade_idx}&u_idx=${mvo.u_idx}" >
										<h3>${t.eduK_step1}</h3>
										<P>보증금 ${t.premium}</P>
										<p>순이익 ${t.netprofit}</p>
										<p>원생수 ${t.student_num} 명</p>
									</a>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="info_tex">
				
				</div>
			</div>
			<div class="contsTrade">
				<div class="trade_box">
					<div class="sch_title">
						<ul>
							<li>등록날자</li>
							<li><a href="indexH.do">높은금액</a></li>
							<li><a href="indexL.do">낮은금액</a></li>
						</ul>
					</div>
					<div class="sch_view">
						<div class="view_content">
							<ul>
								<c:forEach var="k" items="${list}" varStatus="v">
									<li class="v_listBox">
										<a href="listView.do?viewNum=${k.treade_idx}&u_idx=${mvo.u_idx}" >
											<div class="trade_img"><img src="resources/images/db/${k.t_image_1}" alt=""></div>
											<div class="trade_text">
												<p class="name"><span style="padding-right:20px;">매물정보 : <span class="k_idx">${k.treade_idx}</span></span><span>판매자 : ${k.u_name}</span></p>
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
							<ol class="paging">
							<!-- 이전 -->
							    <c:choose>
							    	<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
							    		<li class="disable">이전으로</li>
							    	</c:when>
							    	<c:otherwise>
							    		<c:if test="${h_price == null && L_price == null}">
							    			<li>
								    			<a href="index.do?cPage=${pvo.beginPage-pvo.pagePerBlock }">	이전으로 </a>
								    		</li>
							    		</c:if>
							    		<c:if test="${h_price == 'h_price'}">
							    			<li>
								    			<a href="indexH.do?cPage=${pvo.beginPage-pvo.pagePerBlock }">	이전으로 </a>
								    		</li>
							    		</c:if>
							    		<c:if test="${L_price == 'L_price'}">
							    			<li>
								    			<a href="indexL.do?cPage=${pvo.beginPage-pvo.pagePerBlock }">	이전으로 </a>
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
												<li><a href="index.do?cPage=${k}">${k}</a></li>
											</c:if>
											<c:if test="${h_price == 'h_price'}">
												<li><a href="indexH.do?cPage=${k}">${k}</a></li>
											</c:if>
											<c:if test="${L_price == 'L_price'}">
												<li><a href="indexL.do?cPage=${k}">${k}</a></li>
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
							    			<li><a href="index.do?cPage=${pvo.beginPage+pvo.pagePerBlock }">다음으로 </a></li>
							    		</c:if>
							    		<c:if test="${h_price == 'h_price'}">
							    			<li><a href="indexH.do?cPage=${pvo.beginPage+pvo.pagePerBlock }">다음으로 </a></li>
							    		</c:if>
							    		<c:if test="${L_price == 'L_price'}">
							    			<li><a href="indexL.do?cPage=${pvo.beginPage+pvo.pagePerBlock }">다음으로 </a></li>
							    		</c:if>
							    		
							    	</c:otherwise>
							    </c:choose>
							</ol>
						</div>
					</div>
				</div>
			</div>
			
			<!-- <div class="contsTrade">
				<div class="view_content">
					<ul>
						<li class="v_listBox">
							<a href="MyController?cmd=listView&amp;viewNum=101&amp;u_idx=">
								<div class="trade_img"></div>
								<div class="trade_text">
									<p class="name"><span style="padding-right:20px;">매물정보 : <span class="k_idx">101</span></span><span>판매자 : 다락방코딩</span></p>
									<p class="count">조회수 : 51</p>
									<p class="title">다락방</p>
									<p class="price">순이익 : <span>10</span></p>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div> -->
			
		</section>
		<jsp:include page="left_baner.jsp"></jsp:include>
		<jsp:include page="right_baner.jsp"></jsp:include>
		<jsp:include page="footerInc.jsp"></jsp:include>
	</section>
</body>
</html>