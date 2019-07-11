<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.0/handlebars.min.js"></script>
<!-- <link rel="stylesheet" href="/kingsmap/css/bootstrap.css">-->
<!-- <link rel="stylesheet" href="/kingsmap/css/main.css">
<link rel="stylesheet" href="/kingsmap/css/style.css">
<link rel="stylesheet" href="/kingsmap/css/a.css">
<link rel="stylesheet" href="/kingsmap/css/common2.css"> -->
<style type="text/css">
body {

	padding-left: 25px;
}

table {
	border-collapse: collapse;	
}

td input {
	outline: none;
	border: 1px;
	width: 100%;
}

textarea {
	resize: none;
	outline: none;
	border: 0;
	width: 100%;
	overflow:hidden;
}

#addBtn {
	text-align: center;
	font-weight: bold;
	color: white;
	font-size: 15px;
	background-color: #006DCC;
	cursor: pointer;
	height: 30px;
/* 	padding-top: 5px; */
}

#moreReply {
	text-align: center;
	border: 1px;
	color: white;
	background-color: gray;
	cursor: pointer;
	width: 400px;
	height: 30px;
	padding-top: 4px;
}

#replyListBtn {
	cursor: pointer;
}

#spacing {
	width: 400px;
	height: 25px;
	/* border-bottom: 2px solid black; */
}

#hiddenSpacing {
	width: 400px;
	height: 20px;
	display: none;
}

#deleteDiv {
	width: 400px;
	height: 20px;
	border: 1px solid black;
	display: none;
}

# pagingDiv{
	width: 400px;
	text-align: center;
}

.pagingStyle {
	border: 1px solid black;
	width: 30px;
	height: 20px;
	padding: 5px auto;
	margin: 3px;
}

button {
	border: 1px solid #ffffff;
	background-color: white;
}
</style>
</head>
<body>
	<div id="beanSpacing" style="height: 10px;"></div>
	<div id="title" style="width: 400px; text-align: center;">
		<b>- 간단게시판 -</b>
		<br><br>
	</div>
	<%-- 게시글 작성 --%>
	<div id="addComment">
		<table border="1">
			<tr>
				<!-- <td>게시글 작성자</td> -->
				<td width="400px"><input type="text" id="writer"
					placeholder="작성자명을 입력해주세요" maxlength="7" onkeypress="if(event.keyCode==13){addComment(); return;}">${writer }</td>
			</tr>
			<tr>
				<!-- <td>게시글 내용</td>, 글자 수 계산 -->
				<td align="right">
					<textarea id="content" placeholder="내용을 입력해주세요. &#10;200바이트까지 작성 가능합니다." onkeyup="viewDisplay(this)" cols="50" rows="3" maxlength="200"></textarea><br>
					<p><span class="viewByte"></span>&nbsp;/ 200 byte&nbsp;</p>
				</td>
			</tr>
			<tr>
				<!-- 게시글 비밀번호 -->
				<td><input type="password" id="password"
					placeholder="비밀번호를 입력해주세요" onkeypress="if(event.keyCode==13){addComment(); return;}"></td>
			</tr>
			<tr>
				<!-- hidden : ip어드레스 -->
				<td><input type="hidden" id="ipaddr" value="${ipaddr }"></td>
			</tr>
			<tr>
				<td style="width:400px; height: 30px; background-color: black; border: 1px solid black;" align="center"><button type="submit" id="addBtn" style="width: 400px; height: 30px;">등록</button></td>
			</tr>
		</table>
	</div>
	<!-- <div id="spacing1" style="width: 400px; height: 20px;"></div> -->
	
	
	
	<div id="spacing1" style="width: 400px; height: 20px;"></div>



	<%-- 게시글 리스트 출력 --%>
	<div id="commentList"></div>


	<!-- <div id="moreReply">▽ 댓글 더 보기</div> -->

	<div id="pagingDiv"></div>
	
	

	<%-- 댓글 작성 div --%>
<%-- <div id="replyDiv">
	<table border=1>
		<tr>
			<!-- 댓글 작성자 -->
			<td width="100">작성자</td>
			<td width="300"><input type="text" class="replyWriter"></td>
		</tr>
		<tr>
			<!-- 댓글 내용 -->
			<td>내용</td>
			<td><textarea rows="" cols="" class="replyContent"></textarea>
		</tr>
		<tr>
			<!-- 댓글 비밀번호 -->
			<td>비밀번호</td>
			<td><input type="password" class="replyPassword"></td>
		</tr>
		<tr>
			<!-- hidden : 게시글 글번호 -->
			<td colspan="2"><input type="hidden" class="CommentNum" value="${commentDTO.num }"></td>
		</tr>
		<tr>
			<!-- hidden : ip주소 -->
			<td colspan="2" style="letter-spacing: 10px;"><input type="hidden" class="replyIpaddr" value="${ipaddr }"></td>
		</tr>
		<tr>
			<td colspan="2"><div id="addReply">등록</div></td>
		</tr>
	</table>
</div> --%>



	<%-- template 핸들러 --%>
	<script id="template1" type="text/x-handlebars-template">

	{{#each commentList}}
	<div id="comment_{{num}}" width="400px" style="border-collapse:collapse;">
		<table border=1 cellspacing="0" cellpadding="3" width="400px">
			<tr>
				<td colspan="3" align="right"><input type="hidden" id="hiddenNum_{{num}}" value="{{num}}"></td>
			</tr>
			<tr>
				<td colspan="2" width="330px" style="padding-left: 5px;"><img src="/kingsmap/images/people-icon.png" width="20px" height="18px">&nbsp;<b>{{writer}}</b>
				<span align="left" style="letter-spacing: 0.03em; font-size: 5px;">{{ipaddr}}</span></td>
				<td width="170px" align="right">{{day}}&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" height="85px" style="padding: 10px; border-top:1px solid black; word-break:break-all;">{{content}}</td>
			</tr>
			<tr>
				<td align="center" style="border-bottom:2px solid black;"><button type="button" id="replyListBtn_{{num}}" value="{{num}}" class="replyListBtn">답글 작성 / 보기</div></td>
				<td align="center" style="border-bottom:2px solid black;"><button type="button" id="modifyBtn_{{num}}" value="{{num}}" class="modifyBtn">게시글 수정</td>
				<td align="center" style="border-bottom:2px solid black;"><button type="button" onclick="deleteComment({{num}});">게시글 삭제</td>
			</tr>
		</table>
		<div id="replyList_{{num}}" style="margin-top: 0px;">

		</div>
		<div id="addReplyDiv_{{num}}" style="border-bottom: 1px solid black; width: 400px; height: 100px; margin-top: 0px; margin-bottom: 20px; display: none;">
			<br>
			<table border=1>
				<tr>
					<td width="400px"><input type="text" id="replyWriter_{{num}}" placeholder="댓글 작성자 입력"></td>
				</tr>
				<tr>
					<td height="50px"><textarea id="replyContent_{{num}}" placeholder="댓글은 200자를 초과할 수 없습니다.&#13;&#10;댓글은 자신을 표현하는 거울입니다. 아름다운 말을 씁시다."></textarea></td>
				</tr>
				<tr>
					<td><input type="password" id="replyPassword_{{num}}" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td align="right"><button type="button" id="addReplyBtn_{{num}}" value="{{num}}" class="addReplyBtn">댓글등록</button></td>
				</tr>
				<tr>
					<td><input type="hidden" id="replyIpaddr_{{num}}" value="${ipaddr}"></td>
				</tr>
				<tr>
					<td><input type="hidden" id="commentNum_{{num}}" value="{{num}}"></td>
				</tr>
				<div id="hiddenSpacing"></div>
			</table>
		</div>

		<!-- 게시글 수정 -->
	<div id="modifyDiv_{{num}}" style="display:none;">
		<table border="1" width="400px">
			<tr>
				<td><input type="text" id="modifyWriter_{{num}}" value="{{writer}}" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="right">
					<textarea id="modifyContent_{{num}}" onkeyup="viewDisplay(this)" cols="20" rows="3" maxlength="200"">{{content}}</textarea><br>
					<p><span class="viewByte"></span>&nbsp;/ 200 byte&nbsp;</p>
				</td>
			</tr>
			<tr>
				<td><input type="password" id="modifyPassword_{{num}}"
					placeholder="수정을 위해 비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
				<td><input type="hidden" id="ipaddr" value="{{ipaddr }}"></td>
			</tr>
			<tr>
				<td style="height: 30px; border: 1px solid black;" align="center"><button type="submit" value="{{num}}" class="modifyConfirm">수정</button></td>
			</tr>
		</table>
	</div>

	</div>
	<br>
	{{/each}}
</script>

	
<script id="template2" type="text/x-handlebars-template">
{{#each .}}
<table border=1>
	<tr>
		<td width="400px" colspan="2">
			<b>&nbsp;<img src="/kingsmap/images/people-icon.png" width="20px" height="18px">&nbsp;{{replyWriter}}</b>&nbsp;
			<span align="left" style="letter-spacing: 0.03em; font-size: 5px;">&nbsp;{{replyIpaddr}}</span>
		</td>
	<tr>
	<tr>
		<td width="400px" colspan="2" height="50px">{{replyContent}}</td>
	</tr>
	<tr>
		<td width="150px">{{substrDate}}</td>
		<td width="220px" style="letter-spacing: 0.02em;"></td>
	</tr>
</table>
{{/each}}
</script>



	<script type="text/javascript">

	loadComment(1);
	
	// 게시글 목록 출력
	function loadComment(pageNum){
	/* 	var pageNum = pageNum*1;
		alert(typeof pageNum);
	*/
		$.ajax({
			type:"GET",
			url:"list_comment2?pageNum="+pageNum,
			dataType:"json",
			success: function(json){
				var source=$("#template1").html();
				var template1=Handlebars.compile(source);
				$("#commentList").html(template1(json));
				
				displayPaging(json.pager);
				
				$(".replyListBtn").click(function(){
					var num=$(this).val();
					// alert($(this).text());
					
					if($(this).text()!="리스트 닫기") {
						$.ajax({
							type: "POST",
							url: "list_reply",
							data: {"commentNum":num},
							dataType: "json",
							success: function(json) {
								
								var replySource=$("#template2").html();
								var template2=Handlebars.compile(replySource);
								$("#replyList_"+num).show().html(template2(json));
								$("#addReplyDiv_"+num).show().appendTo("#comment_"+num);
								$("#hiddenSpacing").show().appendTo("#comment_"+num);
							},
							error: function(req) {
								alert('에러에러 = ' + req.status);
							}
						});
					}
					if($(this).text()=="리스트 닫기") {
						$(this).text("답글 작성 / 보기");
						$("#replyList_"+num).hide().appendTo("#comment_n"+num);
						$("#addReplyDiv_"+num).hide().appendTo("#comment_"+num);
						$("#hiddenSpacing").hide().appendTo("#comment_"+num);
					} else {
						$(this).text("리스트 닫기");
					}
				});
				
				
				// 게시글 수정(버튼 클릭)
				$(".modifyBtn").click(function() {
					var num = $(this).val();
					// alert(num);
					
					if($(this).text()!="수정 취소"){
						$("#modifyDiv_"+num).show();
						
						$(".modifyConfirm").click(function(){
							var writer = $("#modifyWriter_"+num).val();
							var content = $("#modifyContent_"+num).val();
							content.replace(/\n/g,"ㅎ");
							content.replace(/\r/g,"ㅎ");
							var passwordConfirm = $("#modifyPassword_"+num).val();
							var ipaddr = $("#ipaddr").val();
							if(content==''  || content.trim()=='' || content.trim()==null) {
								alert('내용을 입력해주세요');
								$("#modifyContent_"+num).focus();
								return;
							};
										
							$.ajax({
								type: "POST",
								url: "update_comment",
								data: {"num": num, "content": content, "passwordConfirm": passwordConfirm},
								dataType: "text",
								success: function(result) {
									if(result=="success"){
										alert('게시글을 정상적으로 수정하였습니다.');
										/* $("#modifyContent_"+num).val(""); */
										$("#hiddenNum_"+num).closest("tr").appendTo("<td colspan='3'>마지막으로 수정된 시각 : {{modifyDate}}</td>");
										$("#modifyPassword_"+num).val("");
										$("#modifyDiv_"+num).hide();
										loadComment(1);
									} else {
										alert('비밀번호가 맞지 않습니다.\n비밀번호를 다시 한 번 확인해주세요.')
									}
								},
								error: function(req) {
									alert('에러에러 = ' + req.status);
								}
							});
						})
					}
					if($(this).text()=="수정 취소") {
						$(this).text("게시글 수정");
						$("#modifyDiv_"+num).hide();
					    $(this).off(".modifyConfirm");
					    return false;
						/* loadComment(num); */
						
						
					} else {
						$(this).text("수정 취소");
					}
				});	
				
				// 댓글등록 버튼 눌렀을 때
				
				$(".addReplyBtn").click(function(){
					//alert('작동확인');
					var num=$(this).val();
					var replyWriter = $("#replyWriter_"+num).val();
					var replyContent = $("#replyContent_"+num).val();
					var replyPassword = $("#replyPassword_"+num).val();
					var replyIpaddr = $("#replyIpaddr_"+num).val();
					var commentNum = $("#commentNum_"+num).val();
					
					if(replyWriter=='') {
						alert('이름을 입력해주세요');
						$("#replyWriter_"+num).focus();
						return;
					};
					
					if(replyContent==''  || replyContent.trim()=='' || replyContent.trim()==null) {
						alert('내용을 입력해주세요');
						$("#replyContent_"+num).focus();
						return;
					};
					
					if(replyPassword=='') {
						alert('비밀번호를 입력해주세요');
						$("#replyPassword_"+num).focus();
						return;
					};
					
					$.ajax({
						type: "POST",
						url: "add_reply",
						headers: {"Content-Type":"application/json"},
						data: JSON.stringify({"replyWriter":replyWriter, "replyContent":replyContent, "replyPassword":replyPassword, "replyIpaddr": replyIpaddr, "commentNum":commentNum}),
						dataType: "text",
						success: function(result) {
							if(result=="success") {
								$("#replyWriter_"+num).val("");
								$("#replyContent_"+num).val("");
								$("#replyPassword_"+num).val("");
								
								reloadReply(num);
							}
						},
						error: function(req){
							alert("에러에러 = " + req.status);
						}
					});
				});
			},
			error:function(req) {
				alert('응답 코드 에러 =' + req.status);
			}
		});
	};
	
	// 게시글 등록(keydown)
	function addComment(){
		var writer = $("#writer").val();
		var content = $("#content").val();
		var password = $("#password").val();
		var ipaddr = $("#ipaddr").val();
		
		if(writer=='') {
			alert('이름을 입력해주세요');
			$("#writer").focus();
			return;
		};
		
		if(content=='' || content.trim()=='' || content.trim()==null) {
			alert('내용을 입력해주세요');
			$("#content").focus();
			return;
		};
		
		if(password=='') {
			alert('비밀번호를 입력해주세요');
			$("#password").focus();
			return;
		};
		
		$.ajax({
			type: "POST",
			url: "add_comment",
			headers: {"Content-Type":"application/json"},
			data: JSON.stringify({"writer":writer, "content":content, "password":password, "ipaddr":ipaddr}),
			dataType: "text",
			success: function(result) {
				if(result=="success"){
					// alert(content);
					$("#writer").val("");
					$("#content").val("");
					$("#password").val("");
					loadComment(1);
				}
			},
			error: function(req) {
				alert('에러에러 = ' + req.status);
			}
		});
	}
	
	// 게시글 등록(버튼 클릭)
	$("#addBtn").click(function() {
		var writer = $("#writer").val();
		var content = $("#content").val();
		content.replace(/\n/g,"ㅎ");
		content.replace(/\r/g,"ㅎ");
		var password = $("#password").val();
		var ipaddr = $("#ipaddr").val();
		
		if(writer=='') {
			alert('이름을 입력해주세요');
			$("#writer").focus();
			return;
		};
		
		if(content=='') {
			alert('내용을 입력해주세요');
			$("#content").focus();
			return;
		};
		
		if(password=='') {
			alert('비밀번호를 입력해주세요');
			$("#password").focus();
			return;
		};
		
		$.ajax({
			type: "POST",
			url: "add_comment",
			headers: {"Content-Type":"application/json"},
			data: JSON.stringify({"writer":writer, "content":content, "password":password, "ipaddr":ipaddr}),
			dataType: "text",
			success: function(result) {
				if(result=="success"){
					// alert(content);
					$("#writer").val("");
					$("#content").val("");
					$("#password").val("");
					loadComment(1);
				}
			},
			error: function(req) {
				alert('에러에러 = ' + req.status);
			}
		});
	});


	// 게시글 제거
	function deleteComment(num){
		/* $("#deleteDiv").show(); */
		var passwordConfirm = prompt('비밀번호를 입력해주세요');
		var password = $("#password123_"+num).val();
		alert(password);
		
		if(password==passwordConfirm) {
			if(confirm('정말로 삭제하시겠습니까?')) {
				$.ajax({
					type: "DELETE",
					url: "remove_comment/"+num,
					headers: {"X-HTTP-Method-override":"DELETE"},
					dataType: "text",
					success: function(result) {
						if(result=="success") {
							loadComment(1);
						}
					},
					error: function(req) {
						alert('에러에러 = ' + req.status);
					}
				});
			}
		} else {
			alert('비밀번호가 맞지 않습니다.');
			return false;
		}
	}

	
	// 댓글 작성 후 리로드
	function reloadReply(num) {
		$.ajax({
			type: "POST",
			url: "list_reply",
			data: {"commentNum":num},
			dataType: "json",
			success: function(json) {
				var replySource=$("#template2").html();
				var template2=Handlebars.compile(replySource);
				$("#replyList_"+num).html(template2(json));
			},
			error: function(req) {
				alert('에러에러 = ' + req.status);
			}
		});
	}
	
	// 페이징 처리
	function displayPaging(pager) {
		var paging="<div style='text-align:center;'>";

		// alert(pager.startPage);

		if(pager.startPage> pager.blockSize) {
			paging+="<a href='javascript:loadComment(1);'><span class='pagingStyle'>처음</span></a>";
			paging+="<a href='javascript:loadComment("+pager.prevPage+");'><span class='pagingStyle'>이전</span></a>";
		} else {
			paging+="<span class='pagingStyle'>처음</span><span class='pagingStyle'>이전</span>";
		}
		
		for(i=pager.startPage;i<=pager.endPage;i++) {
			if(pager.pageNum!=i) {
				paging+="<a href='javascript:loadComment("+i+");'><span class='pagingStyle'>&nbsp;&nbsp;"+i+"&nbsp;&nbsp;</span></a>";
			} else {
				paging+="<span class='pagingStyle'>&nbsp;&nbsp;"+i+"&nbsp;&nbsp;</span>";
			}
		}
		// alert('현재 페이지 = ' + pager.pageNum);
		
		if(pager.endPage != pager.totalPage) {
			paging+="<a href='javascript:loadComment("+pager.nextPage+");'><span class='pagingStyle'>다음</span></a>";
			paging+="<a href='javascript:loadComment("+pager.totalPage+");'><span class='pagingStyle'>마지막</span></a>";
		} else {
			paging+="<span class='pagingStyle'>다음</span><span class='pagingStyle'>마지막</span>";
		}
		paging+="</div>"
		
		$("#pagingDiv").html(paging);
	}
	
	// 글자 수 계산
	var calByte = {
		getByteLength : function(s) {

			if (s == null || s.length == 0) {
				return 0;
			}
			var size = 200;

			for ( var i = 0; i < s.length; i++) {
				size -= this.charByteSize(s.charAt(i));
			}

			if(size<0) {
				var lastContent= $("#content").val();
				alert('200바이트까지만 작성이 가능합니다');
				lastContent = lastContent.slice(0, -1);
				$("#content").val('');
				$("#content").val(lastContent);
				return;
			}
			return size;
		},		
		
		charByteSize : function(ch) {	

			if (ch == null || ch.length == 0) {
				return 0;
			}

			var charCode = ch.charCodeAt(0);

			if (charCode <= 0x00007F) {
				return 1;
			} else if (charCode <= 0x0007FF) {
				return 2;
			} else if (charCode <= 0x00FFFF) {
				return 3;
			} else {
				return 4;
			}
		}
	};
	
	function viewDisplay(obj) {
		$(".viewByte").html( calByte.getByteLength( obj.value ) );
	}
	
	// 게시글 제거
	function deleteComment(num) {
		var passwordConfirm = prompt('비밀번호를 입력해주세요'); 
		// alert(passwordConfirm);
		$.ajax({
			type: "POST",
			url: "remove_comment2",
			/* headers: {"Content-Type":"application/json"}, */
			/* headers: {"X-HTTP-Method-override":"DELETE"}, */
			data:{"num":num, "passwordConfirm":passwordConfirm},
			dataType: "text",
			success: function(result) {
				if(result=="success") {
					alert('정상적으로 삭제되었습니다.');
					loadComment(1);
				} else {
					alert('비밀번호가 맞지 않습니다. \n비밀번호를 다시 한 번 확인해주세요. ')
				}
			},
			error: function(req) {
				alert('응답 오류 = ' + req.status);
			}
		});
	}
	
	function modifyComment(num){
		
	}
	
</script>
</body>
</html>