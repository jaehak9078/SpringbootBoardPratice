<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp" %>
<style>
	#title{
		margin-left:30px;
		height:40px;
		margin-bottom:30px;
		margin-top:40px;
	}
	h1{
		margin-top:40px;
	}
</style>

<main>
<h1>글쓰기 페이지</h1>
<hr/>

<form action="/save" method="post">
	<label for="title"><h3>제목</h3></label>
	
	<input type="text" name="title" id="title" style="width: 90%;"/>
	
	<div id="editor" style="height: 500px;">

</div>
	<input type="hidden" name="content" id="content" value="">
	<br/>
	<button onclick="write" type="button" class="btn btn-success float-right" >글쓰기완료</button>
</form>
</main>
<script>


var quill = new Quill('#editor', {
    theme: 'snow',
    placeholder:'내용입력',
    
  });
  

let value =  document.querySelector('#editor').innerText; 
let title =  document.querySelector('#title').value;
let content_el =  document.querySelector('#content');
content_el.value = value;
let content = content_el.value;
console.log(value);
let board = {
		title: title,
		content: content
			};

let write = () => {
	fetch("/board/",{
			method:"post",
			headers:{
				'Content-Type':'application/json; charset=utf-8',
				},
				body:JSON.stringify(board),
		}).then(res=> res.text()).then(res=>{
			if(res === "ok"){
				alert("등록완료");
				location.href = "/board/list";
				}else{
				alert("등록실패");
					}
			});
}
    </script>
<%@ include file="layout/footer.jsp" %>