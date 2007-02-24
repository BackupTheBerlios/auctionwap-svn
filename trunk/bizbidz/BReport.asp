<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<%
	if session("AdminUid") = "" then
		Response.Redirect "Adminlogin.asp"
	end if
	Dim Rs
	Dim Uname, Bhist,name,add, cno
	set Rs=Server.CreateObject("ADODB.Recordset")
%>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Buyers Report</title>
</head>
<body>
<p align="center">
<p align="center"><b><font color="#ff00ff" size="2" face="Tahoma"> <font size="2" face="Tahoma">&nbsp;</font></font><font size="2" face="Tahoma"><A href="BReport.asp"><font color="#000000">Buyers 
  Report</font></A><font color="#ff00ff" size="2" face="Tahoma"> | </font></font><font size="2" face="Tahoma"> 
  <A href="SReport.asp"><font color="#000000">Sellers Report</font></A></font><font color="#ff00ff" size="2" face="Tahoma"> 
  | </font><font size="2" face="Tahoma"> <A href="IReport.asp"><font color="#000000">Income 
  Report</font></A></font><font color="#ff00ff" size="2" face="Tahoma"> | </font><A href="adminLogout.asp"> 
  <font color="#000000" size="2" face="Tahoma">Logout</font></A></b> 
  <form name="breport" action="BReport.asp" method="Get">
<P align=center>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=* name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=A name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=B name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=C name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=D name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=E name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=F name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=G name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=H name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=I name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=J name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=K name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=L name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=M name=button9></P>
<P align=center>
<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=N name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=O name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=P name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=Q name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=R name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=S name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=T name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=U name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=V name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=W name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=X name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=Y name=button9>&nbsp;<INPUT id=button9 style="WIDTH: 24px; HEIGHT: 24px" type=submit size=8 value=Z name=button9>&nbsp;</P>
</form>
<P align=center><table border="1" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr>
    <td width="100%" bgcolor="#33cccc"><font color="#ff0000" size="5">Buyers 
    Report</font></td>
  </tr>
</table></P>
<P align=center>
<table border="1" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
  <tr>
    <td width="20%" bgcolor="#0000ff">
    <p align="center"><font color="#ffffff">User Name</font></p></td>
    <td width="18%" bgcolor="#0000ff"><font color="#ffffff">Bidding History</font></td>
    <td width="22%" bgcolor="#0000ff"><font color="#ffffff">Business Name</font></td>
    <td width="25%" bgcolor="#0000ff"><font color="#ffffff">Address</font></td>
    <td width="15%" bgcolor="#0000ff"><font color="#ffffff">Contact Number</font></td>
  </tr>
<%
	dim bt,St
	bt=Request.QueryString("button9")
	if bt="*" or bt="" then
		st="Select * from Users"
	else
		st="Select * from Users where ucase(left(userid,1))='" & bt & "'"
	end if
	Rs.Open st,con
	Do while not Rs.EOF
		Dim rs1
		Set rs1=Server.CreateObject("Adodb.Recordset")
		rs1.Open "Select Count(*) from bids where userid='" & Rs.Fields(0) & "'",Con
		IF rs1.Fields(0) > 0 and ucase(rs.Fields(0)) <> "ADMIN" then
			uname=rs.Fields(0)
			icount=rs1.Fields(0)
			name=rs.Fields(3) & "  " & rs.Fields(4)
			add=rs.Fields(10) & " " & rs.Fields(11) & " " & rs.Fields(12) & " " & rs.Fields(13)
			cno=rs.Fields(7)
		
%>
  <tr>
    <td width="20%"><%=uname %>&nbsp;</td>
    <td width="18%"><%=bhis %>&nbsp;</td>
    <td width="22%"><%=name %>&nbsp;</td>
    <td width="25%"><%=add %>&nbsp;</td>
    <td width="15%"><%=cno %>&nbsp;</td>
  </tr>
  <% end if %>
  <% rs.MoveNext %>
  <% loop %>
</table></P>
</body>
</html>