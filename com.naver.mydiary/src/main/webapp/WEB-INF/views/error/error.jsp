<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러 페이지</title>
<style>
	#error{
		color : red;
	}
</style>
</head>
<body>
    ${error}
	<h3 id="error">시스템에 장애가 발생했습니다.<br/>
		조치 중이니 잠시 후에 접속해 주시면 감사하겠습니다.</h3>
</body>
</html>