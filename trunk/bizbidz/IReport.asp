<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<%
	if session("AdminUid") = "" then
		Response.Redirect "Adminlogin.asp"
	end if
	Dim Rs,rs1
	Dim icount,valofposts,fdeals,commission
	set Rs=Server.CreateObject("ADODB.Recordset")
%>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Income Report</title>
</head>
<body>
<p align="center">&nbsp;
<p align="center"><b><font color="#ff00ff" size="2" face="Tahoma"> <font size="2" face="Tahoma">&nbsp;</font></font><font size="2" face="Tahoma"><A href="BReport.asp"><font color="#000000">Buyers 
  Report</font></A><font color="#ff00ff" size="2" face="Tahoma"> | </font></font><font size="2" face="Tahoma"> 
  <A href="Sreport.asp"><font color="#000000">Sellers Report</font></A></font><font color="#ff00ff" size="2" face="Tahoma"> 
  | </font><font size="2" face="Tahoma"> <a href="IReport.asp"><font color="#000000">Income 
  Report</font></a></font><font color="#ff00ff" size="2" face="Tahoma"> | </font><A href="adminlogout.asp"> 
  <font color="#000000" size="2" face="Tahoma">Logout</font></A></b>
<p align="center">&nbsp;<p align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
&nbsp;
<b>
<p align="center">&nbsp;<table border="1" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr>
    <td width="100%" bgcolor="#33cccc"><font color="#ff0000" size="5"> 
    Income&nbsp;Report</font></td>
  </tr>
</table>
<table border="1" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
  <tr>
    <TD width="17%" bgColor=#0000ff>
      <P align=center><FONT color=#ffffff>Month</FONT></P></TD> 
    <td width="17%" bgcolor="#0000ff">
    <p align="center"><font color="#ffffff">No of Posts</font></p></td>
    <td width="20%" bgcolor="#0000ff"><font color="#ffffff">Value of Posting</font></td>
    <td width="18%" bgcolor="#0000ff"><font color="#ffffff">Featured Deals</font></td>
    <td width="30%" bgcolor="#0000ff"><font color="#ffffff">Commission</font></td>
  </tr>
<%
	Str="SELECT month(SDT),Count(*),Sum(cbid) FROM items WHERE (DateDiff('y',Date(),[sdt])) <= 1  group by month(SDT)"
	Set rs1=Server.CreateObject("Adodb.Recordset")
	rs1.Open str,con
	do while not rs1.EOF
		rs.Open "Select count(*) from items where featuredeals=1 and month(SDT)=" & rs1.Fields(0) ,con
		icount=rs1.Fields(1)
		valofposts=rs1.Fields(2)
		if not rs.EOF then
			fdeals=rs.Fields(0)
			rs.Close
		end if
		commission=(rs1.Fields(2) * 3)/100
		mnth=monthname(rs1.Fields(0))
			
%>
  <tr>
    <TD width="17%"><%=mnth %>&nbsp;</TD>
    <td width="17%"><%=icount %>&nbsp;</td>
    <td width="20%"><%=valofposts %>&nbsp;</td>
    <td width="18%"><%=fdeals %>&nbsp;</td>
    <td width="30%"><%=commission%>&nbsp;</td>
  </tr>
	<% rs1.MoveNext %>
	<% loop %>
<%
	Str="SELECT Count(*),Sum(cbid) FROM items WHERE (DateDiff('y',Date(),[sdt])) <= 1 "
	Set rs1=Server.CreateObject("Adodb.Recordset")
	rs1.Open str,con
	do while not rs1.EOF
		rs.Open "Select count(*) from items where featuredeals=1" ,con
		icount=rs1.Fields(0)
		valofposts=rs1.Fields(1)
		if not rs.EOF then
			fdeals=rs.Fields(0)
			rs.Close
		end if
		commission=(rs1.Fields(1) * 3)/100
%>
  <tr>
	<TD width="17%">Total&nbsp;</TD>
    <td width="17%"><%=icount %>&nbsp;</td>
    <td width="20%"><%=valofposts %>&nbsp;</td>
    <td width="18%"><%=fdeals %>&nbsp;</td>
    <td width="30%"><%=commission%>&nbsp;</td>
  </tr>
<% rs1.MoveNext %>
<% loop %>
</table></p>
</body>
</html>