<%@ LANGUAGE = VBSCRIPT %>
<!-- #include file="Connection.asp"-->
<!-- #include file="upload.asp" -->
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<meta name="GENERATOR" content="Microsoft FrontPage 6.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Bizbidz's Registration</title>
</head>
 <% 
	
	dim Uid,Itid
	DIM RSS,rs,rsTemp, fea
	SET RSS=Server.CreateObject("ADODB.Recordset")
	set rs=Server.CreateObject("ADODB.Recordset")
	Set rsTemp=Server.CreateObject("ADODB.Recordset")
	Dim SqlStr, sdt
	dim rst,pay
	uid = session("Uid")
	Dim Upload, fileName, fileSize, ks, i, fileKey,uploadsdirvar
	uploadsdirvar=Server.MapPath("uploads")

    Set Upload = New FreeASPUpload
    Upload.Save(uploadsDirVar)

	Dim fn
	
	ks = Upload.UploadedFiles.keys
	
    if (UBound(ks) <> -1) then
       for each fileKey in Upload.UploadedFiles.keys
           fn = SaveFiles & Upload.UploadedFiles(fileKey).FileName
         next
    end if
	if Upload.Form("FeaturedInFrontPage") <> "" then	
		fea=0
	else
		fea=1
	end if
	
	if Upload.Form("StartWhen") = "V2" then
		sdt= Upload.Form("SMonth") & "/" & Upload.Form("SDay")
		sdt=sdt & "/" & Upload.Form("SYear") & " " & Upload.Form("SHour")
	else
		sdt=Date()
	end if
	set rst=Server.CreateObject("ADODB.Recordset")
	rst.Open "Select max(Itemid) from Items",Con
	if rst.EOF=true then
		itid=1
	else
		itid=rst(0).Value + 1
	end if
	dim rsCat, CatId
	Set rsCat = Server.CreateObject("ADODB.Recordset")
	rsCat.Open "Select CategoryId from Categories where Name='" & Upload.Form("cato")& "'",con
	CatId=rsCat.Fields(0)
	set rst=nothing
	SqlStr="Insert into Items "
	SqlStr=SqlStr & "values(" & itid & ",'" 
	SqlStr=SqlStr & uid & "',"
	SqlStr=SqlStr & CatId & ",'"
	SqlStr=SqlStr & Upload.Form("txtTitle") & "',"
	SqlStr=SqlStr & Upload.Form("txtqty") & ","
	SqlStr=SqlStr & Upload.Form("Price") & ",#"
	SqlStr=SqlStr & sdt & "#,"
	SqlStr=SqlStr & Upload.Form("Duration") & ",'"
	SqlStr=SqlStr & Upload.Form("Condition") & "','"
	SqlStr=SqlStr & Upload.Form("Descp") & "','"
	SqlStr=SqlStr & fn & "',"
	SqlStr=SqlStr & fea & ",0," & Upload.Form("Price") & ",0)"
	'Response.Write SqlStr
	'Response.End
	Con.execute SqlStr
	rs.Open "Select * from categories", Con
%>
<body bgcolor="#473275" topmargin="0" leftmargin="0">
<div align="center">
  <center>
    <table width="37%" height="742" border="3" cellpadding="0" cellspacing="0" bordercolor="#ffffff" id="AutoNumber1" style="BORDER-COLLAPSE: collapse">
      <tr>
        <td width="100%" height="742"> 
          <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="829" id="AutoNumber2" height="570">
            <tr>
          <td width="607" bgcolor="#6f57a4" valign="top" height="460">
          <table border="2" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="128%" id="AutoNumber3" height="690">
                  <tr>
              <td width="21%" bgcolor="#ffffff" height="47">&nbsp;
              </td>
              <td width="79%" bgcolor="#ffffff" height="47">
              <p align="center"><b><font face="Tahoma" size="2" color="#473275"> 
                        <A style="TEXT-DECORATION: none" href="index.asp"> <font color="#473275">Home</font></a> 
                        |</font><font face="Tahoma" size="2" color="#6f57a4"><A style="TEXT-DECORATION: none" href="about.htm" ><font color="#473275">About 
                        us</font></a></font><font face="Tahoma" size="2" color="#473275"> 
                        | <A style="TEXT-DECORATION: none" href="registration.asp"> 
                        <font color="#473275">Registration</font></a> | <A style="TEXT-DECORATION: none" href="PostItem.asp"> 
                        <font color="#473275">Post Item</font></a> | <font color="#473275"> 
                        <A style="TEXT-DECORATION: none" href="my_account.htm" > 
                        <font color="#473275">My Account</font></a> | <A style="TEXT-DECORATION: none" href="forum.htm" > 
                        <font color="#473275">Forums</font></a> |&nbsp;Help | 
                        Feedback</font></A><A style="TEXT-DECORATION: none" href="aaa/contact.htm" ><font color="#473275"> 
                        </font></a> </font></b></p></td>
            </tr>
            <tr>
                    <td width="21%" bgcolor="#ffffff" height="639" valign="top"> 
                      <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" width="100%" id="AutoNumber6">
                        <tr>
                  <td width="100%" bgcolor="#6f57a4" bordercolor="#6f57a4" align="middle"><b><font color="#ffffff" face="Tahoma" size="2">
              B2B Categories</font></b></td>
                </tr>
                <tr>
				<% do while not rs.eof %>
                          <td width="100%" height="39"> <b><u><A href="products.asp?categ=<%=rs(0)%>"><%=rs(1)%> </a></u></b>&nbsp;</td>
                </tr>
			  <%rs.movenext%>
  			   <%loop%>
              </table>
              </td>
                    <td width="79%" bgcolor="#ffffff" height="639" valign="top"> 
                      <div align="center">       <center>
             <form name="frmregister" action="forum.htm" method="post">   
                            <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="598">
                              <tr>
                                <td width="100%" bgcolor="#dfdaeb" height="598" valign="top"> 
                                  <table border="0" cellpadding="0" cellspacing="0" style="BORDER-COLLAPSE: collapse" bordercolor="#473275" width="100%" id="AutoNumber4" height="640">
                                    <tr> 
                                      <td width="100%" bgcolor="#ffffff" height="640" valign="top"> 
                                        <p align="center"><b> <font size="2" face="Tahoma" color="#473275"><br>
                                          &nbsp;</font></b></p>
                                        <p align="center"><b> <font size="2" face="Tahoma" color="#473275"><br>
                                                 
                                              Thank you for Posting 
                                          Item.</font></b></p>
                                        <p align="center"><b> <font face="Tahoma" size="2" color="#473275"> 
                                           <A style="TEXT-DECORATION: none" href="index.asp"> 
                                          <font color="#0000ff">Home</font></a></font></b></p>
                                        <p align="center"> <IMG src="images/bus_student.jpg" border=0></p></td>
                                    </tr>
                                  </table> </td>
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