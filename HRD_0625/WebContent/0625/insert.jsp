<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등록</title>
<link type="text/css" rel="stylesheet" href="style.css">

<script type="text/javascript">
function checkwrite(){
	if(document.cstinsertform.custno.value==""){
		alert("회원성명이 입력되지 않았습니다.");
		document.cstinsertform.custno.focus();
	}else
		document.cstinsertform.submit();
}
</script>
</head>
<body>
<header>
<jsp:include page="header.jsp" />
<%@ include file="DBconn.jsp" %>
</header>

<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>

<section>
<div class="section">

<!-- 회원번호 시퀀스 삽입 -->
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

//시퀀스를 int seq로 지정하고 초기값은 0
int seq=0;

try{
	String sql="select custno_seq.nextval from dual";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	//시퀀스 호출, 하나씩 불러 들이면 if, 조회할 때는 while
	if(rs.next()){
		seq=rs.getInt(1);
		}
	}
catch(SQLException e){
	out.println("errorㅠㅠ "+e.getMessage());
	
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}%>

<form action="insert_process.jsp" name=cstinsertform>
<h2>홈쇼핑 회원 등록</h2><hr>
<table>
<tr>
<th>회원번호(자동발생)</th>
<td align="left"><input type="text" name="custno" size="15" value="<%=seq%>">
</td>
</tr>

<tr align=center>
<th>회원성명 </th> 
<td align="left"><input type="text" name="custname" size="15" value="" ></td>
</tr>

<tr align=center>
<th>회원전화 </th>
<td align="left"><input type="tel" name="phone" size="20" value=""></td>
</tr>

<tr align=center>
<th>회원주소</th>
<td align="left"><input type="text" name="address" size="30" value=""></td>
</tr>

<tr align=center>
<th>가입일자</th>
<td align="left">
<input type="text" name="joindate" value="">

</tr>

<tr align=center>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td align="left">
<input type="text" name="grade" size="15" value="" >
</tr>

<tr align=center>
<th>도시코드</th>
<td align="left">
<input type="text" name="city" size="15" value="" >		
</td>
</tr>

<tr align=center>
<td colspan="2">
<input type="button" value="등록" onclick="javascript:checkwrite()">
<input type="button" value="조회" onclick="location.href='select.jsp'"></td>
</tr>
</table>
</form>


</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>
