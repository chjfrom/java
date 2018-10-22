<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	$(function() {
		function realList() {
			$.ajax({
				url : "/ajax/realController",
				type : "get",
				dataType : "xml",
				success : function(data) {
					var ul = "" ;
					ul +="<ul>";
					$(data).find("member").each(function(index) {
						ul += "<li>";
						ul += "<a href=listView.do?viewNum"+ "=" +$(this).find('treade_idx').text()+ "&u_idx="+$(this).find('u_idx').text()  +  ">"
						ul += "<div class='lefB_conts'>";
						ul += "<p>";
						ul += "<span class='ajax_span1'>조회수: " + $(this).find("edu_hit").text()
						ul += "</span>";
						ul += "<span class='ajax_span2'>" + $(this).find("edu_title").text()
						ul += "</span>";
						ul += "</p>";
						ul += "</div>";
						ul += "</a>";
						ul += "</li>";
					});
					ul +="</ul>";
					$("#rightB .baner_box").append(ul);
				},
				error : function(request, status, error) {
	               alert("ajax통신오류");
	            }
			});
		}
		// 리스트 함수 실행
		realList();
	});
</script>
</head>
<body>
	<section id="rightB">
		<div class="baner_box">
			<h2>실시간 검색순위</h2>
		</div>
	</section>
</body>
</html>