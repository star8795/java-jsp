<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 메인 페이지 </title>
</head>
<body>
<style>
	body{
		background-color: #E6E6E6;
	}
	.mainImg {
	    display: flex;
	    justify-content: space-between;
	    margin: 20px auto;
	}
	
	.mainImg img {
	    width: 33%;
	    height: auto;
	    object-fit: cover;
	    /* border: 1px solid #ddd; */
	    min-width: 400px;
	}
</style>
	<header>
		<br/>
		<%@ include file="../main/header.jsp" %>
	</header>
	<div>
		<div class="mainImg" >
			<img  style="width: 120%; height: auto; min-height: 500px;" src="../img/picture.png";>
			<!-- <img style="width:30px; height:auto; " src="../img/중.png";>
			<img style="width:30px; height:auto; " src="../img/오.png";> -->
		</div>
	</div>
	<div style="text-align: center;">
		<div style="display: inline-block;">
			<div>
				<h1>인기 게시물</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; ">
						<br>
						<br>
						<a href="../community/write.jsp"
						style="font-size: 30px; text-decoration-line: none; color: gray;">
						게시물 작성</a>
					</div>
				<br><br>
			</div>
			
			<div>
				<h1>카테고리</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; "></div>
				<br><br>
			</div>
			
			<div>
				<h1>커뮤니티</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; "></div>
				<br><br> 
			</div>
			
			<div>
				<h1>만든 사람들</h1>
					<div style="border: 1px solid black; width: 800px; height: 300px; "></div>
				<br><br>
			</div>
		</div>
	</div>
	
	<footer>
		<br/>
		<%@ include file="../main/footer.jsp" %>
	</footer>
</body>
</html>