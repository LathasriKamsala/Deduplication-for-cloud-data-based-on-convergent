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
.style3 {font-size: 24px}
-->
</style>


<script type='text/javascript'>

function saveTextAsFile()
{
	var textToWrite = document.getElementById("textarea").value;
	var textFileAsBlob = new Blob([textToWrite], {type:'text/plain'});
	var fileNameToSaveAs = "File.txt";

	var downloadLink = document.createElement("a");
	downloadLink.download = fileNameToSaveAs;
	downloadLink.innerHTML = "Download File";
	if (window.webkitURL != null)
	{
		// Chrome allows the link to be clicked
		// without actually adding it to the DOM.
		downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
	}
	else
	{
		// Firefox requires the link to be added to the DOM
		// before it can be clicked.
		downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
		downloadLink.onclick = destroyClickedElement;
		downloadLink.style.display = "none";
		document.body.appendChild(downloadLink);
	}

	downloadLink.click();
}

function destroyClickedElement(event)
{
	document.body.removeChild(event.target);
}



</script>
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
		String owner = request.getParameter("oname");
		String mac1 = request.getParameter("t12");
		String mac2 = request.getParameter("t122");
		String mac3 = request.getParameter("t123");
		String mac4 = request.getParameter("t124");
		String sk = request.getParameter("t13");
		
		application.setAttribute("file2", file);
		application.setAttribute("sk2", sk);
		
		
		String ct13=null;
		String ct14=null;
		
		String keys = "ef50a0ef2c3e3a5f";
		
		String strQuer = "select * from cloudserver where fname='"+file+"' ";
		ResultSet r = connection.createStatement().executeQuery(strQuer);
		if(r.next()==true)
		{
			String maac1="Shared";
			
			if(maac1.equalsIgnoreCase("Shared"))
			{
			
				String ct1=r.getString(5);
				
				byte[] keyValue = keys.getBytes();
				Key key = new SecretKeySpec(keyValue, "AES");
				Cipher c = Cipher.getInstance("AES");
				c.init(Cipher.DECRYPT_MODE, key);
				String fn = new String(Base64.decode(ct1.getBytes()));
				
				
				
				String strQuery1 = "select * from cloudserver where fname='"+ file+ "' and  mac1='"+ mac1+ "' and  mac2='"+ mac2+ "'  and  sk='"+ sk+ "'";
				
				String strQuery12 = "select * from cloudserver where fname='"+ file+ "' ";
				
				ResultSet rs12 = connection.createStatement().executeQuery(strQuery12);
				ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
				if(rs12.next())
				{
					if(rs1.next())
					{
						String ct11 = rs1.getString(5);
						String ct12 = rs1.getString(7);
						int rank=rs1.getInt(13);
						int rank1=rank+1;
						
						String strQuery11u = "update cloudserver set rank="+rank1+"  where fname='"+file+"' ";
						 connection.createStatement().executeUpdate(strQuery11u);
						
						
						
						
						String strQuery11 = "select * from fogserver where fname='"+ file+ "' and   mac4='"+ mac4+ "' ";
						ResultSet rs11 = connection.createStatement().executeQuery(strQuery11);
						
						if(rs11.next())
					{
						ct14 = rs11.getString(5);
						}
						
						
						
						String strQuery111 = "select * from localmachine where fname='"+ file+ "' and   mac3='"+ mac3+ "' ";
						ResultSet rs111 = connection.createStatement().executeQuery(strQuery111);
						
						if(rs111.next())
					{
						ct13 = rs111.getString(5);
						}
						
						
						byte[] keyValue1 = keys.getBytes();
						Key key1 = new SecretKeySpec(keyValue1, "AES");
						Cipher c1 = Cipher.getInstance("AES");
						c1.init(Cipher.DECRYPT_MODE, key1);
						String decryptedValue11 = new String(Base64.decode(ct11.getBytes()));
						String decryptedValue22 = new String(Base64.decode(ct12.getBytes()));
						String decryptedValue33 = new String(Base64.decode(ct13.getBytes()));
						String decryptedValue44 = new String(Base64.decode(ct14.getBytes()));
						
						%>
						</p>
						</p>
						<p align="center" class="style1 style23 style3">File Contents!!!</p>
						<h3 class="style1 style24"><em>Block1 and Block2 Downloaded from CLOUD SERVER !!!</em></h3>
						<h3 class="style1 style24"><em>Block4  Downloaded from FOG SERVER !!!</em></h3>
						<h3 class="style1 style24"><em>Block3 Downloaded from LOCAL MACHINE !!!</em></h3>
						<p class="style1 style24">&nbsp;</p>
						<label>
						<div align="center">
						<textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue11%><%=decryptedValue22%><%=decryptedValue33%><%=decryptedValue44%></textarea>
						<br/>
						<br/>
						<td><button onclick="saveTextAsFile()">Download</button></td>
						</div>
						</label>
						<p align="center">&nbsp; </p>
						<p>
						<%
					} 
					else 
					{
						SimpleDateFormat sdfDate = new SimpleDateFormat(
						"dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat(
						"HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						String user = (String) application.getAttribute("uname");
						String strQuery2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+ user+ "','"+ file+ "','"+ sk+ "','"+ dt+ "','Hash Solomon code/Sk Mismatch')";
						connection.createStatement().executeUpdate(strQuery2);
						%>
						</p>
						<h3 class="style24">Trapdoor / Secret Key Mismatch !!!</h3>
						</p>
						<br />
						<%
					}
				}
				else 
				{
					%>
					<h3 class="style24">File Doesn't Exist !!!</h3>
					</p>
					<br />
					<%
				}
			}
			else
			{
		
				String strQuery = "select * from cloudserver where fname='"+ file+ "' and ownername='"+ owner+ "' and  mac1='"+ mac1+ "' and  mac2='"+ mac2+ "' and  mac3='"+ mac3+ "' and  mac4='"+ mac4+ "' and  sk='" + sk + "'";
				
				String strQuery1 = "select * from cloudserver where fname='"+ file+ "' ";
				
				ResultSet rs1 = connection.createStatement().executeQuery(strQuery1);
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				if(rs1.next())
				{
					if(rs.next())
					{
						String ct1 = rs.getString(5);
						String ct2 = rs.getString(7);
						String ct3 = rs.getString(9);
						String ct4 = rs.getString(11);
						
						
						byte[] keyValue1 = keys.getBytes();
						Key key1 = new SecretKeySpec(keyValue1, "AES");
						Cipher c1 = Cipher.getInstance("AES");
						c1.init(Cipher.DECRYPT_MODE, key1);
						String decryptedValue1 = new String(Base64.decode(ct1.getBytes()));
						String decryptedValue2 = new String(Base64.decode(ct2.getBytes()));
						String decryptedValue3 = new String(Base64.decode(ct3.getBytes()));
						String decryptedValue4 = new String(Base64.decode(ct4.getBytes()));
						%>
						</p>
						</p>
						<p align="center" class="style1 style23">File Contents</p>
						<label>
						<div align="center">
						<textarea name="text" id="textarea" cols="45" rows="17"><%=decryptedValue1%><%=decryptedValue2%><%=decryptedValue3%><%=decryptedValue4%></textarea>
						<br/>
						<br/>
						<td><button onclick="saveTextAsFile()">Download</button></td>
						</div>
						</label>
						<p align="center">&nbsp; </p>
						<p>
						<%
					} 
					else 
					{
						SimpleDateFormat sdfDate = new SimpleDateFormat(
						"dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat(
						"HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						String user = (String) application.getAttribute("uname");
						String strQuery2 = "insert into attacker(user,fname,sk,dt,attacktype) values('"+ user+ "','"+ file+ "','"+ sk+ "','"+ dt+ "','Trapdoor/Sk Mismatch')";
						connection.createStatement().executeUpdate(strQuery2);
						%>
						</p>
						<h3 class="style24">Trapdoor / Secret Key Mismatch !!!</h3>
						</p>
						<br />
						<%
					}
				}
				else 
				{
					%>
					<h3 class="style24">File Doesn't Exist !!!</h3>
					</p>
					<br />
					<%
				}
			
			}
		}	
		connection.close();
	} 
	catch (Exception e)
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
