<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Request_Permission</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
.style2 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="menu_nav">
    <div class="menu_nav_resize">
      <ul>
            <li class="active"><a href="EU_Login.jsp">End User </a></li>
			<li><a href="EU_Login.jsp">Logout</a></li>
        <li></li>
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
          <h2><span>Download Request Permission</span></h2>
            <h2></h2>
            <p></p>
            <h2>Request Download Permission  </h2>
            <p class="infopost">&nbsp;</p>
            <p>
              <%
			  
			  try 
			  {

				String owner = request.getParameter("t142");
				String fname = request.getParameter("t14");
				String uname=(String)application.getAttribute("uname");
				
				SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
				SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
				
				Date now = new Date();
				
				String strDate = sdfDate.format(now);
				String strTime = sdfTime.format(now);
				String dt = strDate + "   " + strTime;

				String query1="select * from request where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"' "; 
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(query1);
				if ( rs1.next())
				{
					String download_per=rs1.getString(5);
					if(download_per.equalsIgnoreCase("Requested"))
					{
						%>
						</p>
						<p class="style27">Request Already Sent To Cloud !! </p>
						<p><a href="EU_Main.jsp" class="style28">Back</a></p>
						<p>
						<%	
					}
					else if(download_per.equalsIgnoreCase("Permitted"))
					{
						%>
						</p>
						<p class="style27">Request Already Sent To Cloud !! </p>
						<p><a href="EU_Main.jsp" class="style28">Back</a></p>
						<p>
						<%	
					}else{}
				}
				else
				{
					
					String query2="select * from cloudserver  where fname='"+fname+"' and ownername='"+owner+"'"; 
					Statement st2=connection.createStatement();
					ResultSet rs2=st2.executeQuery(query2);
					if ( rs2.next())
					{
						String query4="select * from request where user='"+uname+"' and  fname='"+fname+"' and owner='"+owner+"'";
						ResultSet rs4 = connection.createStatement().executeQuery(query4);
						if(rs4.next())
						{
							String query5="update request set download_per='Requested' where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"'";
							connection.createStatement().executeUpdate(query5);
							%>
							</p>
							<p class="style27">Request Sent To Cloud !! </p>
							<p><a href="EU_Main.jsp" class="style28">Back</a></p>
							<p>
							<%
						}
						else
						{
							String query3="insert into request(user,owner,fname,download_per) values('"+uname+"','"+owner+"','"+fname+"','Requested')";
							connection.createStatement().executeUpdate(query3);
							%>
							</p>
							<p class="style27">Request Sent To Cloud !! </p>
							<p><a href="EU_Main.jsp" class="style28">Back</a></p>
							<p>
							<%
						}
					}
					else
					{
						%>
						</p>
						<p class="style27">File Doesn't Exist !! </p>
						<p><a href="EU_Main.jsp" class="style28">Back</a></p>
						<p>
						<%
					}
				   	
				}
			connection.close();
	}
	catch (Exception e)
	{
		out.print(e);
	}
		
  %>
              <p>&nbsp;</p>
             
            <p></p>
          <div class="article"></div>
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
          <h2 class="star style1"><strong>End User Menu</strong></h2>
          <ul class="sb_menu">
			<li><strong><a href="EU_Main.jsp">Home</a></strong></li>
            <li><strong><a href="EU_Login.jsp">Logout</a></strong></li>
          </ul>
        </div>
        <div class="gadget"></div>
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
