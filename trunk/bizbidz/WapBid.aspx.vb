Imports System.Data.OleDb
Public Class WapBid
    Inherits System.Web.UI.MobileControls.MobilePage

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Command1 As System.Web.UI.MobileControls.Command
    Protected WithEvents lblTitle As System.Web.UI.MobileControls.Label
    Protected WithEvents lblSeller As System.Web.UI.MobileControls.Label
    Protected WithEvents lblCBid As System.Web.UI.MobileControls.Label
    Protected WithEvents txtUserId As System.Web.UI.MobileControls.TextBox
    Protected WithEvents txtPWord As System.Web.UI.MobileControls.TextBox
    Protected WithEvents txtBid As System.Web.UI.MobileControls.TextBox
    Protected WithEvents lblItemNo As System.Web.UI.MobileControls.Label
    Protected WithEvents Form1 As System.Web.UI.MobileControls.Form

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
        Dim Dr As OleDb.OleDbDataReader
        Dim ItemID As Integer
        ItemID = Integer.Parse(Request.QueryString.Get("itemid"))
        Con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Auction.mdb") & ";Persist Security Info=False"
        Sql = "Select * from Items where Itemid=" & ItemID
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        Dr.Read()
        lblItemNo.Text = Dr.GetValue(0)
        lblTitle.Text = Dr.GetValue(3)
        lblSeller.Text = Dr.GetValue(1)
        lblCBid.Text = Dr.GetValue(13)
    End Sub

    Private Sub Form1_Activate(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Form1.Activate

    End Sub

    Private Sub Command1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Command1.Click
        Dim Sql As String
        Dim Con As New OleDb.OleDbConnection
        Dim Cmd As OleDb.OleDbCommand
        Dim Dr As OleDb.OleDbDataReader
        Con.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Auction.mdb") & ";Persist Security Info=False"
        Sql = "Select * from Users where ucase(userid)='" & UCase(txtUserId.Text) & "' and password='" & txtPWord.Text & "'"
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        If Not Dr.HasRows() Then
            Response.Write("Invalid UserName or Password")
            Response.End()
        End If
        Sql = "Select cbid from items where itemid=" & lblItemNo.Text
        If Con.State = ConnectionState.Open Then
            Con.Close()
        End If
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        Dr.Read()
        Dim Amount As Double = 0
        If txtBid.Text <> "" Then
            Amount = Double.Parse(txtBid.Text)
        End If
        If Dr.GetValue(0) >= Amount Then
            Response.Write("Invalid Bid amount")
            Response.End()
        End If
        Sql = "Select max(bid) from bids"
        If Con.State = ConnectionState.Open Then
            Con.Close()
        End If
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Dr = Cmd.ExecuteReader
        Dim bid As Integer
        If Dr.Read Then
            bid = Dr.GetValue(0) + 1
        Else
            bid = 1
        End If
        Sql = "Insert into bids values(" & bid & "," & lblItemNo.Text & ",'" & txtUserId.Text & "'," & Amount & ")"
        If Con.State = ConnectionState.Open Then
            Con.Close()
        End If
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Cmd.ExecuteNonQuery()
        Sql = "Update Items set cbid=" & Amount & ", noofbids=noofbids+1 where Itemid=" & lblItemNo.Text
        If Con.State = ConnectionState.Open Then
            Con.Close()
        End If
        Con.Open()
        Cmd = New OleDbCommand(Sql, Con)
        Cmd.ExecuteNonQuery()

        Response.Write("Your Bid is Successful")
        Response.End()
    End Sub
End Class
