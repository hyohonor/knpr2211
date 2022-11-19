<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../../assets/js/lib/swiper.js"></script>
<link rel="shortcut icon" href="#">

<script src="assets/js/lib/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="assets/style/infomations.css">
</head>
<body>
	<script>
		$('document')
				.ready(
						function() {

							var swipe1 = ''
							var cnt = ${imagecount }
							for (i = 1; i <= cnt; i++) {
								swipe1 = swipe1
										+ '<div class=\"swiper-slide\">'
										+ '<img src=\"../../cntnts/${selectedParkDetail}_'+i+'.jpg\"/> </div>'

							}
							$(".swiper-wrapper").html(swipe1)
							init.loadImg();

							$(".input1").val('${detailInfo[0].category2}')
									.prop('selected', true)
							$(".input2").val('${detailInfo[0].category3}')
									.prop('selected', true)

							$(".input1").change(function() {
								$("#f").submit()
							})
							$(".input2").change(function() {
								$("#f").submit()
							})

						});
	</script>
	<%@ include file="../common/header.jsp"%>
	<div class="detailInfo">
		<div class="pageLocation">
			<span>홈</span> <span class="loca">이용안내</span> <span class="loca">${detailInfo[0].nameCategory1}</span>
		</div>
		<form action="detailInfo" id="f">
			<div class="detailInformation">
				<h3 class="title">${detailInfo[0].nameCategory1}이용안내</h3>
				<div class="serchBox">
					<select name="parkId" class="input1">
						<c:forEach var="a" items="${category2s }" varStatus="status">
							<option value="${a }">${nameOfCategory2s[status.index] }</option>
						</c:forEach>
					</select>
					<c:choose>
						<c:when test="${detailInfo[0].category1 eq 'C' }">
						</c:when>
						<c:when test="${detailInfo[0].category1 eq 'D' }">
							<select name="parkDetail" class="input2">
								<option value="D0101">태백산 민박촌</option>
							</select>
						</c:when>
						<c:when test="${detailInfo[0].category1 != 'C' }">
							<select name="parkDetail" class="input2">
								<c:forEach var="a" items="${category3s }" varStatus="status">
									<option value="${a }">${nameOfCategory3s[status.index] }</option>
								</c:forEach>
							</select>
						</c:when>

					</c:choose>
					<button class="searchbtn">
						<span class="searchB">조회</span>
					</button>
				</div>
			</div>
		</form>
		<div class="title favorite">
			<span class="informTitle">[${detailInfo[0].nameCategory2}]
				<c:choose>
				<c:when test="${detailInfo[0].category1 eq 'C' or detailInfo[0].category1 eq 'D'}"></c:when>
				<c:when test="${detailInfo[0].category1 eq 'A' or detailInfo[0].category1 eq 'B'}">${detailInfo[0].nameCategory3} </c:when>
				
				</c:choose>
				${detailInfo[0].nameCategory1}</span>
			<button type="button" class="btn btn-bookmark ">
				<i class="icon-bookmark"></i> <span>즐겨찾기</span>
			</button>
		</div>
		<div class="center-wrap">
			<div class="slide-view">
				<div class="swiper view">
					<div class="swiper-wrapper"></div>
					<div class="swiper-pagination"></div>
				</div>
				<div class="swiper thumb">
					<div class="swiper-wrapper"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>
				</div>
				<div class="gongbeck"></div>
			</div>
<!--  ----------------------------------- -->
			<div class="detailInfo">
			<table class="detailInfoTable">
				<tr>
					<th>주소</th>
					<td>${detailInfo[0].address }</td>
				</tr>
				<tr>
					<th>문의처</th>
					<td>${detailInfo[0].mobile }</td>
				</tr>
				<tr>
					<th>입/퇴실시간</th>
					<td>${detailInfo[0].time }</td>
				</tr>
				<tr>
					<th>이용금액</th>
					<td>
					<table class="table">
							
								<tr>
									<th scope="col" >구분</th>
									<th scope="col" >주말 및 성수기</th>
									<th scope="col" >주중</th>
								</tr>
							
								<c:choose>
									<c:when
										test="${detailInfo[0].category1 eq 'C' or detailInfo[0].category1 eq 'D'}">
										<c:forEach var="list" items="${detailInfo}">
											<tr>
												<td><em>${list.nameCategory3 } </em></td>
												<td><em>${list.priceWeekend }</em>원</td>
												<td><em>${list.priceDay }</em>원</td>
											</tr>
										</c:forEach>
									</c:when>

									<c:when test="${detailInfo[0].category1 != 'C' }">

										<c:forEach var="list" items="${detailInfo}">
											<tr>
												<td><em>${list.nameCategory4 }</em></td>
												<td class="ta-r"><em>${list.priceWeekend }</em>원</td>
												<td class="ta-r"><em>${list.priceDay }</em>원</td>
											</tr>
										</c:forEach>

									</c:when>

								</c:choose>
							
						</table>
					</td>
				</tr>
				<tr>
				<td colspan=2>
					<dl class = "a-warp">
						<dd>
							<button class="accordion">편의시설</button>
								<div class="panel">
	 							 <p>${detailInfo[0].memo}</p>
								</div>
						</dd>
					</dl>
				</td>
				</tr>
				<tr>
				<td colspan=2>
				<div class="bottom-area">
					<c:choose>
								<c:when test="${detailInfo[0].category1 eq 'C'}">
						<button type="button" class="btn btn-programs"  onclick="location.href='programInfo?parkId=${detailInfo[0].category2}'">프로그램 보기</button>
						</c:when>
						<c:when test="${detailInfo[0].category1 != 'C'}"></c:when>
					</c:choose>
						<button type="button" class="btn btn-reservation" onclick="">예약하기</button>
						
				</div>
				</td>
				</tr>
			</table>

					
				</div>
			</div>

		</div>
		<script>

var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    /* Toggle between adding and removing the "active" class,
    to highlight the button that controls the panel */
    this.classList.toggle("active");

    /* Toggle between hiding and showing the active panel */
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    }
  });
}



			let init = {
				loadImg : function() {
					var swiper = new Swiper(".swiper.thumb", {
						loop : true,
						spaceBetween : 20,
						slidesPerView : 4,
						freeMode : true,
						watchSlidesProgress : true,
						navigation : {
							nextEl : ".swiper-button-next",
							prevEl : ".swiper-button-prev",
						},
					});

					var swiper2 = new Swiper(".swiper.view", {
						loop : true,
						spaceBetween : 10,
						pagination : {
							el : '.swiper-pagination',
							type : "fraction"
						},
						thumbs : {
							swiper : swiper,
						},
					});
				}
			}
		</script>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>