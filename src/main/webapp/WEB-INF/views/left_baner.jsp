<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	$(function() {
		function todayList() {
			$.ajax({
				url : "/ajax/todayController",
				type : "get",
				dataType : "xml",
				data : "u_idx="+$(".hiden_idx").val(),
				success : function(data) {
					var ul = "" ;
					ul +="<ul>";
					$(data).find("member").each(function(index) {
						ul += "<li>";
						ul += "<a href=listView.do?viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
						ul += "<div class='lefB_conts'>";
						ul += "<p>";
						ul += "<span class='ajax_span1'>" + (index+1)
						ul += "</span>";
						ul += "<span class='ajax_span2'>" + $(this).find("introduce").text()
						ul += "</span>";
						ul += "</p>";
						ul += "</div>";
						ul += "</a>";
						ul += "</li>";
					});
					ul +="</ul>";
					$("#lefB .baner_box").append(ul);
				},
				error : function(request, status, error) {
	               alert("ajax통신오류");
	            }
			});
		}// getList()끝
		// 리스트 함수 실행
		todayList();
	});
</script>
</head>
</head>
<body>
	<section id="lefB">
		<input type="hidden" class="hiden_idx" value="${mvo.u_idx }">
		<div class="baner_box">
			<h2>오늘 방문한 매물페이지</h2>
		</div>
	</section>
</body>
</html>