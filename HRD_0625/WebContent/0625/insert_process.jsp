<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객정보 등록 process</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

try{
	String sql="insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	System.out.println("??");
	
	
	//입력받은 데이터를 물음표 순서에 맞게 넣는다.
	//""안에는 form 안에 input name=""이 들어온다.
	pstmt.setString(1, request.getParameter("custno"));
	pstmt.setString(2, request.getParameter("custname"));
	pstmt.setString(3, request.getParameter("phone"));
	pstmt.setString(4, request.getParameter("address"));
	pstmt.setString(5, request.getParameter("joindate"));
	pstmt.setString(6, request.getParameter("grade"));
	pstmt.setString(7, request.getParameter("city"));
	
	pstmt.executeUpdate();

	System.out.println("테이블 삽입 성공 ");
	
	%>
	<script type="text/javascript">
	alert("회원등록이 완료 되었습니다!");
	location.href="select.jsp";
	</script>
	<%
}catch(SQLException e){
	out.print("데이터 삽입 실패ㅠㅠ"+e.getMessage());
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}
%>

</body>
</html>