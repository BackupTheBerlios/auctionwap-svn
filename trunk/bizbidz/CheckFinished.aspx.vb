Imports System.Data.OleDb
Imports System.Web
Public Class CheckFinished
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        Dim Sql As String
        Dim Con As New OleDb.OleDbConnection
        Dim Cmd As OleDb.OleDbCommand
        Dim CmdBid, CmdUser As OleDb.OleDbCommand
        Dim Dr, DrBid, DrUser As OleDb.OleDbDataReader
        Sql = "Select Itemid, cbid, Title from items where DateDiff('h',Date(),DateAdd('d',items.duration,items.SDt)) <= 0 and finished = false order by itemid"
        Con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Auction.mdb") & ";Persist Security Info=False"
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        While Dr.Read()
            If Con.State = ConnectionState.Open Then
                Con.Close()
            End If
            Con.Open()
            Sql = "Select * from bid where ItemId=" & Dr.GetValue(0) & " and Amount=" & Dr.GetValue(1)
            CmdBid = New OleDbCommand(Sql, Con)
            DrBid = CmdBid.ExecuteReader

            Dim UserId As String
            If DrBid.HasRows Then
                DrBid.Read()
                UserId = DrBid.GetValue(2)
            End If

            If Con.State = ConnectionState.Open Then
                Con.Close()
            End If
            Con.Open()
            Sql = "Select * from users where userid='" & UserId & "'"
            CmdUser = New OleDbCommand(Sql, Con)
            DrUser = CmdUser.ExecuteReader
            Dim Email As New System.Web.Mail.MailMessage
            DrUser.Read()
            Email.To = DrUser.GetValue(2)
            Email.From = "BizBidzAuction"
            Email.Body = ""
        End While
    End Sub
End Class
