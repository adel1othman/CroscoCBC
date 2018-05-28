Imports System.Data.SqlClient
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.Services
Imports System.Web.Script.Services
Partial Public Class InsertPage
    Inherits System.Web.UI.Page


    Dim constr As String = System.Configuration.ConfigurationManager.ConnectionStrings("CROSCO_CBC_DataBazeConnectionString").ConnectionString
    Dim Ime, Prezime, kadr, opr As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        opr = Request.QueryString("opr").ToString()
        Dim RowId, columhed, newValu1 As String
        If opr = "insert" Then
            If (Not Request.QueryString("nm") Is Nothing) Then
                Ime = Request.QueryString("nm").ToString()
            Else
                MsgBox("nema")
            End If
            'If Not Me.IsPostBack Then
            'Ime = Request.QueryString("nm").ToString()
            Prezime = Request.QueryString("sr").ToString()
            kadr = Request.QueryString("kdr").ToString()
            'Ime = Request.QueryString("nm").ToString()
            Dim comstrin As String
            'comstrin = "Insert into CROSCO_CBC values ('" & Ime.ToString() & "','" & Prezime.ToString() & "')"
            comstrin = "Insert into CROSCO_CBC (IME,Prezime,[Kadrovski broj]) VALUES ('" & Ime.ToString() & "','" & Prezime.ToString() & "','" & Convert.ToInt32(kadr.ToString()) & "')"
            MsgBox(comstrin)
            Dim con As New SqlConnection(constr)
            Dim cmd As New SqlCommand
            con.Open()
            cmd = con.CreateCommand()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = comstrin
            cmd.ExecuteNonQuery()

            con.Close()
            'End If

        ElseIf opr = "display" Then
            Dim dt As DataTable = Me.GetData()

            'Building an HTML string.
            'Dim html As New StringBuilder()

            'Table start.
            'html.Append("<table id='mytb1' border = '1' cellspacing='1' class='tablesorter'>")
            ' html.Append("<table id='mytb1' Class='table table-striped table-bordered' style='width:100%'>")
            Response.Write("<table id='mytb1' class='table table-striped table-bordered dataTable no-footer' style='width:100%' role='grid' aria-describedby='mytb1_info'>")

            'Building the Header row.
            'html.Append("<thead>")
            Response.Write("<thead>")
            'html.Append("<tr>")
            Response.Write("<tr role='row'>")
            Dim i As Integer = 0
            For Each column As DataColumn In dt.Columns

                Dim stri As String
                stri = "<th style='cursor: pointer'>"
                'stri = "<th onclick='sortTable(" & i & ")'>"



                'stri = "<th onclick="
                'stri = stri & "w3.sortHTML("
                'stri = stri & "'" & "#tb1" & "','.item'," & "'td:nth-child(" & i & ")')' " & "style='cursor:pointer'>"
                'html.Append(stri)
                Response.Write(stri)
                i = i + 1
                'html.Append(column.ColumnName)
                Dim textToPass As String = column.ColumnName.ToString()
                Response.Write(textToPass)
                MsgBox(textToPass)
                'html.Append("</th>")
                Response.Write("</th>")
            Next
            Response.Write("<th style='cursor:pointer'>")
            Response.Write("Fun")
            Response.Write("</th>")
            'html.Append("</tr>")
            Response.Write("</tr>")
            'html.Append("</thead>")
            Response.Write("</thead>")
            'html.Append("<tbody id='myTable'>")
            'Building the Data rows.
            For Each row As DataRow In dt.Rows
                'html.Append("<tr class='item'>")
                Response.Write("<tr class='item'>")
                For Each column As DataColumn In dt.Columns
                    'html.Append("<td Class='txtBox'>")
                    Response.Write("<td Class='txtBox'>")
                    'html.Append("<span>")
                    Response.Write("<span>")
                    'html.Append(row(column.ColumnName))

                    Dim test As String = row(column.ColumnName).ToString()
                    Response.Write(test)
                    'MsgBox(test)
                    Response.Write("</span>")
                    'html.Append("</td>")
                    Response.Write("</td>")
                Next
                'html.Append("</tr>")
                Response.Write("<td Class='btn'>")
                Response.Write("<input type='button' value='Delete' onclick='deleteRow();' />")
                Response.Write("</td>")
                Response.Write("</tr>")
            Next
            'html.Append("</tbody>")
            'Table end.
            Response.Write("</table>")
        ElseIf opr = "delete" Then
            RowId = Request.QueryString("id").ToString()

            Dim comstrin As String
            comstrin = "DELETE FROM CROSCO_CBC WHERE ID =" & RowId
            MsgBox(comstrin)
            Dim con As New SqlConnection(constr)
            Dim cmd As New SqlCommand
            con.Open()
            cmd = con.CreateCommand()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = comstrin
            cmd.ExecuteNonQuery()

            con.Close()
        ElseIf opr = "update" Then
            Dim comstring As String
            RowId = Request.QueryString("id").ToString()
            newValu1 = Request.QueryString("newva").ToString()
            columhed = Request.QueryString("ched").ToString()

            comstring = "UPDATE CROSCO_CBC SET " & columhed & " = '" & newValu1 & "' WHERE ID = " & RowId
            'script za rename column name sp_rename "dbo.CROSCO_CBC.Kadr#br#", "Kadrovski broj", 'COLUMN';
            'MsgBox(comstring & " " & RowId & " " & columhed & " " & newValu1)


            Dim con As New SqlConnection(constr)
            Dim cmd As New SqlCommand
            con.Open()
            cmd = con.CreateCommand()
            cmd.CommandType = CommandType.Text
            cmd.CommandText = comstring
            cmd.ExecuteNonQuery()

            con.Close()


        End If
    End Sub
    Private Function GetData() As DataTable
        Dim constr As String = System.Configuration.ConfigurationManager.ConnectionStrings("CROSCO_CBC_DataBazeConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Select [ID], [Kadrovski broj] AS Kadrovski_broj, [Ime], [Prezime], [Pozicija], [Pozicija engl] AS Pozicija_engl FROM [CROSCO_CBC]")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        sda.Fill(dt)
                        Return dt
                    End Using
                End Using
            End Using
        End Using
    End Function
    <WebMethod()>
    Public Shared Function GetCROSCO_CBC() As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("CROSCO_CBC_DataBazeConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Select [ID], [Kadr#br#] AS column1, [Ime], [Prezime], [Pozicija], [Pozicija engl] AS Pozicija_engl FROM [CROSCO_CBC]")
                cmd.Connection = con
                Dim ds As New DataSet()
                Using sda As New SqlDataAdapter(cmd)
                    sda.Fill(ds, "CROSCO_CBC")
                End Using
                Return ds.GetXml()
            End Using
        End Using
    End Function
    Private Sub Spremi1()
        Dim ds As New DataSet()

        Dim dt As DataTable = Me.GetData()
        For Each column As DataColumn In dt.Columns
            dt.Columns.Add("Name", GetType(String))
            dt.Columns.Add("Age", GetType(String))
            dt.Columns.Add("Org", GetType(String))
        Next

        Dim dr As DataRow
        For i As Integer = 0 To 10
            dr = dt.NewRow()
            dr(0) = "Name" + i.ToString()
            dr(1) = "Age" + i.ToString()
            dr(2) = "Org" + i.ToString()
            dt.Rows.Add(dr)
        Next
        ds.Tables.Add(dt)
        Response.Write(ds.GetXml())
    End Sub


End Class

Public Class CBC
    Public Property Ime() As String
        Get
            Return _Ime
        End Get
        Set(value As String)
            _Ime = value
        End Set
    End Property
    Private _Ime As String
    Public Property Prezime() As String
        Get
            Return _Prezime
        End Get
        Set(value As String)
            _Prezime = value
        End Set
    End Property
    Private _Prezime As String
End Class



