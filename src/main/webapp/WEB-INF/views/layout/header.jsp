<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재학보드</title>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Nanum Gothic Coding', monospace;
}
HTML {
    height: 100%;
}
BODY {
    min-height: 100%;
    background-image: url("https://images.unsplash.com/photo-1598188191222-8494ceb9cd22?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=625&q=80");
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
}

footer {
	text-align: center;
	font-size: 12px;
	opacity: 0.60;
	padding-top: 20px;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: orange;
}
.pageDiv{
	display: flex;
	justify-content: center;
}
.page-item{
	margin: 10px 30px;
}

</style>
</head>
<body>
	<header>

		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<a class="navbar-brand" href="#"> <img
				src="https://pbs.twimg.com/tweet_video_thumb/EA3W9ObVAAAPmOD.jpg:small"
				alt="Logo" style="width: 40px;">
			</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/list">홈</a></li>
				<li class="nav-item"><a class="nav-link" href="/saveForm">글쓰기</a></li>
			</ul>
		</nav>
	</header>
	<div class="container">