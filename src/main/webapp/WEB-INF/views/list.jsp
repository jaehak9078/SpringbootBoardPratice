<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="layout/header.jsp"%>

<main>
	<br />
	<h1>게시글목록</h1>
	<br />
	<table class="table table-bordered">
		<tr>
			<td>ID</td>
			<td>TITLE</td>
			<td>CONTENT</td>
			<td>READCOUNT</td>
			<td>CREATEDATE</td>
		</tr>
		<c:forEach var="board" items="${boards.content}" varStatus="status">
			<tr>
				<td><a href="/board/${board.id}">${board.id}</a></td>
				<td><a href="/board/${board.id }">${board.title }</a></td>
				<td>${contents[status.index]}</td>
				<td>${board.readCount }</td>
				<td>${board.createDate }</td>

			</tr>
			<input type="hidden" value="${board.content }" id="contentValue" />
		</c:forEach>

	</table>
	<div class="pageDiv">
		<ul class="pagination">
		<c:choose>
		<c:when test="${boards.first eq true}">
			<li class="page-item disabled"><a class="page-link" href="/list?page=${boards.pageable.pageNumber-1 }">Previous</a></li>
			<li class="page-item"><a class="page-link" href="/list?page=${boards.pageable.pageNumber+1 }">Next</a></li>
		</c:when>
		<c:when test="${boards.last eq true}">
			<li class="page-item"><a class="page-link" href="/list?page=${boards.pageable.pageNumber-1 }">Previous</a></li>
			<li class="page-item disabled"><a class="page-link" href="/list?page=${boards.pageable.pageNumber+1 }">Next</a></li>
		</c:when>
		<c:otherwise>
			<li class="page-item"><a class="page-link" href="/list?page=${boards.pageable.pageNumber-1 }">Previous</a></li>
			<li class="page-item"><a class="page-link" href="/list?page=${boards.pageable.pageNumber+1 }">Next</a></li>
		</c:otherwise>
		</c:choose>
			
		</ul>
	</div>
</main>

<script>
	function contentFunction() {
		let content = document.querySelector('#content');
		let contentValue = document.querySelector('#contentValue').value;
		content.innerHTML = contentValue;
	}
</script>

<%@ include file="layout/footer.jsp"%>


