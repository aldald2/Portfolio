<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        .homeimg{
            width: 200px;
            height: 100px;
            display: block;
            margin: 0px auto;
        }
        .loginFormDiv{
            
            border: 1px solid gray;
            width: 400px;
            height: 500px;
            text-align: center;
        }
        .idInput{
            width: 250px;
            height: 40px;
            border-radius: 5px;
            margin-top: 50px;
        }
        .pwdInput{
            width: 250px;
            height: 40px;
            border-radius: 3px;
        }
        .loginBtn{
            width: 260px;
            height: 40px;
            background-color: rgb(0, 51, 85);
            color : white;
            border-radius: 3px;
        }
        .findId{
            margin-left: 100px;
            text-decoration: none;
            color: gray;
            font-size: small;
        }
        .findPwd{
            text-decoration: none;
            color: gray;
            font-size: small;
        }
        .findId:hover{
            color: rgb(0, 51, 85);
        }
        .findPwd:hover{
            color: rgb(0, 51, 85);
        }
        .goJoinDiv{
            position: absolute;
            top: 25%;
            left: 40%;
        }
        h3{
            color: gray;
            text-align: center;
        }
        .joinBtn{
            background-color: rgb(0, 51, 85);
            border-radius: 5px;
            color: white;
            margin-left: 150px;
            height: 50px;
            font-weight : bolder;
        }
    </style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg"/>
	</c:if>
	
	<div class="goJoinDiv">
        <div class="loginFormDiv">
            <a href="${ contextPath }/home"><img src="${ contextPath }/resources/images/relief.jpg" class="homeimg"></a>
            <form action="${ contextPath }/account/login" method="POST" onsubmit="validate();">
                <input type="text" name="aid" class="idInput" id="id" placeholder="????????? ??????">
                <br>
                <input type="password" name="pwd" class="pwdInput" id="pwd" placeholder="???????????? ??????">
                <br>
                <button type="submit" class="loginBtn">?????????</button>
            </form>
            <div class="findAccountDiv">
                <a class="findId" href="${ contextPath }/account/findId">????????? ??????</a>
                <a class="findPwd" href="${ contextPath }/account/findPwd">???????????? ??????</a>
            </div>
            <br>
            <a href="${ url }"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"></a>
        </div>
        &nbsp;
        <h3>?????? ????????? ????????????????</h3>
        <button type="button" class="joinBtn" id="join">??????????????????</button>
    </div>
    <script>
        $(function(){
        	$("#join").on("click", function(){
        		location.href = '${ contextPath }/account/join'
        	})
        })
        
        function validate(){
        	if($("#id").val() == ""){
        		alert("???????????? ??????????????????.");
        		return false;
        	}
        	if($("#pwd").val() == ""){
        		alert("??????????????? ??????????????????.");
        		return false;
        	}
        	return true;
        }
    </script>
</body>
</html>