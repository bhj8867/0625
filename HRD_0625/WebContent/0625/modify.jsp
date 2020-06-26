<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보변경</title>
<link type="text/css" rel="stylesheet" href="style.css">

<script type="text/javascript">
function check(){
	if(document.modifyform.custno.value==""){
		alert("회원번호를 입력하시오.");
		document.modifyform.custno.focus();
	}
	else if(document.modifyform.custname.value==""){
		alert("이름이 입력되지 않았습니다.");
		document.modifyform.custname.focus();
	}
	else{
		document.modifyform.submit();
		}
}
</script>

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
<%@ include file = "DBconn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

int custno=Integer.parseInt(request.getParameter("custno")); 

String custname="";
String phone="";
String address="";
String joindate="";
String grade="";
String city="";


try{//회원번호를 조회하여 디비에 있는 정보를 불러 들이는 sql
	String sql="select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'), grade, city from member_tbl_02 where custno="+custno;
	/* 순서도 중요 */
	/* System.out.println("sql : "+sql); */
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		custno=rs.getInt("custno");
		custname=rs.getString("custname");
		phone=rs.getString("phone");
		address=rs.getString("address");
		joindate=rs.getString(5);
		//교수님 질문있어요 날짜형식이yyyy-mm-dd 00:00:00 이렇게 받아와서져서 TO_CHAR로 형식을 바꾸고 여기에 ("joindate")를 넣으니까 데이터를 불러들이지 못해서 (5)를 했더니 입력이 됩니다 왜그런거죵?
		grade=rs.getString("grade");
		city=rs.getString("city");
		}
	}catch(SQLException e){
		System.out.println("테이블 호출 실패ㅠㅠ"+e.getMessage());
		
	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>

<form name=modifyform method="post" action="modify_process.jsp">
<h2>홈쇼핑 회원 정보 수정</h2>

<table>
<tr>
<th>회원번호</th>
<td align="left"><input type="text" name="custno" size="15" value="<%=custno%>">
</td>
</tr>

<tr align=center>
<th>회원성명 </th> 
<td align="left"><input type="text" name="custname" size="15" value="<%=custname %>" ></td>
</tr>

<tr align=center>
<th>회원전화 </th>
<td align="left"><input type="tel" name="phone" size="20" value="<%=phone %>"></td>
</tr>

<tr align=center>
<th>회원주소</th>
<td align="left"><input type="text" name="address" size="30" value="<%=address %>"></td>
</tr>

<tr align=center>
<th>가입일자</th>
<td align="left">
<input type="text" name="joindate" value="<%=joindate %>">
</tr>

<tr align=center>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td align="left">
<input type="text" name="grade" size="15" value="<%=grade %>" >
</tr>

<tr align=center>
<th>도시코드</th>
<td align="left">
<input type="text" name="city" size="15" value="<%=city %>" >		
</td>
</tr>

<tr align=center>
<td colspan="2">
<input type="button" value="수정" onclick="javascript:check()">
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