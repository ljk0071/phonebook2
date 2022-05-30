<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.javaex.dao.PhoneDao"  %>
<%@ page import="com.javaex.vo.PersonVo"  %>
<%@ page import="java.util.List"  %>
<% 
	PhoneDao phoneDao = new PhoneDao();
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateForm</title>
</head>
<body>
	<h1>전화번호부</h1>
	<h2>수정폼</h2>
	<p>전화번호를 수정하려면<br>아래항목을 기입하고 "수정"버튼을 클릭하세요.</p>
	<br>
	
	<form action="./pbc" method="get" target="blank">
		<input type="hidden" name="id" value=<%=id %>>
		이름(name) <input type="text" name="name" value="<%=phoneDao.Select(Integer.parseInt(id)).name %>"><br>
		핸드폰(hp) <input type="text" name="hp" value="<%=phoneDao.Select(Integer.parseInt(id)).hp %>"><br>
		회사(company) <input type="text" name="company" value="<%=phoneDao.Select(Integer.parseInt(id)).company %>"><br>
		<input type="hidden" name="action" value="update">
		<button type="submit">수정</button>
	</form>
	

</body>
</html>