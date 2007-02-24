<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT language="JavaScript" src="includes/validations.js"></SCRIPT>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit ()  {
    var org=document.bid;
	if (!testEMPTY(org, org.bidval)) 
	{
		validatePrompt(org.bidval,"Please Enter your bid amount");
		return false;
	}
	if(isNaN (org.bidval.value) == 1)
	{
		alert("Invalid Amount");
		org.bidval.focus();
		return false;
	}
    org.submit();
    return;
}
//-->
</SCRIPT>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>BizBidz system</title>
</head>

<%
	dim pde
	if Request.QueryString("PRODESC")="" then
		pde=Cint(Session("pde"))
	else
		pde=Cint(Request.QueryString("PRODESC"))
		Session("pde")=Request.QueryString("PRODESC")
		session("itemid")=Request.QueryString("PRODESC")
	end if
		Dim rs,rs1
		set rs=Server.CreateObject("ADODB.Recordset")
		set rs1=Server.CreateObject("ADODB.Recordset")
		rs.Open "Select * from categories", Con
		rs1.Open "Select * from items where itemid=" & pde ,Con
		piclocation="uploads/" & rs1.fields(10)
		Dim rsTemp
		set rsTemp=Server.CreateObject("ADODB.Recordset")
		rsTemp.Open "select email from users where userid='" & rs1.Fields(1) & "'", Con
       	dim sql
	  	sql="Select * from Categories where CategoryID=" & rs1.fields(2)
      	Dim rsCat
      	set rsCat=Server.createObject("Adodb.Recordset")
      	rsCat.open Sql, Con
                      	

		
%>
<body bgcolor="#ffffff" topmargin="0" leftmargin="0">
<CENTER>
<TABLE id=AutoNumber1 
style="WIDTH: 791px; BORDER-COLLAPSE: collapse; HEIGHT: 589px" 
borderColor=#ffffff cellSpacing=0 cellPadding=0 border=0>
  <TR>
    <TD width=756 height=384> 
      <TABLE id=AutoNumber2 style="BORDER-COLLAPSE: collapse" 
      borderColor=#111111 height=186 cellSpacing=0 cellPadding=0 width="103%" 
      border=0>        
        <TR>
          <TD vAlign=top width="95%" bgColor=#6f57a4 height=391>
            <TABLE id=AutoNumber3 style="WIDTH: 776px; 
            BORDER-COLLAPSE: collapse; HEIGHT: 472px" 
            borderColor=#473275 cellSpacing=0 cellPadding=0 width="776" border=2 
           >
              <TBODY>
              <TR>
                <TD vAlign=top width="100%" bgColor=#000066 colSpan=2 
                  height=21>
				<img border="0" src="images/home.jpg" width="780" height="180"></TD></TR>
              <TR>
                <TD vAlign=top width="100%" bgColor=#FFFFFF colSpan=2 
                  height=19><P style="TEXT-INDENT: 1px" align=center><B><FONT 
                  face=Tahoma color=#ff00ff size=2><A href="index.asp">Home</A> | <A href="About.htm">About Us</A> | <A 
                  href="registration.asp">Registration</A> | <A 
                  href="products.asp">Items List</A> 
                | <A href="Itempost.asp">Post Item</A> 
                | <A href="myacc.asp">My Account</A> 
                | <A href="forum.htm">Forum</A> |</FONT><FONT 
                  face=Tahoma size=2> </FONT><FONT 
                  face=Tahoma color=#ff00ff size=2> <A href="help.htm">Help</A> | <A href="feedback.htm">Feedback</A></FONT></B></P></TD></TR>
              <TR>
                <TD vAlign=top width="100%" bgColor=#8A87FC colSpan=2 
                  height=4><FONT face=Tahoma><B>
                  <FORM name=search action=products.asp>
                  <P align=left><FONT color=#473275 
                  size=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  Search : </FONT><FONT color=#473275><INPUT name=T1 > <INPUT style="WIDTH: 40px" type=submit value=Go name=B1 width="40">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  &nbsp;</FONT><FONT face=Tahoma size=2><% if session("uid")= "" then %><A href="Login.asp">Login</A>
                  <%else %>
                  <A href="Logout.asp">Logout</A>
                  <%end if%>
                  </FONT></P></B></FONT></FORM></TD></TR>
              <TR>
                <TD vAlign=top width="22%" bgColor=#ffcc00 height=384>
                  <TABLE id=AutoNumber6 style="BORDER-COLLAPSE: collapse" 
                  borderColor=#111111 height=65 cellSpacing=0 cellPadding=0 
                  width="100%" border=0>
                    
                    <TR>
                      <TD borderColor=#6f57a4 align=middle width="100%" 
                      bgColor=#000066 height=26><B><FONT face=Tahoma 
                        color=#ffffff size=2>B2B Categories</FONT></B></TD></TR>
                    <TR>
				<% do while not rs.eof %>
                          <TD width="100%" height=39><B><U><A 
                        href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </A></U></B>&nbsp;</TD></TR>
			  <%rs.movenext%>
  			   <%loop%>
              </TABLE></TD>
                <TD vAlign=top width="78%" bgColor=#ffffff height=382>&nbsp;<% if Request.QueryString("inv")="1" then %> <P align=center><FONT style="BACKGROUND-COLOR: white" 
                  color=red>Invalid Bid amount Try again</FONT></P> <%end if %>
              <FORM name=bid action=Bid.asp method=get>
                  <TABLE id=AutoNumber7 style="WIDTH: 594px; 
                  BORDER-COLLAPSE: collapse; HEIGHT: 246px" 
                  borderColor=#111111 height=246 cellPadding=0 bgColor=#99ccff border=0>
                    
                    <TR>
                      <TD width="2%" height=25 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="46%" height=25>
                        <P align=right><font face="Arial" size="2">Item ID</font></P></TD>
                      <TD width="4%" height=25>&nbsp;</TD>
                      <TD width="48%" height=25><b><font face="Arial" size="2"><%=rs1.Fields(0)%></font></B>&nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=23 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="46%" height=23>
                        <P align=right>Item Title</P></TD>
                      <TD width="4%" height=23>&nbsp;</TD>
                      <TD width="48%" height=23><%=rs1.Fields(3)%>&nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=23 bgcolor="#FFFFFF" bordercolor="#FFFFFF">&nbsp;</TD>
                      <TD width="46%" height=23>
                        <p align="right">Category</TD>
                      <TD width="4%" height=23>&nbsp;</TD>
                      <TD width="48%" height=23><%=rsCat.fields(1)%>&nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=23 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="46%" height=23>
                        <P align=right>Item Description</P></TD>
                      <TD width="4%" height=23>&nbsp;</TD>
                      <TD width="48%" height=23><%=rs1.Fields(9)%>&nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=21 bgcolor="#FFFFFF" bordercolor="#FFFFFF">&nbsp;</TD>
                      <TD width="46%" height=21>
                        <p align="right">Quantity</TD>
                      <TD width="4%" height=21>&nbsp;</TD>
                      <TD width="48%" height=21><%=rs1.Fields(4)%>&nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=21 bgcolor="#FFFFFF" bordercolor="#FFFFFF">&nbsp;</TD>
                      <TD width="46%" height=21>
                      <%
                      	dim cond
                      	if rs1.fields(8)="U" then
                      		cond="Used"
                      	else
                      		cond="New"
                      	end if
                      %>                      
                        <p align="right">Condition</TD>
                      <TD width="4%" height=21>&nbsp;</TD>
                      <TD width="48%" height=21><%=cond%>&nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=21 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="46%" height=21>
                        <P align=right>Current Bid</P></TD>
                      <TD width="4%" height=21>&nbsp;</TD>
                      <TD width="48%" height=21><%=rs1.Fields(13)%></TD></TR>
                    <TR>
                      <TD width="2%" height=23 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="46%" height=23>
                        <P align=right>Seller</P></TD>
                      <TD width="4%" height=23>&nbsp;</TD>
                      <TD width="48%" height=23><%=rs1.Fields(1)%>&nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=22 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="46%" height=22>
                        <p align="right">Seller E-mail</p> </TD>
                      <TD width="4%" height=22>&nbsp;</TD>
                      <TD width="48%" height=22><%=rsTemp.Fields(0)%> &nbsp;</TD></TR>
                    <TR>
                      <TD width="2%" height=21 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="96%" colSpan=3 height=21>
                        <P align=center>Place Your Bid</P></TD></TR>
                    <TR>
                      <TD width="2%" height=25 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="46%" height=25>
                        <P align=right>Your bid value</P></TD>
                      <TD width="4%" height=25>
                      &nbsp;</TD>
                      <TD width="48%" height=25>
                      <INPUT id=text1 
                    name=bidval ></TD></TR>
                    <TR>
                      <TD width="2%" height=24 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="96%" colSpan=3 height=24>
                        <P align=center><INPUT id=button1 style="WIDTH: 89px; HEIGHT: 24px" onclick=runSubmit() type=button size=27 value=Submit name=button1></P></TD></TR>
                    <TR>
                      <TD width="2%" height=19 bgcolor="#FFFFFF" bordercolor="#FFFFFF"></TD>
                      <TD width="96%" colSpan=3 height=19>
                        <P align=center>&nbsp;<IMG src="<%=piclocation %>" 
                        border=0></P></TD></TR></TABLE></FORM></TD></TD></TR></TABLE></TD></TR>
        <TR>
          <TD vAlign=top width="95%" bgColor=#473275 height=108>
            <P align=center><B><FONT face=Tahoma color=#c8bfdd size=2>Copyright 
            © 2004. All product names are trademarks of their respective 
            companie</FONT></B></P></TD></TR></TABLE></TD></TR></TBODY></TABLE></CENTER>
</body>
</html>