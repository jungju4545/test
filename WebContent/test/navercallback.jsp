<%@page import="com.cos.test.OAuthUser"%>
<%@page import="com.google.gson.Gson"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "9alpckNuAIJsq0kJsv4K";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "iWpTXGjyBc";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code"); // 권한증서
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8000/blog/test/navercallback.jsp", "UTF-8"); // 콜백주소
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
        Gson gson = new Gson();
        OAuthUser oauthuser = gson.fromJson(res.toString(), OAuthUser.class);
        
        // DB에 insert하면 된다.
        
        access_token = oauthuser.getAccess_token();
        refresh_token = oauthuser.getRefresh_token();
        String token_type = oauthuser.getToken_type();
        String expire_in = oauthuser.getExpire_in();
        
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  <h1>${sessionScope.access_token}</h1>
  </body>
</html>