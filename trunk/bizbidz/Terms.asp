<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>BizBidz system</title>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit() 
{
	document.terms.submit();
}
//-->
</SCRIPT>
<SCRIPT LANGUAGE="VBScript">
<!--
sub runCancel() 
	document.location.href="Index.asp"
end sub
//-->
</SCRIPT>
</head>
<%
	Dim rs
	set rs=Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * from categories", Con
%>
<body bgcolor="#003366" topmargin="0" leftmargin="0">
<div align="center">
  <center>
    <table width="772" border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" id="AutoNumber1" style="border-collapse: collapse">
      <tr>
        <td width="100%" align="center" bgcolor="#000066"> 
          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" id="AutoNumber3" width="97%">
            <tr bgcolor="#003366"> 
              <td height="68" colspan="2" align="center"> <img src="images/home.jpg" width="773" height="177"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="32" colspan="2" align="center"> 
                <div align="center"><b><font color="#FF00FF" size="2" face="Tahoma"><a href="index.asp"><font color="#003366">Home</font></a><font color="#003366"> 
                  | <a href="About.htm"> About Us</a> | <a href="registration.asp">Registration</a> 
                  | <a href="products.asp">Items List</a> | <a href="Itempost.asp">Post 
                  Item</a> | <a href="myacc.asp">My Account</a> | <a href="forum.htm">Forum</a> 
                  | <a href="help.htm">FAQ</a> | <a href="feedback.htm">Feedback</a></font></font></b> 
                </div>
                </td>
            </tr>
            <tr bgcolor="#6666CC"> 
              <td colspan="2" align="center"> 
                <form name="search" action="products.asp">
                  <p align="center"> <font color="#FFFFFF"> </font><font size="2" color="#473275">&nbsp;&nbsp;<strong> 
                    &nbsp;<font color="#FFFFFF" face="Tahoma">Search :</font></strong><b><font face="Tahoma">
					</font></b> </font><font color="#473275"> 
                    <input name="T1" size="20">
                    <input type="submit" value="Go" name="B1" style="WIDTH: 40px" width="40">
                    &nbsp;</font><font face="Tahoma" size="2"> 
                    <% if session("uid")= "" then %>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;&nbsp;&nbsp;&nbsp;</b><strong><font color="#FFFFFF">&nbsp; 
                    <A href="Login.asp"><font color="#FFFFFF">Login&gt;&gt;</font></a></font></strong><b><font color="#FFFFFF">
                    <%else %>
                    <A href="Logout.asp"><font color="#FFFFFF">Logout</font></a> 
                    <%end if %>
                    </font></b> </font></p>
              </FORM>
                <p align="right"><b><font color="#FFFFFF"  > 
                  <script src="dt.js"></script>
                  </font></b></p></td>
            </tr>
            <tr> 
              <td width="21%" height="622" align="center" valign="top" bgcolor="#FFCC00"> 
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="66">
                  <tr> 
                    <td width="100%" bgcolor="#000066" bordercolor="#6F57A4" align="center" height="29"><div align="center"><b><font color="#ffffff" face="Tahoma" size="2"> 
                        B2B Categories</font></b></div></td>
                  </tr>
                  <tr> 
                    <% do while not rs.eof %>
                    <td width="100%" height="37" bgcolor="#FFCC00"> <b><u><a href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> 
                      </a></u></b>&nbsp;</td>
                  </tr>
                  <%rs.movenext%>
                  <%loop%>
                </table>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
				<p>&nbsp;</p>
              </td>
              <td width="591" height="622" valign="top" bordercolor="#FFFF00" bgcolor="#FFFFFF"> 
                <div align="center"> 
                  <center>
                    <p></p>
                    <p></p>
                    <p></p>
                  </center>
                </div>
				<div align="center"> 	
                  <table border="1" width="104%" id="table1">
					<tr>
						<td width="12">&nbsp;</td>
						<td>
						<p class="MsoNormal" align="center" style="text-align:center">
						<b><span style="font-size:14.0pt;font-family:Arial">
						Terms and Conditions</span></b></p>
							<p class="MsoNormal" align="center">
							<textarea rows="21" name="S1" cols="62">BizBidz.com provides access to its services to individuals, sole proprietors, partnerships, businesses and corporations subject to the following terms and conditions. 

By registering to use our service, you accept and agree to these terms and conditions. If you do not agree to accept these terms and conditions, you may not access or other wise use the services of this site.

1.1	Eligibility for Membership
Our Services are available only to corporate bodies which can form legally binding contracts under the Malaysian law. Individuals below the age of 18, who are considered as minors are not allowed to use the Services.
1.2	BizBidz.com is only a Venue for Trading
BizBidz.com acts as a venue for sellers to conduct auctions and for bidders to bid. We are not involved in the actual transaction between buyers and sellers. As a result, we have no control over the quality, safety or legality of the items advertised the truth or accuracy of the listings, the ability of sellers to sell items or the ability of buyers to buy items. 
We cannot and do not control whether or not sellers will complete the sale of items they offer or whether buyers will complete the purchase of items they have bid on. We encourage you to communicate directly with a trading partner to help you evaluate the other party. 
We cannot control the information provided by other businesses which is made available through our system. Note that all graphics displayed in listings may reside on our servers, but we do not and cannot control the images that are uploaded by our users. Information and images posted by a member may be offensive, harmful or inaccurate, and in some cases will be mislabeled or deceptively labeled. We expect that you will use caution and common sense when using our site. We are not liable for any images that have been placed on our servers, as they are beyond our control.
1.3	Bidding and Buying 
If you bid on an item, it is an irrevocable offer to buy the item at the bid price. You are obligated to complete the transaction. The winning bidder is the one who places the highest bid on an item that meets or exceeds the minimum price as stipulated by the seller.
Winning bidders are obligated to complete the transaction. Bids are not retractable except in exceptional circumstances such as the seller materially changing the description of the item after your bid or clear typographical errors. You may not bid in a way that exposes the maximum bid of other bidders, then retract the high bid, and re-bid at a smaller increment above the legitimate high bidder. 
1.4	Listing and Selling
You may list your auction only in appropriate categories. In your listings, you may not link to or include advertising for goods or services. Your company may not list on our site or sell any item using our site which (a) infringes any third party’s copyright, patent, trademark, trade secret or other proprietary rights or rights of publicity or privacy; (b) otherwise causes legally-recognized harm (such as a product that contains a defamatory statement); or (c)  is illegal under, or your sale to the buyer would violate, any applicable law, statute, ordinance or regulation. 
Without limiting the foregoing, you may not list on our site or sell through our site, alcohol beverage or items of a pornographic nature. Furthermore, you may not list on our site or sell through our site any item that, by paying to us the listing fee, could cause us to violate any applicable law, statute, ordinance or regulation
1.5	No Price Manipulation
Sellers may not manipulate the price of their item, either by using a shill (a secondary account or third party) or by bidding themselves. 
1.6	System Integrity 
You agree that you are solely responsible for preserving the confidentiality of your username and your password and all activities and charges related to the use of your password, including unauthorised use. You agree not to furnish your username, password or other information to any other party for use of the site and services 
1.7	General
This Agreement shall be governed in all respects by the laws of Malaysia. As such, laws are applied to agreements entered into and performed entirely within Malaysia and between Malaysian residents. Both parties submit to jurisdiction in Malaysia and further agree that any cause of action arising under this Agreement shall be brought exclusively to a court in Malaysia. BizBidz.com does not guarantee continuous, uninterrupted or secure access to our services, and the operation of our site may be interfered with by numerous factors outside of our control. 
If any provision of this Agreement is held to be invalid or unenforceable, that provision shall be struck and the remaining provisions shall be enforced. Headings are for reference purposes only, and in no way define, limit, construe or describe the scope or extent of such sections. Our failure to act with respect to a breach by you or others does not waive our right to act with respect to subsequent or similar breaches. This Agreement sets forth the entire understanding and agreement between us with respect to the subject matter hereof.
</textarea></p>
							<p class="MsoNormal" align="center">
							<form name="terms" action="Registration.asp" method="get">
							<p align="center">
							<input type="Button" value="I Agree" onclick="runSubmit()">&nbsp;&nbsp;&nbsp;
							<input type="button" value="I Don't Agree"  onclick="runCancel()"></p>
							</p>						
							</form>							
						<p>&nbsp;</td>
						<td width="20">&nbsp;</td>
					</tr>
					</table>
                </div></td>
            </tr>
          </table>
        </td>
    </tr>
  </table>
  </center>
</div>
</body>
</html>