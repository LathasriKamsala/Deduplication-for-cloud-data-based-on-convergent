<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Download File</title>
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
        <div class="article style2">
          <h2 class="style1">Download File !!! </h2>
            <h2></h2>
            <p></p>
               <%
		  
	try 
	{
		String file = request.getParameter("t1");
		String un=(String)application.getAttribute("uname");
		
		
		
		String query1 = "select * from request  where user='"+un+"' and fname='" + file+ "' ";
		Statement st1 = connection.createStatement();
		ResultSet rs1 = st1.executeQuery(query1);
		if (rs1.next()) 
		{
			String per=rs1.getString(5);
			if(per.equalsIgnoreCase("Requested"))
			{
				%>
				<h3 class="style24">Wait For Cloud To Grant Download Permission !!!</h3>
				<%
			}
			if(per.equalsIgnoreCase("Permitted"))
			{
				String mac1="";
				String mac2="";
				String mac3="";
					String mac33="";
				String mac4="";
				String mac44="";
				String sk="";
				
					
						String strQuery1 = "select * from cloudserver where fname='"+file+"' ";
						ResultSet rs2 = connection.createStatement().executeQuery(strQuery1);
						if(rs2.next()==true)
						{
							String oname1=rs2.getString(3);
							String mac11=rs2.getString(6);
							String  mac22=rs2.getString(8);
							
							String  sk1=rs2.getString(9);
							String Siz1=rs2.getString(10);
							
							
						String strQuery11 = "select * from fogserver where fname='"+file+"' ";
						ResultSet rs21 = connection.createStatement().executeQuery(strQuery11);
						if(rs21.next()==true)
						{
						 mac4=rs21.getString(6);
						}
						
						String strQuery111 = "select * from localmachine where fname='"+file+"' ";
						ResultSet rs211 = connection.createStatement().executeQuery(strQuery111);
						if(rs211.next()==true)
						{
						 mac3=rs211.getString(6);
						}
							       
							
							
							
							SimpleDateFormat sdfDate = new SimpleDateFormat(
							"dd/MM/yyyy");
							SimpleDateFormat sdfTime = new SimpleDateFormat(
							"HH:mm:ss");
							
							Date now = new Date();
							
							String strDate = sdfDate.format(now);
							String strTime = sdfTime.format(now);
							String dt = strDate + "   " + strTime;	
							String task="Download";
							String user=(String) application.getAttribute("uname");
							String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+user+"','"+file+"','"+task+"','"+dt+"','"+Siz1+"')";
							connection.createStatement().executeUpdate(strQuery2);
							String strQuery21 = "insert into transaction(user,fname,task,dt,fsize) values('"+oname1+"','"+file+"','"+task+"','"+dt+"','"+Siz1+"')";
							connection.createStatement().executeUpdate(strQuery21);
							
							%>
							<form action="EU_Download2.jsp" method="post" name="form1" id="form1">
							<table width="478" border="0" align="center">
							<tr>
							<td width="223"><span class="style23 style1"><strong>Enter File Name :</strong></span></td>
							<td width="245"><label>
							<input required="required" name="t1"
							type="text"  size="40" value="<%=file%>"/>
							</label></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>Enter Owner Name :</strong></span></td>
							<td><input name="oname" type="text" size="40" value="<%=oname1%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>Hash Solomon code 1 :</strong></span></td>
							<td><input name="t12" type="text" size="40" value="<%=mac11%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>Hash Solomon code 2 :</strong></span></td>
							<td><input name="t122" type="text" size="40" value="<%=mac22%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>Hash Solomon code 3 :</strong></span></td>
							<td><input name="t123" type="text" size="40" value="<%=mac3%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>Hash Solomon code 4 :</strong></span></td>
							<td><input name="t124" type="text" size="40"value="<%=mac4%>" /></td>
							</tr>
							<tr>
							<td><span class="style23 style1"><strong>Secret Key :</strong></span></td>
							<td><input name="t13" type="text" size="40" value="<%=sk1%>" /></td>
							</tr>
							<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							</tr>
							<tr>
							<td><div align="right">
							<input type="submit" name="Submit"
							value="Download" />
							</div></td>
							</tr>
							</table>
							</form>
							<%	
						}
						else
						{
						%>
						<h3 class="style24">You Have Not Requested For Download Permission<br /> <a href="U_Download_Req.jsp">Click Here</a> To Request !!!</h3>
						<%
							}
				%>
						
						</div></td>
						</tr>
						</table>
						</form>
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
