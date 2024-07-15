<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Formatter</title>
</head>
<body>
	<h3>JSTL Formatter</h3>
	<%
		// tomcat 10미만 에서의 파라미터 인코딩 설정
		request.setCharacterEncoding("utf-8");
	%>
	<f:requestEncoding value="utf-8"/>
	<!-- <div></div> -->
	<!-- &lt;div&gt;&lt;/div&gt; -->
	selectDate : <c:out value="${param.selectDate}" escapeXml="true"/> <br/>
	price : ${param.price} <br/>
	address : ${param.addr} <br/>
	encode : ${param.encode} <br/>
	<br/>
	<hr/>
	<h2>날짜 형식 지정</h2>
	<jsp:useBean id="now" class="java.util.Date" scope="page"/>
	Date : <c:out value="${now}"></c:out>
	<!--
		f:formatDate - 날짜 형식의 데이터를 지정한 형식의 텍스트로 변환
		type(default : date)
		date(날짜) time(시간) both(둘다)
		
		style(default : medium)
		full / long / medium / short
	-->
	<br/>
	<f:formatDate value="${now}"/> <br/>
	<f:formatDate value="${now}" type="date" dateStyle="full"/> <br/>
	time - full : <f:formatDate value="${now}" type="time" timeStyle="full"/> <br/>
	<f:formatDate var="formatDate" value="${now}" type="both" dateStyle="long" timeStyle="long"/> <br/>
	<h3>formatDate : ${formatDate}</h3>
	<h3>pattern</h3>
	<!-- pattern == SimpleDateFormat -->
	<f:formatDate value="${now}" pattern="yyyy-MM-dd E HH:mm:ss"/>
	
	<h1>parseDate : ${param.selectDate}</h1>
	<!-- 문자열 형식의 날짜 data를 날짜 시간형식의 데이터로 변경 -->
	<f:parseDate var="n" value="${param.selectDate}" pattern="yyyy-MM-dd"/>
	파싱된 date : ${n} <br/>
	formatDate : <f:formatDate value="${n}" pattern="yyyy년MM월dd일"/>
	
	<h3>Number Formatter</h3>
	<f:formatNumber var="numberType" type="number" value="${param.price}"/>
	 number type : ${numberType} <br/>
	 통화 형식 : <f:formatNumber type="currency" value="${param.price}"/> <br/>
	 <f:setLocale value="ja_JP"/>
	 <%=response.getLocale() %>
	 엔화 : <f:formatNumber type="currency" value="${param.price}"/> <br/>
	 <f:setLocale value="en_US"/>
	 달러 : <f:formatNumber type="currency" value="${param.price}"/> <br/>

	 <h3>patter</h3>
	 <!-- ㄹ + 한자 + 3 -->
	 <f:formatNumber value="${param.price}" pattern="￦0,000.00"/>
	 
	 <h3>다국어 처리 지원 - bundle</h3>
	 <f:bundle basename="bundle">
	 	<f:message key="name"/>
	 	<f:message key="name_en"/>
	 </f:bundle>
	 <br/>
	 <f:setLocale value="${param.encode}"/>
	 response locale : <%= response.getLocale() %> <br/>
	 
	 <f:bundle basename="prop/bundle">
	 	<f:message var="name" key="name" scope="session"/>
	 	<c:choose>
	 		<c:when test="${!empty param.addr}">
	 			<f:message var="addr" key="addr">
	 				<f:param value="${param.addr}"/>
	 				<f:param value="70"/>
	 			</f:message>
	 		</c:when>
	 		<c:otherwise>
	 			<f:message var="addr" key="addr_default"/>
	 		</c:otherwise>
	 	</c:choose>
	 	<f:message var="addr" key="addr"/>
	 	<f:message var="phone" key="phone" />
	 </f:bundle>
	 <h4>이름 : ${name}</h4>
	 <h4>주소 : ${addr}</h4>
	 <h4>전화번호 : ${phone}</h4>
	 <hr/>
	 <h3> 국가별 정보 </h3>
	 <!-- 등록된 국가 정보 -->
	 <c:forEach var="loc" items="<%=java.util.Locale.availableLocales().iterator() %>">
	 	display-conuntry - ${loc.getDisplayCountry()} <br/>
	 	country code - ${loc.getCountry()} <br/>
	 	language  - ${loc.getDisplayLanguage()} <br/>
	 	language code - ${loc.getLanguage()} <br/>
	 	locale - ${loc} <br/> 
	 </c:forEach>
</body>
</html>