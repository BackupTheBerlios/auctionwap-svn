 <%@ Language=VBScript %>

  <html> 
  <head> 
  <title>Button Form</title> 
  </head> 
  <body> 
  <font face="MS Gothic"> 

  <FORM NAME="Button Example" METHOD="POST" ACTION="button.asp">
  <H3>Computer Programming Experience:</H3> 
  <p>
  <INPUT TYPE="RADIO" NAME= "choice" VALUE="Less than 1"> Less than 1 year.<BR> 
  <INPUT TYPE="RADIO" NAME= "choice" VALUE="1 to 5"> 1-5 years.<BR>
  <INPUT TYPE="RADIO" NAME= "choice" VALUE="More than 5"> More than 5 years.<BR>
  </p> 
  <p>
  <INPUT TYPE="SUBMIT" VALUE="Submit"> 
  <INPUT TYPE="RESET" VALUE="Clear Form">
  </p>
  </form> 
<%
   'Check to see if input has already been entered. 
   dim strChoice
   strChoice = Server.HTMLEncode(Request.Form("choice"))

   If "" = strChoice Then
     Response.Write "<P>(No input yet.)</P>"
   Else
     Response.Write "<P>Your last choice was <B>" & strChoice & "</B></P>"
   End If
  %>

  </font> 
  </body> 
  </html>
