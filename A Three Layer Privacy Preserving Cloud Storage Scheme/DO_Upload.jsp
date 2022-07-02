
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
          <h2 class="style1">Upload Data.. </h2>
            <p>&nbsp;</p>
          <div class="article">
            <p align="justify"> 
			  
			  <%
			  
			  String cloud="Cloud";
			  
			  %>
	
					<form id="form1" name="form1" method="post" action="DO_Upload1.jsp">
						<table width="598" border="0" align="left">
						<tr><input type="hidden" name="start" value="<%=cloud%>" />
						<td width="286" height="35" bgcolor="#FFFF00"><span class="style1 style20 style4">Select File :- </span></td>
						<td width="356"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
						</tr>
						<tr>
						<td height="35" bgcolor="#FFFF00" class="style1 style20 style4">File Name :- </td>
						<td><input required="required" name="tt" type="text" id="t42" size="50"/></td>
						</tr>
						<tr>
						<td height="255">&nbsp;</td>
						<td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
						</tr>
						<tr>
						<td><div align="right"></div></td>
						<td><input type="submit" name="Submit" value="Encrypt" /></td>
						</tr>
						</table>
						</form>
						
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
