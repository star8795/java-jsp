<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title> main header </title>

<style>
	
	@media screen and (max-width:960px){
		#header > .right{
			display:none;
		}
	}
	
	#header{
		margin-left: 100px;
		white-space: nowrap;
	}
	
    div>.header {
        display: inline-block; /* 요소들을 가로로 배치 */
        margin-right: 50px; /* 오른쪽 여백 설정 */
        vertical-align: middle; /* 세로 정렬을 위한 중앙 정렬 */
    }
    div>.header>h3>a{
    	text-decoration-line: none;
    	color: black;
    }
    div>.right>.header>h3>a{
    	text-decoration-line: none;
    	color: #333;
    }
    
    div>.right {
        display: inline-block; /* 요소들을 가로로 배치 */
        margin-right: 20px; /* 오른쪽 여백 설정 */
        vertical-align: middle; /* 세로 정렬을 위한 중앙 정렬 */
        float: right;
    }
    
    .ad{
      position: fixed; 
	  top: 180px; 
	  margin-left: 100px;
    }
    
</style>
</head>
<body>
<%

    String userId = (String) session.getAttribute("id");

%>
    <div id="header">
        <div class="header">
            <a href="../main/main.jsp">
                <img style="width: 300px; height: auto;" alt="이미지 설명" src="../img/메인.png">
            </a>
        </div>
        <div class="header">
            <h3><a href="../community/community.jsp">커뮤니티</a></h3>
        </div>
        
        <div class="header">
            <h3><a href="../community/write.jsp">게시물 작성</a></h3>
        </div>
        
        <div class="header">
            <h3><a href="../community/community.jsp">카테고리</a></h3>
        </div>
       
       <div class="right">
       <%

		if (userId != null) {
	    out.println("<h3>" + userId+"님 환영합니다</h3>");
		}else{
		%>
	        <div class="header">
	        	<h3><a href="../login/login.jsp">로그인</a></h3>
	        </div>
	        <div class="header">
	        	<h3><a href="../login/register.jsp">회원가입</a></h3>
	        </div>
	    <% }%>
       </div>
    </div>
<!-- 
    <div class="ad">
		<img alt="" src="../img/영웅동찬.png">
	</div>
 -->
