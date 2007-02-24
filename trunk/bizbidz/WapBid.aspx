<%@ Page Language="vb" AutoEventWireup="false" Codebehind="WapBid.aspx.vb" Inherits="WapAuction.WapBid" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<HEAD>
	<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
	<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
</HEAD>
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:Form id="Form1" runat="server" title="Enter Your Bid" Wrapping="NoWrap">
		<P>Item ID 
<mobile:Label id="lblItemNo" runat="server" Font-Bold="True" Alignment="Left">Label</mobile:Label>Title 
<mobile:Label id="lblTitle" runat="server" Font-Bold="True" Alignment="Left">Label</mobile:Label>Seller 
<mobile:Label id="lblSeller" runat="server" Font-Bold="True" Alignment="Left">Label</mobile:Label>Current 
Bid 
<mobile:Label id="lblCBid" runat="server" Font-Bold="True" Alignment="Left">Label</mobile:Label></P>
		<P>UserId 
<mobile:TextBox id="txtUserId" runat="server"></mobile:TextBox></P>
		<P>Password 
<mobile:TextBox id="txtPWord" runat="server" Password="True"></mobile:TextBox></P>
		<P>Your Bid (RM) 
<mobile:TextBox id="txtBid" runat="server" Numeric="True"></mobile:TextBox></P>
		<P>
			<mobile:Command id="Command1" runat="server" Alignment="Center">   Bid   </mobile:Command>
		</P>
	</mobile:Form>
</body>
