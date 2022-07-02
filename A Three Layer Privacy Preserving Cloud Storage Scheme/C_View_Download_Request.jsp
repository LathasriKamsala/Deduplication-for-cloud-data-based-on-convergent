<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style29 {color: #FF0000}
.style30 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
			<li class="active"><a href="C_Login.jsp">Cloud</a></li>
            <li><a href="C_Login.jsp">Logout </a></li>
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
        <div class="article">
          <h2 class="style29">Authorize Download Request... </h2>
          <p>&nbsp;</p>
            <table width="631" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="left">
              <tr>
                <td width="71" height="30" bgcolor="#FFFF00"><div align="center" class="style29 style26 style21"><strong> ID </strong></div></td>
                <td width="112" bgcolor="#FFFF00"><div align="center" class="style29 style27"><strong>User Name </strong></div></td>
                <td width="112" bgcolor="#FFFF00"><div align="center" class="style29 style27"><strong>Data Owner </strong></div></td>
                <td width="121" bgcolor="#FFFF00"><div align="center" class="style29 style27"><strong><span class="style28">File Name </span></strong></div></td>
                <td width="169" bgcolor="#FFFF00"><div align="center" class="style29 style27"><strong>Permission</strong></div></td>
                <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
      		String query="select * from request "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		
		%>
              </tr>
              <tr>
                <td height="28"><div align="center" class="style30"><%=i%></div></td>
                <td><div align="center" class="style30"><%=s2%></div></td>
                <td><div align="center" class="style30"><%=s3%></div></td>
                <td><div align="center" class="style30"><%=s4%></div></td>
                <%	
			if(s5.equalsIgnoreCase("Requested"))
			{
			
		%>
                <td><div class="style30">
                    <div align="center"><a href="C_View_Download_Request1.jsp?usid=<%=i%>"><%=s5%></a></div>
                </div></td>
                <%
		
			}
			else if(s5.equalsIgnoreCase("No"))
			{
			
		%>
                <td><div class="style30">
                    <div align="center">Not Requested</div>
                </div></td>
                <%
		
			}
			else
			{
		%>
                <td width="17"><div class="style30">
                    <div align="center"><%=s5%></div>
                </div></td>
              </tr>
              <%
			  }
	  }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
            </table>
          <p>&nbsp;</p>
          <p align="right">&nbsp;</p>
          <p align="right">&nbsp;</p>
          <p align="right"><a href="C_Main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <input name="button_search" src="images/search_btn.gif" class="button_search" type="image" />
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search" type="text" />
            </span>
          </form>
          <div class="clr"></div>
        </div>
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
            <li><a href="C_Main.jsp">Home</a></li>
            <li><a href="C_Login.jsp">Logout</a></li>
          </ul>
        </div>
        <div class="gadget">
          <ul class="ex_menu"><li></li>
          </ul>
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
