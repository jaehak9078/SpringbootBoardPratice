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


	<label for="title"><h3>제목</h3></label>
	
	<input type="text" name="title" id="title" style="width: 90%;"/>
	
	<div id="editor" style="height: 500px;">

	</div>
	<br/>
	<button type="button" onclick="save()">글쓰기완료</button>

</main>
<script>


var quill = new Quill('#editor', {
    theme: 'snow',
    placeholder:'내용입력',
    
  });

function save(){
	let value =  document.querySelector('#editor .ql-editor').innerHTML; 
	let title =  document.querySelector('#title').value;
	let content = document.querySelector('#editor .ql-editor').innerHTML;
	console.log(value);
	let board = {
			title: title,
			content: content
				};
		
	fetch("/save",{
			method:"post",
			headers:{
				'Content-Type':'application/json; charset=utf-8',
				},
				body:JSON.stringify(board),
		}).then(res=> res.text()).then(res=>{
			if(res === "ok"){
				alert("등록완료");
				location.href = "/list";
				}else{
				alert("등록실패");
					}
			});
}
  



    </script>
<%@ include file="layout/footer.jsp" %>