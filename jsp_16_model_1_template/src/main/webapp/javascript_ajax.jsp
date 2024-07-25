<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- javascript_ajax.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>javascript AJAX</title>
</head>
<body>
	<h1>자바 스크립트 AJAX</h1>
	<input type="text" name="name" id="name"/> <br/>
	<input type="text" name="age" id="age" /> <br/>
	<input type="button" id="get_btn" value="GET_BUTTON"/>
	<input type="button" id="post_btn" value="POST_BUTTON"/>
	<input type="button" id="xml_btn" value="XML_BUTTON"/>
	
	<div id="box"></div>
	<div id="box2">
		<table border=1 id="boxTable">
			<tr>
				<th>이름</th>
				<th>나이</th>
			</tr>
		</table>
	</div>
	
	<script>
		/*
			AJAX - Asynchronous Javascript And XML 의 약자
			JavaScript의 라이브러리 중 하나로  전체페이지를 새로 로딩하지 않고
			부분적으로 서버와 데이터 교환을 하는 것.
			
			AJAX의 핵심 기술은 MS에서 처음 개발한 xhr(XMLHttpRequest) 객체 
			Javascript에서 이 객체를 흡수하여 공통개발
			xhr객체를 이용하여 ajax를 구현.
			
			Javascript Object
		*/
		let obj = {
			name : "최기근",
			age : 23,
			study : function(){
				console.log("공부를 열심히합니다.");
			}
		};
		/*
			JSON (JavaScript Object Notation) - 자바 스크립트 객체 표기법
			경량 데이터 교환 형식
			사람이 읽고 쓰기 용이, 기계가 분석하고 생성함에도 용이
		*/
		
		// AJAX 객체를 저장할 변수
		var xhr;
		
		document.querySelector("#get_btn").onclick = function(){
			xhr = new XMLHttpRequest();
			
			if(!xhr){
				alert("XMLHttpRequest 객체 생성 불가");
				return false;
			}
			
			// GET
			let name = document.getElementById("name");
			let age = document.getElementById("age");
			
			/*
				xhr.onreadystatechange
				0 (unintialized) - (request가 초기화 되지 않음)
				1 (loading) 	 - (서버와의 연결이 성사됨)
				2 (loaded)       - (서버가 request를 받음)
				3 (interactive)  - (request(요청)을 처리하는 중)
				4 (complete) 	 - (request에 대한 처리가 끝났으며 응답할 준비가 완료됨)
			*/
			console.log("state " , xhr.readyState );
			
			xhr.open("GET","ajaxTest.jsp?name="+name.value+"&age="+age.value);
			
			console.log("state " , xhr.readyState );
			
			// 요청 처리 상태 변화에 따라 호출될 call back 함수 지정
			xhr.onreadystatechange = setContents;
			
			// javascript로 서버에 요청
			xhr.send();
		};
		
		function setContents(){
			console.log("state ", xhr.readyState);
			if(xhr.readyState === 4){
				// status : 응답 상태 코드
				if(xhr.status === 200){
					console.log("======================================");
// xhr.responseText : 서버의 응답을 텍스트 문자열로 반환
					console.log(xhr.responseText);
					console.log("======================================");
// xhr.responseXML : 서버의 응답을 XMLDocument객체로 반환
//					 자바스크립트의 DOM 함수들을 통해 객체 제어
					console.log(xhr.responseXML);
					console.log("======================================");
					
					document.getElementById("box").innerHTML = xhr.responseText;
					
					// json type의 데이터가 저장된 text를 
					// javascript object 객체로 변환
					let obj = JSON.parse(xhr.responseText);
					console.log(obj);
					
					let html = "";
					html += "<td>";
					html += obj.name;
					html += "</td>";
					html += "<td>";
					html += obj.age;
					html += "</td>";
					// <td>최기근</td><td>26</td>
					let htmlElement = document.createElement("tr");
					htmlElement.innerHTML = html;
					// <tr><td>최기근</td><td>26</td></tr>
					document.querySelector("#boxTable").appendChild(htmlElement);
					console.log(html);
				}else{
					// 요청을 처리하는 중 오류가 발생함.
					alert("요청을 정상적으로 처리하지 못하였습니다.");
				}
			}
		} // end setContents
		
		// ES6 에 JavaScript에 추가된 AJAX 통신용 객체
		document.querySelector("#post_btn").onclick = function(){
			let name = document.getElementById("name").value;
			let age = document.getElementById("age").value;
			
			// fetch API -javascript에서 HTTP 요청을 보내고 응답을 처리하기 위한 
			// 인터페이스를 제공하는 API - XMLHttpRequest 객체를 대체하기 위해 설계
			/*
				fetch("url",{optional}).then(response => 응답결과처리).catch(error=> 오류내용처리);    
			*/
			
			// fetch("ajaxTest.jsp?name="+name+"&age="+age)
			fetch("ajaxTest.jsp", {
				method : "POST",
				// name=최기근&age=26
				body : new URLSearchParams({
					name : name,
					age : age
				})
			})
			.then( (response) => response.json() )
			.then( data => {
				console.log("이전 then 에서 전달된 response.json() ");
				console.log(data);
			})
			.catch((error)=> console.log(error));
		};
		
	</script>
</body>
</html>












