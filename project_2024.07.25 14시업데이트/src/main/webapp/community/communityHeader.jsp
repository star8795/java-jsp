<%@page import="java.sql.*,Util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 상단 플랫폼</title>
<style>
.top_color {
	background-color: #e8e8e8;
	width: 100%;
	height: 44px;
}

.body2 {
	position:relative;
	margin: 0 auto;
bottom:44px;
	width: 1000px;
}

.menu {
	height: 44px;
	margin: 0px;
	font-size: 15px;
	text-overflow: hidden;
}

.left_menu {
	display: inline-block;
	float: left;
	font-size: 15px;
	font-weight: 700;
	padding-top: 10px;
	cursor: pointer;
}

.right_menu {
	display: inline-block;
	float: right;
	font-size: 15px;
	font-weight: 700;
	padding-top: 10px;
	cursor: pointer;
}

.left_menu>span {
	padding: 5px
}

.right_menu>span {
	padding: 5px
}

body {
	margin: 0px;
}

.menu_type {
	padding-top: 35px;
	font-size: 30px;
	font-weight: 900;
	cursor:pointer;
}

.ingi_category {
	font-size: 20px;
	margin-top: 100px;
	font-weight: 900;
}

.category {
	margin-top: 20px;
	width:1023px;
}

.category>div {
	display: inline-block;
	height: 40px;
	cursor: pointer;
	border: 1px solid gray;
 	margin-left: 50px; 
	margin-bottom: 20px;
	width: 160px;
	box-sizing: border-box;
	border-radius: 10px;
	font-weight: bold;
	text-align: center;
	line-height: 40px;
}

.category>div:nth-child(5n+1) {
	margin-left: 0px;
}
</style>
</head>
<body>
	<div class="top_color"></div>
	<div class="body2">
		<div class="menu">
			<div class="left_menu">
				<span>menu1</span> <span>menu2</span> <span>menu3</span> <span>menu4</span>
			</div>
			<div class="right_menu">
				<span>menu5</span> <span>menu6</span> <span>menu7</span> <span>menu8</span>
			</div>
		</div>

		<div class="menu_type" onclick="window.location.href = '../community/community.jsp';">커뮤니티</div>
		<div class="ingi_category">인기 카테고리</div>
		<div class="category">
			<div onclick="window.location.href = '../community/community.jsp?category=category1';">복기</div>
			<div onclick="window.location.href = '../community/community.jsp?category=category2';">질문</div>
			<div onclick="window.location.href = '../community/community.jsp?category=category3';">퍼즐</div>
			<div onclick="window.location.href = '../community/community.jsp?category=category4';">정보</div>
			<div onclick="window.location.href = '../community/community.jsp?category=category5';">팁</div>
			
		</div>
		</div>
</body>
</html>