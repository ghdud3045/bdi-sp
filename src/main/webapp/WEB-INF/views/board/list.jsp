<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>스프링테스트</title>
</head>
<script>
window.addEventListener('load',function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/japan');
	xhr.onreadystatechange = function(){
		if(xhr.readyState==4){
			if(xhr.status==200){
				var res = JSON.parse(xhr.responseText);
				var html ='';
				for(var b of res){
					html += '<tr>';
					html += '<td>' + b.binum + '<td>';
					html += '<td><input type="text" name="bititle' + b.binum + '" value="' + b.bititle + '"></td>';
					html += '<td><input type="text" name="bitext' + b.binum + '" value="' + b.bitext +'"></td>';
					html += '<td><input type="text" name="bififle' + b.binum + '" value="' + b.bififle +'"></td>';
					html += '<td><input type="text" name="bicredat' + b.binum + '" value="' + b.bicredat +'"></td>';
					html += '<td><input type="text" name="bimoddat' + b.binum + '" value="' + b.bimoddat +'"></td>';
					html += '<td><input type="text" name="bicnt' + b.binum + '" value="' + b.bicnt +'"></td>';
					html += '<td><input type="text" name="biactive' + b.binum + '" value="' + b.biactive +'"></td>';
					html += '<td><input type="text" name="uinum' + b.binum + '" value="' + b.uinum +'"></td>';
					html += '<td><button onclick="boardUpdate('+ b.binum+')">수정</button>';
					html += ' <button onclick="boardDelete('+b.binum+')">삭제</button></td>';
					html += '<tr>';
				}
				document.querySelector('tbody').insertAdjacentHTML('beforeend',html);
			}else{
				
			}
		}
	}
	xhr.send();
})
</script>
<body>
<talbe border="1">
<thead>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>내용</th>
	<th>파일</th>
	<th>날짜</th>
	<th>시간</th>
	<th>조회수</th>
	<th>좋아요</th>
	<th>유저수</th>
	<th>수정/삭제</th>
	</tr>
</thead>
<tbody id="biBody">
</tbody>
</talbe>
<button onclick="boardAdd()">보드추가</button>
<script>
function boardUpdate(binum){
	var bititle = document.querySelector('input[name=bititle' + binum + ']').value;
	var bitext = document.querySelector('input[name=bitext' + binum + ']').value;
	var param = {
		binum : binum,
		bititle : bititle,
		bitext : bitext,
		bifile : bifile,
		bicredat : bicredat,
		bimoddat : bimoddat,
		bicnt : bicnt,
		biactive : biactive,
		bininum : biuinum
	};
	var xhr = new XMLHttpRequest();
	var url = "/board";
	xhr.open('PUT',url);
	xhr.setRequestHeader('Content-Type','appplication/json');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				if(xhr.responseText == '1'){
					alert('수정성공');
					location.href= '/uri/board/list';
			}
		}else{
		alert('수정실패');
		}
		}
	}
	xhr.send(JSON.stringify(param));
}
function boardDelete(binum){
	var xhr = new XMLHttpRequest();
	var url = "/board/" + binum;
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				if(xhr.responseText = '1'){
					alert('삭제성공');
					location.href = '/board';
				}
			}else{
				alert('삭제실패');
			}
		}
	}
	xhr.send();
}
function boardAdd(){
	var html = '<tr>';
	html += '<td>&nbsp;</td>';
	html += '<td><input type="text" name="bititle"</td>';
	html += '<td><input type="text" name="bitext"</td>';
	html += '<td><input type="text" name="bifile"</td>';
	html += '<td><input type="text" name="bicredat"</td>';
	html += '<td><input type="text" name="bimoddat"</td>';
	html += '<td><input type="text" name="bicnt"</td>';
	html += '<td><input type="text" name="biactive"</td>';
	html += '<td><input type="text" name="uinum"</td>';
	html += '<td><button onclick="boardInsert()">저장</button></td>';
	html += '<tr>';
	document.querySelector('tbody').insertAdjacentHTML('beforeend',html);
}
	function boardInsert(){
		var bititle = document.querySelector('input[name=bititle]').value;
		var bitext = document.querySelector('input[name=bitext]').value;
		var param = {
				binum : binum,
				bititle : bititle,
				bitext : bitext,
				bifile : bifile,
				bicredat : bicredat,
				bimoddat : bimoddat,
				bicnt : bicnt,
				biactive : biactive,
				bininum : biuinum
		};
		var xhr = new XMLHttpRequest();
		var url = "/board";
		xhr.open
	}
}
</script>
</body>
</html>