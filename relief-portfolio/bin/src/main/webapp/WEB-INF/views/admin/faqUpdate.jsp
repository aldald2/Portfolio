<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .headDiv{
            display: inline-block;
        }
        .homeimg{
            width: 200px;
            height: 100px;
            display: inline-block;
            margin-left: 100px;
        }
        .adminPage{
            display: inline-block;
            margin-bottom: 0px;
            margin-top: 0px;
            margin-left: 20px;
            color: rgb(0, 51, 85);
            text-align: center;
        }
        .headDiv2{
            display: inline-block;
            bottom: 30px;
        }
        .navbar1 ul li a{
            text-decoration: none;
            color: white;
            background-color: rgb(0, 51, 85);
            display: block;
            width: 300px;
            height: 50px;
        }
        .navbar1 ul li{
            float: left;
        }
        .navbar1{
            width: 50px;
        }
        ul{
            list-style:none;
        }
        .navbar1 ul li a h2{
            text-align: center;
            margin: 0px;
            padding: 5px;
        }
        .navbar1 ul li a:hover{
            background-color: red;
        }
        .mainbar h1{
            color: white;
            background-color: rgb(0, 51, 85);
            margin: 0px;
            margin-left: 340px;
        }
        .insertDiv{
            border: 1px solid lightgray;
            width: 400px;
            height: 650px;
            margin-left: 850px;
        }
        .title{
            width: 300px;
            height: 40px;
            border: 1px solid lightgray;
            border-radius: 5px;
            margin-left: 40px;
            margin-top: 40px;
            font-size: large;
        }
        .adImg{
            margin-left: 100px;
        }
        .condition{
            width: 150px;
            height: 40px;
            margin-top : 10px;
            margin-left: 120px;
        }
        .content{
            width: 350px;
            height: 300px;
            margin-top : 10px;
            margin-left: 20px;
        }
        .Btn{
            background-color: rgb(0, 51, 85);
            color: white;
            width: 100px;
            height: 30px;
            border-radius: 5px;
            border: 0px;
            margin-left: 148px;
        }
        #imgVal{
        	text-align : center;
        	display : block;
        	height : 20px;
        }
    </style>
</head>
<body>
	<jsp:include page="../admin/menubar.jsp"/>
	<div class="mainbar"><h1>FAQ</h1>
        <div class="insertDiv">
            <form action="${ contextPath }/admin/faqUpdate" method="POST" enctype="multipart/form-data" onsubmit="removeHTML();">
                <input type="text" class="title" name="title"placeholder="??????" value="${ f.title }" required>
                <br><br>
                <button type="button" class="Btn" id="btn-upload">????????? ??????</button>
                <p id="imgVal">
                <c:if test="${ !empty f.fileName }">
                ${ f.fileName }
                <input type="hidden" name="fileName" value="${ f.fileName }">
                <input type="hidden" name="renameFileName" value="${ f.renameFileName }">
                </c:if>
                </p>
                <input type="file" class="adImg" name="uploadFile" id="file">
                <input type="hidden" name="fid" value="${ f.fid }">
                <br>
                <br>
                <textarea id="summernote" class="content" name="content">${ f.content }</textarea>
                <br>
                <button type="submit" class="Btn">??????</button>
            </form>
        </div>
    </div>
    <script>
	    $('#summernote').summernote({
	    	placeholder: '????????? ??????????????????.', 
	    	tabsize: 2,
	    	minHeight: null,
	    	maxHeight: null,
	    	lang : 'ko-KR',
	    	height: 370 });
	    
    	function removeHTML(){
    		var str = $(".content").val();
    		str = str.replace(/<br\/>/ig, "\n");
    		str = str.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
			$(".content").val(str);
    	}
    	$(function () {

    		$('#btn-upload').click(function (e) {

    		e.preventDefault();

    		$('#file').click();
				
    		});

    		})
    	var imgVal = document.getElementById("imgVal");
    	$("#file").on("change", function(){
    		if(window.FileReader){
    		      var filename = $(this)[0].files[0].name;
    		    } else {
    		      var filename = $(this).val().split('/').pop().split('\\').pop();
    		    }
				console.log(filename);
    		    imgVal.innerHTML = filename;
    	})
    </script>
</body>
</html>