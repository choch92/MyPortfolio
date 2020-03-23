<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- header.jsp 파일을 추가 -->
<%@ include file="include/header.jsp"%>

	<!-- Services -->
	<section class="content-section bg-primary text-white text-center"
		id="services">
		<div class="container">
				
			<div class="content-section-heading">
				<h3 class="text-secondary mb-0">Services</h3>
				<h2 class="mb-5">What We Offer</h2>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3" > <i
						class="icon-screen-smartphone"></i>
					</span>
					<h4>
						<strong>Member Login</strong>
					</h4>
					<p class="text-faded mb-0"></p>
				</div>
				<div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> <i class="icon-pencil"></i>
					</span>
					<h4>
						<strong>Member Diary</strong>
					</h4>
					<p class="text-faded mb-0"></p>
				</div>
				<div class="col-lg-3 col-md-6 mb-5 mb-md-0">
					<span class="service-icon rounded-circle mx-auto mb-3"> <i
						class="icon-like"></i>
					</span>
					<h4>
						<strong>Member Board</strong>
					</h4>
					<p class="text-faded mb-0"></p>
				</div>
				<div class="col-lg-3 col-md-6">
					<span class="service-icon rounded-circle mx-auto mb-3"> <i
						class="icon-mustache"></i>
					</span>
					<h4>
						<strong>Shopping Basket</strong>
					</h4>
					<p class="text-faded mb-0"></p>
				</div>
			</div>
		</div>
	</section>


	<!-- Portfolio -->
	<section class="content-section" id="portfolio">
		<div class="container">
			<div class="content-section-heading text-center">
				<h3 class="text-secondary mb-0">Portfolio</h3>
				<h2 class="mb-5">Recent Projects</h2>
			</div>
			<div class="row no-gutters">
				<div class="col-lg-6">
					<a class="portfolio-item" href="/user/loginetc"> <span class="caption">
							<span class="caption-content">
								<h2>Member Login</h2>
								<p class="mb-0">로그인, 회원가입, 회원수정, 회원삭제 기능!</p>
						</span>
					</span> <img class="img-fluid" src="/resources/img/portfolio-1.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="/diary/calendar"> <span class="caption">
							<span class="caption-content">
								<h2>Member Diary</h2>
								<p class="mb-0">일정 계획표 기능!</p>
						</span>
					</span> <img class="img-fluid" src="/resources/img/portfolio-2.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="/board/boardetc"> <span class="caption">
							<span class="caption-content">
								<h2>Member Board</h2>
								<p class="mb-0">게시판 <i class="fas fa-heart"></i> 회원 간의 댓글!</p>
						</span>
					</span> <img class="img-fluid" src="/resources/img/portfolio-4.jpg" alt="">
					</a>
				</div>
				<div class="col-lg-6">
					<a class="portfolio-item" href="/fruit/fruitetc"> <span class="caption">
							<span class="caption-content">
								<h2>Shopping Basket</h2>
								<p class="mb-0">담고싶은 과일들 <i class="fas fa-heart"></i>&nbsp;<i class="fas fa-heart"></i></p>
						</span>
					</span> <img class="img-fluid" src="/resources/img/portfolio-3.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Map -->
	<section id="map" class="map">
		<iframe width="100%" height="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
		<br />
		<div id="clickLatlng"></div>
	</section>
	<div class="col-lg-6">
		<p id="addr">
	</div>

<!-- footer.jsp 파일의 추가 -->
<%@ include file="include/footer.jsp"%>

<!-- 경도와 위도 출력 -->
<script>
	navigator.geolocation.getCurrentPosition(function(position) {
		var latitude = position.coords.latitude;
		var longitude = position.coords.longitude;
		// jquery의 ajax
		$.ajax({
			url : 'address',
			data : {
				'longitude' : longitude,
				'latitude' : latitude
			},
			dataType : 'json',
			success : function(data) {
				document.getElementById('addr').innerHTML = "현재 위치 : " + data.address;
			}
		});
	});
</script>


<!-- 지도 출력 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abfe30c50bf8646b3518958413f646c1">
	
</script>
<script>
	navigator.geolocation.getCurrentPosition(function(position) {
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(position.coords.latitude,
					position.coords.longitude),
			level : 3
		};
		var map = new kakao.maps.Map(container, options);

		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);

			var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';

			var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message;

		});

	}, function(error) {

	});
</script>