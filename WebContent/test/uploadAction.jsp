<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 String path = application.getRealPath("media");
 
 
        MultipartRequest multi = new MultipartRequest(
		request,
		path,
		1024*1024*2, // 2MB
		"UTF-8",
		new DefaultFileRenamePolicy()	// 동일한 파일명이 들어오면 파일명 뒤에 숫자를 붙임
		); 
 
 String username = multi.getParameter("username");
 String filename = multi.getFilesystemName("userProfile");// 정책에 의해 변경된 이름
 String originFilename = multi.getOriginalFileName("userProfile");
 String contextPath = getServletContext().getContextPath();
 String filepath = "/blog/media/"+filename;
  %>
  path :<%=path%><br/>
  username :<%=username %><br/>
  filename :<%=filename %><br/>
  originFilename : <%=originFilename %><br/>
  contextPath :<%=contextPath %><br/>

  <img src="<%=filepath %>" width ="300px" height="300px"/>
</body>
</html>