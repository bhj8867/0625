<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객정보조회</title>
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
<%@ include file="DBconn.jsp" %>
<%request.setCharacterEncoding("utf-8");%>

<form name="cstselectform" method="post">
<h2>회원매출조회</h2>
<table>
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>고객등급</th>
<th>매출</th>
</tr>

<%
ResultSet rs=null;
PreparedStatement pstmt=null;
//int cnt=0;//인덱스no
String grade="";//=String level=rs.getString("grade");

try{
	String sql="select a.custno,a.custname,a.grade,sum(b.price) from member_tbl_02 a,money_tbl_02 b where b.custno=a.custno group by a.custno,a.custname,a.grade";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		/* cnt++;
		int idx=rs.getInt("id"); */
		//System.out.println(sql);
		String custno=rs.getString(1);
		String custname=rs.getString(2);//DB에있는 데이터 불러옴
		grade=rs.getString(3);
		
		grade=rs.getString(3);
		if(grade.equals("A")){
			grade="VIP";
		}else if(rs.getString(3).equals("B")){
			grade="일반";
		}else if(rs.getString(3).equals("C")){
			grade="직원";
			}
		
		String price=rs.getString(4);
%>

<tr>
<td align=center><%=custno %></td>
<td align=center><%=custname %></td>
<td align=center><%=grade %></td>
<td align=center><%=price %></td>
</tr>

<%		
	}
}catch(SQLException e){
	System.out.println("테이블 조회 실패ㅠㅠ "+e.getMessage());
	
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}
%>
</table>
</form>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>