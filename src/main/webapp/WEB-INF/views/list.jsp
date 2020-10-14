<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="layout/header.jsp" %>

	<main>
	<br/>
		<h1>게시글목록</h1>
		<br/>
		<table class="table table-bordered">
			<tr>
				<td>ID</td>
				<td>TITLE</td>
				<td>CONTENT</td>
				<td>READCOUNT</td>
				<td>CREATEDATE</td>
			</tr>
			<c:forEach var="board" items="${boards}">
				<tr>
					<td><a href="/board/${board.id}">${board.id}</a></td>
					<td><a href="/board/${board.id }">${board.title }</a></td>
					<td>${board.content }</td>
					<td>${board.readCount }</td>
					<td>${board.createDate }</td>
				</tr>
			</c:forEach>
		</table>
	</main>
	
<%@ include file="layout/footer.jsp" %>


