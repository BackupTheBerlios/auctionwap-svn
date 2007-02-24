<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<html>
<head>
<SCRIPT language="JavaScript" src="includes/validations.js"></SCRIPT>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function runSubmit (org)  {
        
		if (!testEMPTY(org, org.T1)) return;
		if (!testEMPTY(org, org.T2)) return;
		if (!testEMPTY(org, org.T3)) return;
		if (!testEMPTY(org, org.T4)) return;
		if (!testEMPTY(org, org.T5)) return;
		if (!testMAIL(org, org.T6)) return;
		if (!testEMPTY(org, org.T7)) return;
		if (!testEMPTYADDRESS(org, org.T8)) return;
		if (!testNUMBER(org, org.T9)) return;
		if (!testEMPTY(org, org.T10)) return;
		if (!testEMPTY(org, org.T11)) return;
		if (!testEMPTY(org, org.T12)) return;
        org.submit();
        return;
}
//-->
</SCRIPT>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title></title>
</head>

 <% 
 qryval=""
 qryval = request.querystring("categ")
 if qryval=01 then
    qrystr="Clothing N Accessories"
   elseif qryval=02 then
   		qrystr="Computers N peripherals"
   	elseif qryval=03 then
   	      qrystr="Electronics"
   	   elseif qryval=04 then
   	         qrystr="Industry Supplies N Machinery"
   	      elseif qryval=05 then
   	          qrystr="Office Supplies N Equipments"
   	          end if
   	          
   	         
DIM RSS,rs
SET RSS=Server.CreateObject("ADODB.Recordset")
set rs=Server.CreateObject("ADODB.Recordset")
	if qryval="" then
		'sql="select * from item_seller where starting_bid=#"& date & "#"
		sql="SELECT * FROM item_seller WHERE day(starting_bid)=" & day(date) & " and month(starting_bid)=" & month(date) & " and year(starting_bid)=" & year(date) & ""
	else
		sql="select * from item_seller where item_category='" & qrystr & "'"
	end if
	
'response.write(sql)
RSS.Open sql, Con, adOpenDynamic, 2, adCmdTable
rs.Open "Select * from catogeries", Con
%>



<body bgcolor="#473275" topmargin="0" leftmargin="0">

<div align="center">
  <center>
  <table border="3" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="37%" id="AutoNumber1" height="802">
    <tr>
      <td width="100%" height="802">
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="786" id="AutoNumber2" height="570">
        <tr>
          <td width="613" bgcolor="#6F57A4" valign="top" height="460">
          <table border="2" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="127%" id="AutoNumber3" height="793">
                  <tr>
              <td width="21%" bgcolor="#FFFFFF" height="47">&nbsp;
              </td>
              <td width="79%" bgcolor="#FFFFFF" height="47">
              <p align="center"><b><font face="Tahoma" size="2" color="#473275"> 
                        <a style="text-decoration: none" href="index.asp"> <font color="#473275">Home</font></a> 
                        |</font><font face="Tahoma" size="2" color="#6F57A4"><a href="about.htm" style="text-decoration: none"><font color="#473275">About 
                        us</font></a></font><font face="Tahoma" size="2" color="#473275"> 
                        | <a style="text-decoration: none" href="registration.asp"> 
                        <font color="#473275">Registration</font></a> | <a style="text-decoration: none" href="PostItem.asp"> 
                        <font color="#473275">Post Item</font></a> | <font color="#473275"> 
                        <a href="my_account.htm" style="text-decoration: none"> 
                        <font color="#473275">My Account</font></a> | <a href="forum.htm" style="text-decoration: none"> 
                        <font color="#473275">Forums</font></a> |&nbsp;Help | 
                        Feedback</font></a><a href="aaa/contact.htm" style="text-decoration: none"><font color="#473275"> 
                        </font></a> </font></b></td>
            </tr>
            <tr>
              <td width="21%" bgcolor="#FFFFFF" height="234" valign="top">
              <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6">
                        <tr>
                  <td width="100%" bgcolor="#6F57A4" bordercolor="#6F57A4" align="center"><b><font color="#ffffff" face="Tahoma" size="2">
              B2B Categories</font></b></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="39"> <b><u><a href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </a></u></b>&nbsp;</td>
                </tr>
			  <%rs.movenext%>
  			   <%loop%>
              </table>
              </td>
              <td width="79%" bgcolor="#FFFFFF" height="234" valign="top">
              <div align="center">       <center>
             <form name="frmregister" action="forum.asp" method="post">   
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#473275" width="115%" id="AutoNumber4" height="211">
                  <tr>
                    <td width="100%" bgcolor="#DFDAEB" height="318">
                    <p align="center"><b><font face="Tahoma" color="#000080">
                    Item Information</font></b></p>
                    <div align="center">
                      <center>
                                      <table border="0" cellpadding="0" cellspacing="5" style="border-collapse: collapse" bordercolor="#6F57A4" width="100%" id="AutoNumber5" height="680">
                                        <tr>
                          <td width="31%" align="center" height="23">
                          <p align="right"><b>
                          <font face="Tahoma" size="2" color="#473275">Item ID</font></b></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input type="text" name="T10" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23">
                          <p align="right"><b>
                          <font face="Tahoma" size="2" color="#473275">Seller ID</font></b></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input type="text" name="T1" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23">
                          <p align="right"><b>
                          <font face="Tahoma" size="2" color="#473275">Item 
                          Category</font></b></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <select size="1" name="T2">
                                                <option value="Clothing N Accessories">Clothing 
                                                &amp; Accessories </option>
                                                <option value="Industry Supplies N Machinery">Industrial 
                                                suppliers &amp; machinery </option>
                                                <option value="Office Supplies N Equipments">Office 
                                                supplies &amp; Equipments </option>
                                                <option value="Computers N peripherals">Computer 
                                                &amp; peripherals </option>
                                                <option value="Electronics">Electronics</option>
                                              </select>
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Item 
                                              title</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input type="text" name="T3" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Item 
                                              Description</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input name="T4" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Quantity</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input name="T5" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Condition</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <select size="1" name="N1">
                                                <option value="New">New</option>
                                                <option value="Used" selected>Used</option>
                                              </select>
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="62"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Shipping 
                                              Details </font></b></div></td>
                          <td width="72%" align="center" height="62">
                          <p align="left">
                          <font face="Tahoma"><b>
                              <font size="2" color="#473275">
                          <input type="checkbox" name="S1" value="Refer ID">Refer 
                          to Item Description&nbsp;
                          <input type="checkbox" name="S2" value="NP">Normal 
                          Post <input type="checkbox" name="S3" value="PL">Pos 
                          Laju<br>
                          <input type="checkbox" name="S4" value="PS"> Parcel 
                          Service<br>
                          Other, please specify here : </font></b></font>
                          <input name="S5" size="11"></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Where 
                                              is the Item now?</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input name="N3" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Where 
                                              are you willing to ship?</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input name="N4" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="36"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Product 
                                              description</font></b></div></td>
                                          <td width="72%" align="center" height="36"> <div align="left">
                                              <textarea rows="2" name="N5" cols="20"></textarea>
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Price</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input type="text" name="T6" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="22"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Duration</font></b></div></td>
                                          <td width="72%" align="center" height="22"> <div align="left"><font face="Tahoma"><b><font color="#473275"> 
                                              &nbsp;&nbsp; 
                                              <select size="1" name="Hrs">
                                                <option selected value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                              </select>
                                              <font size="2">Hr(s)&nbsp;&nbsp; 
                                              </font> 
                                              <select size="1" name="Dys">
                                                <option selected value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                              </select>
                                              <font size="2">Day(s)</font></font></b></font></div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Phone 
                                              No </font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input type="text" name="T8" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Credit 
                                              card No</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input name="N6" size="20">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" height="23"><div align="right"><b> 
                                              <font face="Tahoma" size="2" color="#473275">Item 
                                              Picture</font></b></div></td>
                                          <td width="72%" align="center" height="23"> <div align="left">
                                              <input type="file" value="Browse" name="T9" size="35">
                                            </div></td>
                        </tr>
                        <tr>
                          <td width="100%" align="center" colspan="2" height="96">
                          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="81%" id="AutoNumber6">
                            <tr>
                              <td width="100%" colspan="2">
                              <p align="center"><b>
                              <font face="Tahoma" size="2" color="#473275">
                              Method of payment you are willing to accept</font></b></td>
                            </tr>
                            <tr>
                              <td width="54%"><font face="Tahoma"><b>
                              <font size="2" color="#473275">
                              <input type="checkbox" name="MP1" value="CHQ"> 
                              Cheque</font></b></font></td>
                              <td width="46%"><font face="Tahoma"><b>
                              <font size="2" color="#473275">
                              <input type="checkbox" name="MP2" value="CASH"> 
                              Cash on Delivery</font></b></font></td>
                            </tr>
                            <tr>
                              <td width="54%"><font face="Tahoma"><b>
                              <font size="2" color="#473275">
                              <input type="checkbox" name="MP3" value="MASTER"> 
                              MasterCard</font></b></font></td>
                              <td width="46%"><font face="Tahoma"><b>
                              <font size="2" color="#473275">
                              <input type="checkbox" name="MP4" value="BT"> 
                              Bank Transfer/TT</font></b></font></td>
                            </tr>
                            <tr>
                              <td width="54%"><font face="Tahoma"><b>
                              <font size="2" color="#473275">
                              <input type="checkbox" name="MP5" value="AE"> 
                              American Express</font></b></font></td>
                              <td width="46%"><font face="Tahoma"><b>
                              <font size="2" color="#473275">
                              <input type="checkbox" name="MP6" value="VISA"> 
                              Visa</font></b></font></td>
                            </tr>
                            <tr>
                              <td width="54%"><font face="Tahoma"><b>
                              <font size="2" color="#473275">
                              <input type="checkbox" name="MP7" value="OTHERS"> 
                              Others</font></b></font></td>
                              <td width="46%">&nbsp;</td>
                            </tr>
                          </table>
                          </td>
                        </tr>
                        <tr>
                          <td width="31%" align="center" bgcolor="#6F57A4" height="19">&nbsp;</td>
                          <td width="72%" align="center" bgcolor="#6F57A4" height="19">&nbsp;</td>
                        </tr>
                        <tr>
                          <td width="100%" align="center" colspan="2" height="27">
                          <input type="submit" value="Post Now..!" name="B1">&nbsp;&nbsp;&nbsp;
                          <input type="submit" value="Clear" name="B2"></td>
                        </tr>
                        <tr>
                          <td width="100%" align="center" colspan="2" height="19">
                          <b><font face="Tahoma" size="2" color="#FF0000">* For 
                          each new item post we charge RM 2.00 and for each 
                          successful bid </font></b>
                          <p>
                          <b><font face="Tahoma" size="2" color="#FF0000">we 
                          charge 2% on final value</font></b></td>
                        </tr>
                      </table>
                      </center>
                    </div>
                    </td>
                  </tr>
                  </table>
                </form>
                </center>
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
  </center>
</div>
</body>
</html>