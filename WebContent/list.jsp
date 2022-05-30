<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.javaex.vo.PersonVo" %>
<%
	List<PersonVo> personList = (List<PersonVo>)request.getAttribute("pList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>전화번호부</h1>
	<h2>리스트</h2>
	<p>입력한 정보 내역입니다.</p>
	
	
	<%for(int i=0;i<personList.size();i++) { %>
	<table border="1">
		<tr>
			<td>이름(name)</td>
			<td><%= personList.get(i).name%></td>
		</tr>
		<tr>
			<td>핸드폰(hp)</td>
			<td><%= personList.get(i).hp%></td>
		</tr>
		<tr>
			<td>회사(company)</td>
			<td><%= personList.get(i).company%></td>
		</tr>
		<tr>
			<td><a href="./pbc?action=updateform&id=<%=personList.get(i).personId %>">수정</a></td>
			<td><a href="./pbc?action=delete&id=<%=personList.get(i).personId %>">삭제</a></td>
		</tr>
	</table>
	<br>
	<%} %>
	
	
	<a href="./pbc?action=writeform">추가번호 등록</a>

</body>
</html>