<%@ Page Language="vb" AutoEventWireup="false" Codebehind="Home.aspx.vb" Inherits="WapAuction.MobileWebForm1" %>
<%@ Register TagPrefix="mobile" Namespace="System.Web.UI.MobileControls" Assembly="System.Web.Mobile" %>
<HEAD>
	<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
	<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/Mobile/Page">
</HEAD>
<body Xmlns:mobile="http://schemas.microsoft.com/Mobile/WebForm">
	<mobile:Form id="Form1" runat="server" title="Welcome BizBidz">
		<mobile:Link id="Link1" runat="server" NavigateUrl="Search.aspx" Alignment="Center">Search by Item</mobile:Link>
		<BR>
		<mobile:Link id="Link2" runat="server" NavigateUrl="category.aspx" Alignment="Center">Browse by Category</mobile:Link>
	</mobile:Form>
</body>
