/**
 * 
 */

	    $("#menu").click(function() {
	      $("#menu>span").toggleClass("on");
	      $(".admin-frame").toggleClass("admin-frame-click");
	    });
	  
	    var uploadFile = $('.fileBox .uploadBtn');
	    uploadFile.on('change', function(){
	    	if(window.FileReader){
	    		var filename = $(this)[0].files[0].name;
	    	} else {
	    		//var filename = $(this).val().split('/').pop().split('\\').pop();
	    		var filename = $(this).val();
	    	}
	    	$(this).siblings('.fileName').val(filename);
	    });
	    
	   $(".previewBtn").click(function () {
		   $("#error").html("");
	    	$(".excel-preview").html("");
	    	if($(".selectType option:selected").val()=="0"){
	    		$("#msg").html("타입을 선택해 주세요.");
	    		return false;
	    	}

	    	if($("#uploadBtn").val()==null || $("#uploadBtn").val()==""){
	    		$("#msg").html("파일을 선택해 주세요.");
	    		return false;
	    	}
			var dotIndex=$("#uploadBtn").val().lastIndexOf(".");
			var fileType=$("#uploadBtn").val().substr(dotIndex+1);
			if(fileType!="xlsx"){
	    		$("#msg").html("엑셀파일(.xlsx)을 선택해 주세요.");
				return false;
			}
			
	    	var form=$("#excel-input")[0];
	    	var formData=new FormData(form);
	    	var type=$(".selectType option:selected").val();
	    	$.ajax({
	    		type: "POST",
	    		url: "preview",
				data: formData,
	    		enctype: "multipart/form-data",
		        contentType:false,
		        processData:false,
		        dataType: "json",
	    		success: function(json){
					//alert(json);
					var html="<table class='excel-table'>";
					$(json).each(function() {
						html+="<tr>";
						html+="<td>"+this.a+"</td>";
						html+="<td>"+this.b+"</td>";
						html+="<td>"+this.c+"</td>";
						html+="<td>"+this.d+"</td>";
						html+="<td>"+this.e+"</td>";
						html+="<td>"+this.f+"</td>";
						html+="<td>"+this.g+"</td>";
						html+="<td>"+this.h+"</td>";
						html+="<td>"+this.i+"</td>";
						html+="<td>"+this.j+"</td>";
						html+="<td>"+this.k+"</td>";
						if(type!="5" || type!="6"){
							html+="<td>"+this.l+"</td>";
							if(type!=1){
								html+="<td>"+this.m+"</td>";
								if(type!=3){
									html+="<td>"+this.n+"</td>";
								}
							}					
						}
						html+="</tr>";
					});
					html+="<tr><td colspan='14'> 생 략 </td></tr>";
					html+="</table>";
					$(".excel-preview").html(html);
				},
				beforeSend: function(){
					$("#loadingImg").show();
					$("#msg").html("파일을 읽고 있습니다.");
				},
				complete: function(){
					$("#loadingImg").hide();
					$("#msg").html("");
				},
				error: function(req){
					$(".excel-preview").html("");
					$("#error").html("타입이 맞지 않습니다.");
					//alert(req.status);
				}
	    	});
	   });
	   
	   $(".updateBtn").click(function() {
		    $(".excel-preview").html("");
		    $("#error").html("");
		    if($(".selectType option:selected").val()=="0"){
	    		$("#msg").html("타입을 선택해 주세요.");
	    		return false;
	    	}
		   	if($("#uploadBtn").val()==null || $("#uploadBtn").val()==""){
	    		$("#msg").html("파일을 선택해 주세요.");
	    		return false;
	    	}
		   	var dotIndex=$("#uploadBtn").val().lastIndexOf(".");
			var fileType=$("#uploadBtn").val().substr(dotIndex+1);
			if(fileType!="xlsx"){
	    		$("#msg").html("엑셀파일(.xlsx)을 선택해 주세요.");
				return false;
			}
		   	var form=$("#excel-input")[0];
	    	var formData=new FormData(form);
	    	$.ajax({
	    		type: "POST",
	    		url: "update",
				data: formData,
	    		enctype: "multipart/form-data",
		        contentType:false,
		        processData:false,
		        dataType: "text",
	    		success: function(text){
	    			//alert(text);
	    		},
	    		beforeSend: function(){
	    			$(".excel-preview").html("");
	    			$("#loadingImg").show();
	    			var cnt=setInterval(function() {
						$.ajax({
							type: "GET",
							url: "update/prg",
							dataType: "text",
							success: function(text){
								$("#msg").html("업데이트가 진행 중 입니다.<br> 업데이트는 시간이 다소 소요될 수 있습니다.<br>..."+text+"% 진행중...");
								if(text=="100"){
									clearInterval(cnt);
									$("#msg").html("업데이트가 완료 되었습니다.");
									$("#loadingImg").hide();
								}
							},
							error: function(req){
								alert(req.status);
							}
						});    				
	    			}, 500);
				},
	    		error: function(req){
					$("#msg").html("");
	    			$("#error").html("타입이 맞지 않습니다.");
	    			//alert("에러 = "+req.status);
	    		}
	    	});
	   });
	   
	   $("#logout").click(function(){
			location.href="/spring/admin/logout"
		   
	   });
	   
