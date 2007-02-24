<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Search.aspx.vb" Inherits="WapAuction.Search" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<HEAD>
	<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
	<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
</HEAD>
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:Form id="Form1" runat="server" title="Bizbidz Search" Action="finder.aspx" Method="Get">
		<P>
			<mobile:Label id="Label1" runat="server" Font-Name="Arial" Font-Size="Normal">Item Title</mobile:Label>
			<mobile:TextBox id="TextBox1" runat="server" MaxLength="10"></mobile:TextBox>
		</P>
		<P>&nbsp; 
<mobile:Command id="Command1" runat="server" Alignment="Center" Font-Name="Arial">Search</mobile:Command></P>
	</mobile:Form>
</body>
