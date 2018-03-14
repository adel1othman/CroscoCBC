Imports System.Data.SqlClient
Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            'Populating a DataTable from database.
            Dim dt As DataTable = Me.GetData()

            'Building an HTML string.
            Dim html As New StringBuilder()

            'Table start.
            'html.Append("<table id='mytb1' border = '1' cellspacing='1' class='tablesorter'>")
            html.Append("<table id='mytb1' Class='table table-striped table-bordered' style='width:100%'>")
            'Building the Header row.
            html.Append("<thead>")
            html.Append("<tr>")
            Dim i As Integer = 0
            For Each column As DataColumn In dt.Columns

                Dim stri As String
                stri = "<th style='cursor:pointer'>"
                'stri = "<th onclick='sortTable(" & i & ")'>"



                'stri = "<th onclick="
                'stri = stri & "w3.sortHTML("
                'stri = stri & "'" & "#tb1" & "','.item'," & "'td:nth-child(" & i & ")')' " & "style='cursor:pointer'>"
                html.Append(stri)
                i = i + 1
                html.Append(column.ColumnName)
                html.Append("</th>")
            Next
            html.Append("</tr>")
            html.Append("</thead>")
            'html.Append("<tbody id='myTable'>")
            'Building the Data rows.
            For Each row As DataRow In dt.Rows
                html.Append("<tr class='item'>")
                For Each column As DataColumn In dt.Columns
                    html.Append("<td>")
                    html.Append(row(column.ColumnName))
                    html.Append("</td>")
                Next
                html.Append("</tr>")

            Next
            'html.Append("</tbody>")
            'Table end.
            html.Append("</table>")


            'Append the HTML string to Placeholder.
            Panel2.Controls.Add(New Literal() With {
          .Text = html.ToString()
          })

        End If
    End Sub

    Private Function GetData() As DataTable
        Dim constr As String = System.Configuration.ConfigurationManager.ConnectionStrings("CROSCO_CBC_DataBazeConnectionString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Select [ID], [Kadr#br#] AS column1, [Ime], [Prezime], [Pozicija], [Pozicija engl] AS Pozicija_engl FROM [CROSCO_CBC]")
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
    'Protected Sub ExportToExcel(sender As Object, e As EventArgs)
    '    Response.Clear()
    '    Response.Buffer = True
    '    Response.AddHeader("content-disposition", "attachment;filename=HTML.xls")
    '    Response.Charset = ""
    '    Response.ContentType = "application/vnd.ms-excel"
    '    Response.Output.Write(Request.Form(hfGridHtml.UniqueID))
    '    Response.Flush()
    '    Response.End()
    'End Sub

End Class