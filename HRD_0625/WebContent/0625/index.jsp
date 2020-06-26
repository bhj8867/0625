<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main화면</title>
<link type="text/css" rel="stylesheet" href="style.css">

</head>
<body>
<header>
<jsp:include page="header.jsp" />
</header>

<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>

<section>
<div class="section">
<h2>쇼핑몰 회원관리 프로그램</h2>
<h3>&nbsp;&nbsp;&nbsp;&nbsp;쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
&nbsp;&nbsp;&nbsp;&nbsp;프로그램 작성 순서</h3>
<ol>
<li>회원정보 테이블을 생성한다.</li>
<li>매출정보 테이블을 생성한다.</li>
<li>회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
<li>회원정보 입력 화면프로그램을 작성한다.</li>
<li>회원정보 조회 프로그램을 작성한다.</li>
<li>회원매출정보 조회 프로그램을 작성한다.</li>
</ol>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>