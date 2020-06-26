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
<h2>회원목록조회/수정</h2>
<table>
<tr>
<th>회원번호</th>
<th>회원성명</th>
<th>전화번호</th>
<th>주소</th>
<th>가입일자</th>
<th>고객등급</th>
<th>거주지역</th>
</tr>

<%
ResultSet rs=null;
PreparedStatement pstmt=null;
//int cnt=0;//인덱스no
//String grade="";//String grade=rs.getString("grade");

try{
	String sql="select custno, custname, phone,address,to_char(joindate,'yyyy-mm-dd'), grade,city from member_tbl_02 order by custno";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		/* cnt++;
		int idx=rs.getInt("id"); */
		//System.out.println(sql);
		String custno=rs.getString(1);
		String custname=rs.getString(2);//DB에있는 데이터 불러옴
		String phone=rs.getString(3);
		String address=rs.getString(4);
		String joindate=rs.getString(5);
		
		//입력받은 값과 대치되는 값을 조회
		String grade=rs.getString(6);
		if(grade.equals("A")){
			grade="VIP";
		}else if(rs.getString(6).equals("B")){
			grade="일반";
		}else if(rs.getString(6).equals("C")){
			grade="직원";
			}
		String city=rs.getString(7);		
%>

<tr>
<td align=center><a href="modify.jsp?custno=<%=custno%>"><%=custno %></a></td>
<td align=center><%=custname %></td>
<td align=center><%=phone %></td>
<td align=center><%=address %></td>
<td align=center><%=joindate %></td>
<td align=center><%=grade %></td>
<td align=center><%=city %></td>
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