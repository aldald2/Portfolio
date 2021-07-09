<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.mainbar{
			width : 70%;
			float : left;
		}
		.titleArea{
			width : 700px;
			height : 52px;
			float : left;
			background-color: #597a96;
		}
		
		h2{
			color : white;
			font-weight : bold;
			text-align : center;
			padding-top : 7px;
		}
        .headDiv{
            display: inline-block;
        }
        .homeimg{
            width: 200px;
            height: 100px;
            display: inline-block;
        }
        .adminPage{
            display: inline-block;
            margin-bottom: 0px;
            margin-top: 0px;
            margin-left: 20px;
            color: #597a96;
            text-align: center;
        }
        .headDiv2{
            display: inline-block;
            bottom: 30px;
        }
        .c_name{
            width: 300px;
            height: 40px;
            border: 1px solid lightgray;
            border-radius: 5px;
            margin-top: 40px;
            font-size: large;
        }
        .radioArea{
        	width : 700px;
        	text-align : center;
        }
        .condition{
            width: 150px;
            height: 40px;
            margin-top : 10px;
        }
        .btn1{
            background-color: #597a96;
            color: white;
            width: 100px;
            height: 30px;
            border-radius: 5px;
            border: 0px;
        }
        h3{
        	text-align : center;
        }
        </style>
</head>
<body>
	<jsp:include page="../admin/menubar.jsp"/>
	<div class="mainbar">
	<div class="titleArea">
	<h2>카테고리</h2>	
	</div>
		<div class="radioArea">
        <form method="POST" action="${ contextPath }/admin/insertCategory">
        <input type="radio" name="cgroup" id="1" value="0" checked class="categoryRadio"><label for="1">1차 카테고리 등록</label>
        <input type="radio" name="cgroup" id="2" value="1"><label for="2">2차 카테고리 등록</label>
        <input type="radio" name="cgroup" id="3" value="2"><label for="3">3차 카테고리 등록</label>
            <input type="text" name="cname" class="c_name" placeholder="추가할 카테고리명을 입력해주세요.">
            <br>
            <h3>선행 카테고리 선택</h3>
            <select class="condition" name="cid2" disabled>
                <option>-----</option>
            </select>
            <input type="submit" value="확인" class="btn1">
        </form>
        </div>>
    </div>
    <script>
       $(function(){
           $("input[name='cgroup']").on('change', function(){
                if($(this).val() == 0){
                    $(".condition").attr("disabled", true)
                    $("input[name='cname']").val("");
                    $('.condition').children('option').remove();
                } else if($(this).val() == 1){
                    $(".condition").attr("disabled", false)
                    $("input[name='cname']").val("");
                    var cgroup = $("input[name='cgroup']:checked").val();
                    
                    $.ajax({
                    	url : "${ contextPath }/admin/selectcnameList",
                    	data : { cgroup : cgroup },
                    	type : "get",
                    	dataType : "json",
                    	success : function(data){
                    		console.log(data);
                    		$('.condition').empty();
                    		var option = "";
                    		for(var i in data.list){
                    			option = $("<option value=" + data.list[i].cid + ">"+ data.list[i].cname + "</option>");
                    			$(".condition").append(option);
                    		}	
                    	},
                    	error : function(e){
                    		alert("error code :" + e.status + "\n"
    								+ "message : " + e.responseText);
                    	}
                    });
                } else if($(this).val() == 2){
                	$(".condition").attr("disabled", false)
                    $("input[name=cname]").val("");
                	var cgroup = $("input[name='cgroup']:checked").val();
                	
                	$.ajax({
                    	url : "${ contextPath }/admin/selectcnameList",
                    	data : { cgroup : cgroup },
                    	type : "get",
                    	dataType : "json",
                    	success : function(data){
                    		console.log(data);
                    		$('.condition').empty();
                    		var option = "";
                    		for(var i in data.list){
                    			option = $("<option value=" + data.list[i].cid + ">"+ data.list[i].cname + "</option>");
                    			$(".condition").append(option);
                    		}	
                    	},
                    	error : function(e){
                    		alert("error code :" + e.status + "\n"
    								+ "message : " + e.responseText);
                    	}
                    });
                }
           });
       })
    </script>
</body>
</html>