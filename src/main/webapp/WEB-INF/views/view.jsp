<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#boardListDisp').load('${path}/list/pageNum/${pageNum}');
		$('#rbdListDisp').load('${path}/replyList/bno/${board.num}');
		$('#rInsert').click(function() {
			/* 		var sendData = 'bno='+frm.bno.value+
						'&replyer='+frm.replyer.value+
						'&replytext='+frm.replytext.value; */
			var sendData = $('#frm').serialize();
			$.post('${path}/rInsert', sendData, function(data) {
				alert('댓글이 작성 되었습니다.');
				$('#rbdListDisp').html(data);
				frm.replytext.value = "";
			});
		});
	});
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">게시글 상세 내역</h2>
		<table class="table table-striped table-bordered">
			<tr>
				<td>제목</td>
				<td>${board.subject}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.writer}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${board.email}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${board.readcount}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>${board.content}</pre></td>
			</tr>
			<tr>
				<td colspan="2"><a href="${path}/list/pageNum/${pageNum}"
					class="btn btn-info">게시글 목록</a> <a
					href="${path}/updateForm/num/${board.num}/pageNum/${pageNum}"
					class="btn btn-warning">수정</a> <a
					href="${path}/deleteForm/num/${board.num}/pageNum/${pageNum}"
					class="btn btn-danger">삭제</a> <a
					href="${path}/insertForm/nm/${board.num}/pageNum/${pageNum}"
					class="btn btn-success">답글</a>
		</table>
		<form action="" name="frm" id="frm">
			<input type="hidden" name="bno" value="${board.num}">
			<table class="table table-hover">
				<caption>댓글 작성</caption>
				<!-- 회원 게시판은 로그인한 사람의 아이디나 또는 이름 -->
				<tr>
					<td>작성자</td>
					<td><input type="text" name="replyer" value="${board.writer}"
						size="6"></td>
					<td>댓글</td>
					<td><textarea rows="3" cols="30" name="replytext"></textarea></td>
					<td colspan="2"><input type="button" value="댓글 입력"
						id="rInsert"></td>
				</tr>
			</table>
		</form>
		<div id="rbdListDisp"></div>
		<div id="boardListDisp"></div>
	</div>
</body>
</html>