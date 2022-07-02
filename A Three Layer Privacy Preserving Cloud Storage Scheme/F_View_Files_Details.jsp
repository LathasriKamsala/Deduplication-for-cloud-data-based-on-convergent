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
.style30 {color: #FFFF00}
.style31 {color: #FF0000}
.style32 {color: #0000FF}
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
			<li class="active"><a href="C_Login.jsp">Fog server </a></li>
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
          <h2 class="style29">View Fog Server File's Block Details !!!</h2>
          <p>&nbsp;</p>
                 <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="",s15="";
	int i=0,j=0,k=0;
int id = Integer.parseInt(request.getParameter("usid"));
			try 
				{
      		
					
								
							String quey1="select * from fogserver  where id="+id+" "; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(quey1);
							if ( rs1.next())
							{
								j=rs1.getInt(1);
								String fnn=rs1.getString(2);
								String own=rs1.getString(3);
								String b1=rs1.getString(5);
								String m1=rs1.getString(6);
								
								%>
</p>
          <p class="infopost">&nbsp;</p>
          <h4 class="style26 style31" >File Shared From <span class="style32"><%=own%> </span>With File : <span class="style32">&quot; <%=fnn%>&quot;</span></h4>
          <table width="560" border="0" align="center">
            <tr>
              <td width="143" height="35" bgcolor="#FF0000"><div align="center" class="style30"><span class="style4 style22"><strong><strong>File Name :- </strong></strong></span></div></td>
              <td width="407"><div align="justify"><span class="style25"><%= fnn %></span></div></td>
            </tr>
            <tr>
              <td height="133" bgcolor="#FF0000"><div align="center" class="style30"><span class="style4 style22"><strong><strong>Block-4</strong></strong></span></div></td>
              <td><div align="justify"><span class="style23">
                <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= b1 %></textarea>
              </span> </div></td>
            </tr>
            <tr>
              <td height="30" bgcolor="#FF0000"><div align="center" class="style30"><span class="style4 style22"><strong><strong>Hash-Solomon code-4: </strong></strong></span></div></td>
              <td>
                
                <div align="justify">
                  <input name="t1" type="text" id="t4"
								value="<%= m1 %>" size="50" readonly="readonly" />
              </div></td>
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
          
          <p align="right"><a href="F_Main.jsp">Back</a></p>
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
