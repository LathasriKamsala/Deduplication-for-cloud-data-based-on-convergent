
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>
	<%@ page import="java.lang.management.ThreadMXBean,java.lang.management.ManagementFactory"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
<title>Upload Data</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
.style2 {font-weight: bold}
.style3 {color: #FFFF00}
.style4 {font-style: italic}
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="DO_Main.jsp">Data Owner </a></li>
			<li><a href="DO_Login.jsp">Logout</a></li>
      </ul>
    </div>
    <div class="clr"></div>
  </div>
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1>A Secure Authorized Deduplication Scheme for Cloud Data Based On Blockchain</h1>
      </div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article style2">
          <h2 class="style1">Uploaded Data .. </h2>
            <p>&nbsp;</p>
          <div class="article">
            <p align="justify" class="style1"> 
			  
			 <%
	String owner = (String) application.getAttribute("doname");
	//String ocl=(String)application.getAttribute("uploadC");
%>
	<% try 
	{
	
		long stime=System.currentTimeMillis();
	
	
		String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
		int i = 0, j = 0, k;
		String file = request.getParameter("t42");
		String cont1 = request.getParameter("text1");
		String cont2 = request.getParameter("text2");
		String cont3 = request.getParameter("text3");
		String cont4 = request.getParameter("text4");
		String fsize =request.getParameter("fsize");
      	
		String mac1 = request.getParameter("t1");
		String mac2 = request.getParameter("t2");
		String mac3 = request.getParameter("t3");
		String mac4 = request.getParameter("t4");
		
		
	
		
					SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					
					Date now = new Date();
					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;
					
					KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
					Cipher encoder = Cipher.getInstance("RSA");
					KeyPair kp = kg.generateKeyPair();
					
					Key pubKey = kp.getPublic();
					
					byte[] pub = pubKey.getEncoded();
					//				System.out.println("PUBLIC KEY" + pub);
					
					String pk = String.valueOf(pub);
					int rank=0;
					Statement st = connection.createStatement();
					
					String user = "Data Owner";
					String task = "Upload";
					String cloud = "cloud";
					
					Statement st21 = connection.createStatement();
					st21.executeUpdate("insert into cloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,sk,dt,fsize,status,rank) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont1+ "','"+ mac1+ "','"+ cont2+ "','"+ mac2+ "','"+ pk+ "','" + dt + "','"+fsize+"','No',"+rank+")");
					
			
					
					
					Statement st211 = connection.createStatement();
					st211.executeUpdate("insert into  fogserver(fname,ownername,cname,ct4,mac4) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont4+ "','"+ mac4+ "')");
					
					
									Statement st2111 = connection.createStatement();
					st2111.executeUpdate("insert into  localmachine(fname,ownername,cname,ct3,mac3) values ('"+ file+ "','"+ owner+ "','"+ cloud+ "','"+ cont3+ "','"+ mac3+ "')");
		
					
					
					
					
					String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+ owner+ "','"+ file+ "','"+ task+ "','" + dt + "','"+fsize+"')";
					connection.createStatement().executeUpdate(strQuery2);
					
					
					
					long etime=System.currentTimeMillis();
					long ttime = etime-stime;
					long tpt=((cont1.length()+cont2.length()+cont3.length()+cont4.length())/ttime)*1024;
					
					Statement st1=connection.createStatement();
				st1.executeUpdate("insert into  results values ('"+file+"','"+ttime+"','"+tpt+"')"); 
			
					
					
					
					%>
					<h2>Block 1 and Block2 Uploaded To Cloud Successfully !!!</h2>
					
					<h2>Block 4 Uploaded To Fog Server Successfully !!!</h2>
					
				    <h2>Block 3 Uploaded To Local Machine Successfully !!!</h2>
				<%
		connection.close();
	}
         
  catch(Exception e)
  {
	out.println(e.getMessage());
  }
%>
						
          </div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <div class="clr"></div>
        </div>
        <div class="gadget">
          <h2 class="star style1"><strong>Data Owner Menu</strong></h2>
          <ul class="sb_menu">
            <li class="style1"><a href="DO_Main.jsp">Home</a></li>
            <li><span class="style1"><a href="DO_Login.jsp">Logout</a></span></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">&nbsp;</h2>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
