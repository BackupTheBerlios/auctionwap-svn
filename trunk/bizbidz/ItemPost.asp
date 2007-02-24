<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT language="JavaScript" src="includes/validations.js"></SCRIPT>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit ()  {
		if ( document.itempost.Price.value == "" || isNaN (document.itempost.Price.value) == 1) { 
			alert("Invalid price");
			document.itempost.Price.focus();
			return false;
		}
		if (!testEMPTY(document.itempost, document.itempost.txtTitle)) 
		{
			validatePrompt(document.itempost.txtTitle,"You should entert Item title");
			return false;
		}
		if ( document.itempost.txtqty.value == "" || isNaN (document.itempost.txtqty.value) == 1) { 
			alert("Invalid Quantity");
			document.itempost.txtqty.focus();
			return false;
		}
		if (!testEMPTY(document.itempost, document.itempost.Descp)) 
		{
			validatePrompt(document.itempost.Descp,"You should enter Item description");
			return false;
		}
		document.itempost.submit();
}
//-->
</SCRIPT>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Bizbidz's Registration</title>
</head>
<%
if session("uid")="" then
	response.redirect("Login.asp?inv=4")
end if
DIM RSS,rs,StrSql
SET RSS=Server.CreateObject("ADODB.Recordset")
set rs=Server.CreateObject("ADODB.Recordset")
rs.Open "Select * from categories", Con
%>
<body bgcolor="#473275" topmargin="0" leftmargin="0" style="text-align: center">
<div align="center">
    <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#ffffff" width="37%" id="AutoNumber1">
      <tr>
      <td width="100%">
      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="774" id="AutoNumber2" height="570">
        <tr>
              <td width="774" bgcolor="#003366" valign="top" height="460"> 
                <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="773" id="AutoNumber3" height="1279">
                  <tr bgcolor="#003366"> 
                    <td height="57" colspan="2"><img src="images/home.jpg" width="773" height="177"></td>
            </tr>
                  <tr bgcolor="#FFFFFF"> 
                    <td height="31" colspan="2"> 
                      <p align="center"><b><font color="#FF00FF" size="2" face="Tahoma"><a href="index.asp"><font color="#003366">Home</font></a><font color="#003366"> 
                        | <a href="About.htm"> About Us</a> | <a href="registration.asp">Registration</a> 
                        | <a href="products.asp">Items List</a> | <a href="Itempost.asp">Post 
                        Item</a> | <a href="myacc.asp">My Account</a> | <a href="forum.asp">Forum</a> 
                        | <a href="help.htm">Help</a> | <a href="feedback.htm">Feedback</a></font></font></b></td>
            </tr>
                  <tr bgcolor="#6666CC"> 
                    <td height="42" colspan="2"> 
						<form name="search" action="products.asp">
                        <p><b><font size="2" color="#FFFFFF">Welcome Back <%=Session("uid")%>&nbsp;</font></b><font size="2" color="#473275">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><font face="Tahoma">&nbsp;<font color="#FFFFFF"> 
                          Search :</font> </font></b> </font><font color="#473275"> 
                          <input name="T1" size="20">
                          <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                          </font><font face="Tahoma" size="2"> 
                          <% if session("uid")= "" then %>
                          <b> <A href="Login.asp"><font color="#FFFFFF">Login</font></a><font color="#FFFFFF">&gt;&gt; 
                          <%else %>
                          <A href="Logout.asp">Logout</a></font> 
                          <%end if%>
                          </b> </font></p>
                      </FORM>
					  <p align="right"><b><font color="#FFFFFF"  > 
                        <script src="dt.js"></script>                  	
                  </font></b></p></td>
            </tr>
            <tr>
                    <td width="183" bgcolor="#FFCC00" height="987" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="57">
                        <tr> 
                          <td width="100%" bgcolor="#000066" bordercolor="#6f57a4" align="middle" height="27"><b><font color="#ffffff" face="Tahoma" size="2"> 
                            B2B Categories</font></b></td>
                        </tr>
                        <tr> 
                          <% do while not rs.eof %>
                          <td width="100%" height="30"> <b><u><A href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> 
                            </A></u></b>&nbsp;</td>
                        </tr>
                        <%rs.movenext%>
                        <%loop%>
                      </table>
              </td>
                    <td width="590" bgcolor="#ffffff" height="987" valign="top"> 

<div align="center">
<form name="itempost" enctype="multipart/form-data" action="Postin.asp" method=post>
<table border="1" width="66%" id="table8">
	<tr>
		<td>
 <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style="WIDTH: 100%; mso-cellspacing: 0in; mso-padding-alt: 0in 0in 0in 0in" id="table9">
                            <tr style="mso-yfti-irow: 0; mso-yfti-lastrow: yes">
        <td height="270" style="PADDING-RIGHT: 0in; PADDING-LEFT: 0in; PADDING-BOTTOM: 0in; PADDING-TOP: 0in"> 
          <table class=MsoNormalTable border=0 cellpadding=0
   style="WIDTH: 106%; mso-cellspacing: 1.5pt" 
      height="215" id="table10">
            <tr style="HEIGHT: 21pt; mso-yfti-irow: 0"> 
              <td colspan=2 style="padding:0.75pt; BACKGROUND: #000080; HEIGHT: 26px" 
                           > <p class=MsoNormal>&nbsp;<span style="COLOR: white; FONT-FAMILY: Arial"> 
                  <b>Pricing Information - Listing For Standard Auction Only</b></span></p></td>
            </tr>
            <tr style="HEIGHT: 18.75pt; mso-yfti-irow: 1"> 
              <td colspan=2 style="padding:0.75pt; BACKGROUND: #FFFFAE; HEIGHT: 41px" 
                           > <p class=MsoNormal><font face="Arial"><i>Here is 
				where you enter the Starting price for your item. You can also 
				set the minimum price that you are willing to sell this item.</i></font></p></td>
            </tr>
            <tr style="HEIGHT: 22.5pt; mso-yfti-irow: 3"> 
              <td style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 28px" 
                           > <p class=MsoNormal align="right">
				<font face="Arial"><b><font size="2">Currency To Trade In</font> :</b> </font> </p></td>
              <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 28px" bgcolor="#FFFFEA" 
                           > <p class=MsoNormal><font face="Arial">RM </font> </p></td>
            </tr>
            <tr style="HEIGHT: 26.25pt; mso-yfti-irow: 5"> 
              <td width="29%" style="padding:0.75pt; BACKGROUND: #CCFFFF; WIDTH: 29.34%; HEIGHT: 44px" 
                           > <p class=MsoNormal align="right">
				<font face="Arial"><b>&nbsp;Start Price :</b> <b><span style="COLOR: red">
				*</span></b></font><br>
                  <span style="FONT-SIZE: 7.5pt; FONT-FAMILY: Arial" 
                             >The minimum price to start your auction </span></p></td>
              <td style="padding:0.75pt; HEIGHT: 44px" bgcolor="#FFFFEA" 
                           > <p class=MsoNormal> 
                  <INPUT MAXLENGTH="12" SIZE="12" NAME="Price" >
                </p></td>
            </tr>
            <tr style="HEIGHT: 33.75pt; mso-yfti-irow: 8"> 
              <td style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 43px" 
                           > <p align="right"><font face="Arial"><b>
				<font size="2">Item Category: <font color="#FF0000">*</font></font> </b>
				</font></p> </td>
              <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 43px" bgcolor="#FFFFEA" 
                           ><select name="cato" size="1" id="cato">
                           <%rs.MoveFirst()%>
                           <% do while not rs.EOF %>
                           <option><%=rs.Fields(1)%></option>
                           <%rs.MoveNext()%>
                           <%loop%>
                </select> </td>
            </tr>
            <tr style="HEIGHT: 33.75pt; mso-yfti-irow: 8"> 
              <td style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 43px" 
                           ><div align="right"><font face="Arial"><strong>Item 
				Title:
				<font color="#FF0000">*</font></strong></font></div></td>
              <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 43px" bgcolor="#FFFFEA" 
                           >
              <input name="txtTitle" id="txtTitle" size="20" 
                             ></td>
            </tr>
            <tr style="HEIGHT: 33.75pt; mso-yfti-irow: 8"> 
              <td style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 43px" 
                           > <p class=MsoNormal align="right">
				<font face="Arial"><b>Quantity: <font color="#FF0000">*</font></b> 
				</font> </p></td>
              <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 43px" bgcolor="#FFFFEA" 
                           > <p class=MsoNormal><span style="FONT-SIZE: 10pt; FONT-FAMILY: Arial" 
                             > 
                  <input name="txtqty" id="txtqty" size="20" >
                  </span></p></td>
            </tr>
            </table>
  		</td>
 </tr>
</table>

                          </td>
	</tr>
	<tr>
		<td>
  <table class=MsoNormalTable border=0 cellpadding=0 width="100%"
   style="WIDTH: 100%; mso-cellspacing: 1.5pt" 
      height="162" id="table11">
                                  <tr bgcolor="#000099" style="HEIGHT: 21pt; mso-yfti-irow: 0"> 
                                    <td colspan=2 style="padding:0.75pt; BACKGROUND: #000080; HEIGHT: 26px" 
                           > 
                                      <p class=MsoNormal><span style="COLOR: white; FONT-FAMILY: Arial"><b>
										Posting Information</b></span></p>
    </td>
   </tr>
   <tr style="HEIGHT: 18.75pt; mso-yfti-irow: 1">
    <td colspan=2 style="PADDING-RIGHT:
    0.75pt; PADDING-LEFT: 0.75pt; BACKGROUND: #ffffae; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 23px" 
                           >
    <p class=MsoNormal><font face="Arial"><i>You can set when you want to start 
	and the duration of your posting</i></font></p>
    </td>
   </tr>
   <tr style="HEIGHT: 26.25pt; mso-yfti-irow: 5">
    <td width="29%" style="padding:0.75pt; BACKGROUND: #CCFFFF; WIDTH: 29.64%; HEIGHT: 33px" 
                           >
    <p class=MsoNormal align="right"><font face="Arial"><b>Start Your Posting :</b> <b><span style="COLOR: red" 
                             >*</span></b></font></p>
    </td>
    <td width="69%" style="PADDING-RIGHT:
    0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; WIDTH: 69.26%; PADDING-TOP: 0.75pt; HEIGHT: 33px" bgcolor="#FFFFEA" 
                           >
    <p class=MsoNormal style="margin-top: 0; margin-bottom: 0">
	<INPUT TYPE="radio" CHECKED NAME="StartWhen" VALUE="V1"><font face="Arial">Immediate</font>
    </p>
	<p class=MsoNormal style="margin-top: 0; margin-bottom: 0">
    <INPUT TYPE="radio" NAME="StartWhen" VALUE="V2"><font face="Arial">Only 
	start at :</font></p>
	<p class=MsoNormal style="margin-top: 0; margin-bottom: 0">
	<font face="Arial">&nbsp;</font><SELECT NAME="SDay">
<OPTION VALUE="1">01
<OPTION VALUE="2">02
<OPTION VALUE="3">03
<OPTION VALUE="4">04
<OPTION VALUE="5">05
<OPTION VALUE="6">06
<OPTION VALUE="7">07
<OPTION VALUE="8">08
<OPTION VALUE="9">09
<OPTION VALUE="10">10
<OPTION VALUE="11">11
<OPTION VALUE="12">12
<OPTION VALUE="13">13
<OPTION VALUE="14">14
<OPTION VALUE="15">15
<OPTION VALUE="16">16
<OPTION VALUE="17">17
<OPTION VALUE="18">18
<OPTION VALUE="19">19
<OPTION VALUE="20">20
<OPTION VALUE="21">21
<OPTION VALUE="22">22
<OPTION VALUE="23">23
<OPTION SELECTED VALUE="24">24
<OPTION VALUE="25">25
<OPTION VALUE="26">26
<OPTION VALUE="27">27
<OPTION VALUE="28">28
<OPTION VALUE="29">29
<OPTION VALUE="30">30
<OPTION VALUE="31">31</OPTION>
</SELECT>&nbsp;<SELECT NAME="SMonth">
<OPTION VALUE="1">Jan
<OPTION SELECTED VALUE="2">Feb
<OPTION VALUE="3">Mar
<OPTION VALUE="4">Apr
<OPTION VALUE="5">May
<OPTION VALUE="6">Jun
<OPTION VALUE="7">Jul
<OPTION VALUE="8">Aug
<OPTION VALUE="9">Sep
<OPTION VALUE="10">Oct
<OPTION VALUE="11">Nov
<OPTION VALUE="12">Dec</OPTION>
</SELECT>&nbsp;<SELECT NAME="SYear">
<OPTION SELECTED VALUE="2004">2004
<OPTION VALUE="2005">2005</OPTION>
</SELECT>&nbsp;<SELECT NAME="SHour">
<OPTION VALUE="00:00">00:00
<OPTION VALUE="01:00">01:00
<OPTION VALUE="02:00">02:00
<OPTION VALUE="03:00">03:00
<OPTION VALUE="04:00">04:00
<OPTION VALUE="05:00">05:00
<OPTION VALUE="06:00">06:00
<OPTION VALUE="07:00">07:00
<OPTION VALUE="08:00">08:00
<OPTION VALUE="09:00">09:00
<OPTION VALUE="10:00">10:00
<OPTION VALUE="11:00">11:00
<OPTION VALUE="12:00">12:00
<OPTION VALUE="13:00">13:00
<OPTION VALUE="14:00">14:00
<OPTION VALUE="15:00">15:00
<OPTION VALUE="16:00">16:00
<OPTION VALUE="17:00">17:00
<OPTION VALUE="18:00">18:00
<OPTION VALUE="19:00">19:00
<OPTION VALUE="20:00">20:00
<OPTION SELECTED VALUE="21:00">21:00
<OPTION VALUE="22:00">22:00
<OPTION VALUE="23:00">23:00</OPTION>
</SELECT>
    </p>
    </td>
   </tr>
   <tr style="HEIGHT: 26.25pt; mso-yfti-irow: 7">
    <td style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 57px" 
                           >
    <p class=MsoNormal align="right"><font face="Arial"><b>Duration : <span style="COLOR: #ff0033" 
                             >*</span></b> <br>
    <span style="FONT-SIZE: 7.5pt; " 
                             >You can set the number of days that your posting 
	will appear to the bidders</span></font><span style="FONT-SIZE: 7.5pt; FONT-FAMILY: Verdana" 
                             > </span></p>
    </td>
    <td style="padding:0.75pt; HEIGHT: 57px" bgcolor="#FFFFEA" 
                           >
    <p class=MsoNormal><SELECT NAME="Duration">
<OPTION VALUE="1">1 day
<OPTION VALUE="2">2 days
<OPTION VALUE="3">3 days
<OPTION SELECTED VALUE="5">5 days
<OPTION VALUE="7">7 days
<OPTION VALUE="10">10 days</OPTION> 
</SELECT></p>
    </td>
   </tr>
   </table>
  		</td>
	</tr>
	<tr>
		<td>

                          <table class=MsoNormalTable cellspacing=0 cellpadding=0
 style="WIDTH: 519px; HEIGHT: 438px; mso-cellspacing: 0in; mso-padding-alt: 0in 0in 0in 0in" id="table12">
                            <tr>
    <td style="padding:0.75pt; BACKGROUND: #000080; HEIGHT: 21pt" 
          width="517">
    <p class=MsoNormal>&nbsp;<b><span style="COLOR: white; FONT-FAMILY: Arial" 
                             >Product Information</span></b></p>
    </td>
   </tr>
	<tr>
    <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt;
    BACKGROUND: #ffffae; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 18.75pt" 
          width="517">
    <p class=MsoNormal><font face="Arial"><i>You can provide description and 
	upload picture for your item here. Accuracy of description reflects quality 
	of posting.</i></font></p>
    </td>
   </tr>
 <tr style="mso-yfti-irow: 0; mso-yfti-lastrow: yes">
  <td style="PADDING-RIGHT: 0in; PADDING-LEFT: 0in; PADDING-BOTTOM: 0in; PADDING-TOP: 0in" 
                     >
  <table class=MsoNormalTable border=0 cellpadding=0 style="mso-cellspacing:
   1.5pt" width="519" id="table13">
   <tr style="HEIGHT: 22.5pt; mso-yfti-irow: 4">
    <td style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 22.5pt" 
          width="177">
    <p class=MsoNormal align="right"><font face="Arial"><b>Condition :
	<font color="#FF0000">*</font></b></font></p>
    </td>
    <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 22.5pt" 
          width="350" bgcolor="#FFFFEA">
    <p class=MsoNormal><SELECT NAME="Condition">
<OPTION VALUE="F">Faulty
<OPTION VALUE="N">New
<OPTION VALUE="O">Open Box
<OPTION VALUE="R">Refurbished
<OPTION VALUE="E">Return
<OPTION SELECTED VALUE="U">Used</OPTION>
</SELECT></p>
    </td>
   </tr>
   <tr style="HEIGHT: 33.75pt; mso-yfti-irow: 6">
    <td colspan=2 style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 33.75pt" 
          width="513">
    <p class=MsoNormal><font face="Arial"><b>Fill in the Description below:
	<font color="#FF0000">*</font></b></font></p>
    </td>
   </tr>
   <tr style="mso-yfti-irow: 8">
    <td colspan=2 style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt" 
          width="513">
    <p class=MsoNormal><TEXTAREA name=Descp rows=13 cols=60></TEXTAREA><span
    
            style="mso-spacerun: yes" 
                             >&nbsp;</span></p>
    </td>
   </tr>
   <tr style="HEIGHT: 33.75pt; mso-yfti-irow: 10">
    <td colspan=2 style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 33.75pt" 
          width="513">
    <p class=MsoNormal style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
	<p class=MsoNormal style="margin-top: 0; margin-bottom: 0">
	<font face="Arial"><b>Upload Your Pictures: </b> <br>
    </font>
    <span style="FONT-SIZE: 7.5pt; FONT-FAMILY: Arial" 
                             >If you have your picture in JPEG file format, you 
	can upload it here but make sure that the file size does not exceed 150k. 
	Picture cannot be edited once you have submit your posting. Item with 
	picture will appear in gallery. If you wish to get your item featured, you 
	need to make use of this section. </span></p>
    </td>
   </tr>
   <tr style="HEIGHT: 16.5pt; mso-yfti-irow: 14; mso-yfti-lastrow: yes" 
                         >
    <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 16.5pt" 
          width="177" bgcolor="#CCFFFF">
    <p class=MsoNormal align=right><b><span style="FONT-SIZE: 10pt; FONT-FAMILY: Arial" 
                             >Picture</span></b><span style="font-family: Arial">:</span><span
    
            style="FONT-SIZE: 10pt; FONT-FAMILY: Arial"> :</span></p>
    </td>
              <td style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 16.5pt" 
          width="350" bgcolor="#FFFFEA"> <p class=MsoNormal>&nbsp;<INPUT id=file1 
            type=file name=file1 size="20" ></p>
    </td>
   </tr>
  </table>
  </td>
 </tr>
</table>

		</td>
	</tr>
	<tr>
		<td>

<span style="DISPLAY: none; mso-hide: all">
                        <TABLE class=MsoNormalTable 
                        style="WIDTH: 100%; mso-cellspacing: 1.5pt" 
                        cellPadding=0 border=0 id="table14">
                          
                          <TR style="HEIGHT: 21pt; mso-yfti-irow: 0">
                            <TD 
                            style="padding:0.75pt; BACKGROUND: #000080; HEIGHT: 21pt" 
                            colSpan=2>
                              <P class=MsoNormal>&nbsp;<B><SPAN 
                              style="COLOR: white; FONT-FAMILY: Arial">Promotion</SPAN></B></P></TD></TR>
                          <TR style="HEIGHT: 18.75pt; mso-yfti-irow: 1">
                            <TD 
                            style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; BACKGROUND: #ffffae; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 18.75pt" 
                            colSpan=2>
                              <P class=MsoNormal><I><font face="Arial">Here is 
								where you can make members take extra notice in 
								your items</font></I></P></TD></TR>
                          <TR 
                          style="HEIGHT: 37.5pt; mso-yfti-irow: 4; mso-yfti-lastrow: yes">
                            <TD 
                            style="padding:0.75pt; BACKGROUND: #CCFFFF; HEIGHT: 37.5pt">
                              <P class=MsoNormal style="margin-top: 0; margin-bottom: 0">
								<font face="Arial"><B>Place in Featured Deals: 
                              </B><BR></font>
								<SPAN 
                              style="FONT-SIZE: 7.5pt; FONT-FAMILY: Arial">You 
								can feature your item in  
                              </SPAN></P>
								<P class=MsoNormal style="margin-top: 0; margin-bottom: 0">
								<SPAN 
                              style="FONT-SIZE: 7.5pt; FONT-FAMILY: Arial">
								BizBidz.com frontpage.  
                              </SPAN></P></TD>
                            <TD 
                            style="PADDING-RIGHT: 0.75pt; PADDING-LEFT: 0.75pt; PADDING-BOTTOM: 0.75pt; PADDING-TOP: 0.75pt; HEIGHT: 37.5pt" bgcolor="#FFFFEA">
                              <P class=MsoNormal style="margin-top: 0; margin-bottom: 0">
								<font face="Arial"><INPUT type=checkbox value=Y 
                              name=FeaturedInFrontPage> I want to feature it in 
								BizBidz front page </font> </P>
								<P class=MsoNormal style="margin-top: 0; margin-bottom: 0">
								<font face="Arial">
								<SPAN 
                              style="FONT-SIZE: 7.5pt; COLOR: red">RM 3.00 per 
								posting</SPAN> <BR></font>
								<SPAN 
                              style="FONT-SIZE: 7.5pt; FONT-FAMILY: Arial">
								<font color="#FF0000">* 
                              </font>To use this feature, make sure you have 
								upload a picture previously </SPAN> </P></TD></TR></TABLE>
                        </span></td>
	</tr>
	<tr>
		<td>
		<p align="center"><INPUT name=button1 type="button" value="Post Item" onClick="runSubmit()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="Reset" name="Reset"></td>
	</tr>
</table>
</form>
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>
</body>
</html>