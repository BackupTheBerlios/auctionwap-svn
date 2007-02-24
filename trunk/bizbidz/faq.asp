<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>BizBidz system</title>
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
          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" id="AutoNumber3" width="98%">
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
              <td width="568" height="622" valign="top" bordercolor="#FFFF00" bgcolor="#FFFFFF"> 
                <div align="center"> 
                  <center>
                    <p></p>
                    <p></p>
                    <p></p>
                  </center>
                </div>
				<div align="center"> 
                  <p align="left">&nbsp;
					<font face="Arial" color="#003399" size="2"><b>Frequently 
					Asked Questions on BizBidz</b></font></p>
                </div>
				<div align="center"> 
                  <p align="left"><font face="Arial" size="2" color="#003399">
					<b>&nbsp; </b></font><b>
					<font face="Arial" size="2" color="#800080">About Auction</font></b></p>
					<ul>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; 
						Definition of Auction</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; Types 
						of Auctions</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font color="#800080">&nbsp; </font>
						<font color="#800080" size="2" face="Arial">Auction 
						Glossary</font></p></li>
					</ul>
                </div>
				<div align="center"> 
                  <p align="left">&nbsp; <b>
					<font face="Arial" size="2" color="#800080">Get Started</font></b></p>
                </div>
				<div align="center"> 
                  <ul>
					<li>
					<p align="left" style="margin-top: 0; margin-bottom: 0">
					<font face="Arial" size="2" color="#800080"><b>&nbsp; </b>
					How do I register?</font></p></li>
					<li>
					<p align="left" style="margin-top: 0; margin-bottom: 0">
					<font face="Arial" size="2" color="#800080">&nbsp; Why do I 
					need to register?</font></p></li>
					<li>
					<p align="left" style="margin-top: 0; margin-bottom: 0">
					<font face="Arial" size="2" color="#800080">&nbsp; What is 
					Username and Password for?</font></p></li>
					<li>
					<p align="left" style="margin-top: 0; margin-bottom: 0">
					<font face="Arial" size="2" color="#800080">&nbsp; How do I 
					update my account information?</font></p></li>
					</ul>
					<p align="left" style="margin-top: 0; margin-bottom: 0">
					<font face="Arial" size="2" color="#800080">&nbsp; <b>
					Bidder's Guide</b></font></p>
					<ul>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080"><b>&nbsp;
						</b>How do I start buying?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; What 
						does it cost me to bid and buy on Bizbidz.com?</font></p>
						</li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; What 
						type of items do you auction?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I find an item to bid?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I make a bid?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I know if I have been outbid?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I know if I have won the auction?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						can I cancel a bid?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I collect my items from the seller?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I pay the seller?</font></p></li>
					</ul>
					<p align="left" style="margin-top: 0; margin-bottom: 0">
					<font face="Arial" size="2" color="#800080">&nbsp; <b>
					Sellers Guide</b></font></p>
					<ul>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I start selling?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; What 
						does it cost me to sell on Bizbidz.com?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; What 
						type of items can I sell?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						can I add pictures to my posting?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						do I feature my item on the homepage of Bizbidz.com</font></p>
						</li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; How 
						can I end my auction?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; What 
						happens after the auction is closed?</font></p></li>
						<li>
						<p align="left" style="margin-top: 0; margin-bottom: 0">
						<font face="Arial" size="2" color="#800080">&nbsp; Can I 
						accept payment online?</font></p></li>
						<li>
						
                      <p align="left" style="margin-top: 0; margin-bottom: 0"> 
                        <font face="Arial" size="2" color="#800080">&nbsp; What 
                        happens if the successful successful bidder refuses to 
                        pay for the item?</font></p>
                    </li>
					</ul>
					<p align="left" style="margin-top: 0; margin-bottom: 0">&nbsp;</p>
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