<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp" %>

<div class="container">
	<section>
		<div id="map" class="container" style="height:500px;"></div>
	</section>
</div>
<!-- API KEY 072eb3ff2fd430ddf7763f4ce9eb59e0 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=18c365a3ee78d81f52362414e2024653"></script>
<script>
	
	// https://developers.kakao.com/
	
	// 경도 longitude
	// 위도 latitude
	var lat =  35.14842010169006;
	var lng =  129.11336703201343;
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
			// 주소로 위도 경도 찾기 사이트 : http://www.dawuljuso.com/
			// 충렬대로 84	X :129.070213, Y : 35.2073736
		center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표. 필수
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(lat, lng); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>
<%@ include file="../common/footer.jsp" %>