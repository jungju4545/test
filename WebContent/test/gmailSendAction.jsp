<%@page import="com.cos.utill.Gmail"%>
<%@page import="com.cos.utill.SHA256"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    // 메일을 전송하자
    String to = request.getParameter("email"); //1. 이메일 받음
    String from = "s01097537272@gamil.com";
    String code = SHA256.getEncypt(to, "cos"); //2. 해쉬
    
    // 3. 사용자에게 메세지 보내기
    String subject = "JJ블로그 회원가입을 위한 이메일 인증 메일입니다.";
    StringBuffer sb = new StringBuffer();
    sb.append("다음 링크에 접속하여 이메일 인증을 해주세요");
    sb.append("<a href='http://localhost:8000/blog/test/gmailcheckaction.jsp?code="+code+"'>");
    sb.append("이메일 인증</a>");
    String content = sb.toString();
    
    //설정값
   
    Properties p = new Properties();
	p.put("mail.smtp.user", from); //4. from
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465"); //TLS 587, SSL 465
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465"); 
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.sockerFactory.fallback", "false");

	// email 전송
	try {
			Authenticator auth = new Gmail(); // 5. 내가 설정한 아이디 비번 넘겨주기
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html; charset=UTF8");
			Transport.send(msg);
			
		} catch (Exception e) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일 인증 오류')");
			script.println("history.back();");
			script.println("</script>");
		}



    // 정상일때 가만히 있음, 비정상일 때 = 히스토리 백
    		
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>이메일 주소 인증 메일이 전송되었습니다. 이메일에 가서 인증해주세요</h1>
</body>
</html>