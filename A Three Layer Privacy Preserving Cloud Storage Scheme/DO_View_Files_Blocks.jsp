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
<title>View File Blocks</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style23 {color: #666666; font-weight: bold;}
.style29 {
	color: #FF0000;
	font-weight: bold;
}
.style31 {color: #FFFF00; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
			<li class="active"><a href="C_Login.jsp">DatA Owner </a></li>
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
          <h2 class="style29">View Local Machine File's Block Name !!!</h2>
          <p>&nbsp;</p>
          <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13,s14;
	int i=0,j=0,k=0;
try 
	{		
		
	
					
											
    						String quey1="select * from localmachine "; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(quey1);
							while( rs1.next())
							{
								j=rs1.getInt(1);
								s1=rs1.getString(2); //fname
								s2=rs1.getString(3); //oname
								s3=rs1.getString(6); // c1
								
								
							
							%>
          <table width="586" border="1" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
            <tr>
              <th width="176" height="30" bgcolor="#FF0000" scope="row"><span class="style31">Id : </span></th>
              <td width="404" bgcolor="#FFFFFF"><div align="center" class="style29">
                <h4 class="style34 style24">&nbsp;</h4>
                <strong><%=j%></strong></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style31">File Name : </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style29"><%=s1%></div></td>
            </tr>
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style31">Block3(Hash-Solomon code): </span></th>
              <td bgcolor="#FFFFFF"><div align="center" class="style29"><%=s3%></div></td>
            </tr>
            
            <tr>
              <th height="30" bgcolor="#FF0000" scope="row"><span class="style31">Detailed View : </span></th>
              <td><div align="center" class="style23"><a href="DO_View_Files_Details.jsp?usid=<%=j%>">
                <input name="Input" type="button" value="View" />
              </a></div></td>
            </tr>
          </table>
          <p>
            <%
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          <p>&nbsp;</p>
          <p align="right"><a href="DO_Main.jsp">Back</a></p>
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
