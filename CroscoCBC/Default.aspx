﻿<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CroscoCBC._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="Scripts/jquery-1.12.4.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/dataTables.bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/dataTables.bootstrap.min.css" rel="stylesheet" />
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
    <link href="Content/datatables.css" rel="stylesheet" />
    <link href="Content/datatables.min.css" rel="stylesheet" />

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
    
    <script src="Scripts/datatables.js"></script>
    <script src="Scripts/datatables.min.js"></script>
<%--<script src="https://npmcdn.com/react-bootstrap-table/dist/react-bootstrap-table.min.js"></script>
    <link rel="stylesheet" href="https://npmcdn.com/react-bootstrap-table/dist/react-bootstrap-table-all.min.css" />
    <script>
        var React = require('react');
        var ReactDOM = require('react-dom');
        var ReactBsTable  = require('react-bootstrap-table');
        var BootstrapTable = ReactBsTable.BootstrapTable;
        var TableHeaderColumn = ReactBsTable.TableHeaderColumn;

        var products = [{
              id: 1,
              name: "Product1",
              price: 120
          }, {
              id: 2,
              name: "Product2",
              price: 80
          }];

        ReactDOM.render(
          <BootstrapTable data={products} striped hover>
              <TableHeaderColumn isKey dataField='id'>Product ID</TableHeaderColumn>
              <TableHeaderColumn dataField='name'>Product Name</TableHeaderColumn>
              <TableHeaderColumn dataField='price'>Product Price</TableHeaderColumn>
          </BootstrapTable>,
          document.getElementById('basic')
        );
    </script>--%>

    <div class="jumbotron">
        <div>
        <asp:Panel ID="Panel2" runat="server">
            
        </asp:Panel>
        </div>
        <script>
            $(document).ready(function() {
                $('#mytb1').DataTable();
            } );
        </script>
        <%--<script>
            $(document).ready(function() {
                $('#mytb1').DataTable( {
                    'lengthMenu': [[10, 25, 50, , 100, -1], [10, 25, 50, 100, 'All']]
                } );
            } );
        </script>--%>
        <script>
            var table = $('#mytb1').DataTable();
 
            $('#mytb1 tbody').on( 'click', 'td', function () {
                alert( table.cell( this ).data() );
            });
        </script>
        <script>
            $('#mytb1').DataTable( {
                select: true
            } );
        </script>
        <%--pokazuje row<script>
            $(document).ready(function() {
                var table = $('#mytb1').DataTable();
     
                $('#mytb1 tbody').on('click', 'tr', function () {
                    var data = table.row( this ).data();
                    alert( 'You clicked on '+data[0]+'\'s row' );
                } );
            } );
        </script>--%>
 
    <%--<script>
        $("#mytb1").DataTable({
                "processing": true,
                "serverSide": true,
                "ajax": "scripts/ids-arrays.php",
                "rowCallback": function( row, data ) {
                    if ( $.inArray(data.DT_RowId, selected) !== -1 ) {
                        $(row).addClass('selected');
                    }
                }
            });
 
            $('#mytb1 tbody').on('click', 'tr', function () {
                var id = this.id;
                var index = $.inArray(id, selected);
 
                if ( index === -1 ) {
                    selected.push( id );
                } else {
                    selected.splice( index, 1 );
                }
 
                $(this).toggleClass('selected');
            } );
        } );
    </script>--%>
        <iframe id="txtArea1" style="display:none"></iframe>
        <button id="btnExport" onclick="fnExcelReport();"> EXPORT</button>
    <script>
        function fnExcelReport(e) {
            $(".truncatedData").hide();
            $(".completeData").show();
            //alert("Hello! Dawood.");
            var tab_text = "<table border='2px'>";
            var tab_inner = "";
            var textRange; var j = 0;
            tab = document.getElementById('mytb1'); // id of table
            //tab = document.getElementById('rpgridview'); // id of table
            for (j = 0 ; j < tab.rows.length ; j++) {
                tab_inner = tab_inner + "<tr>"
                for (k = 0 ; k < tab.rows[j].cells.length - 1 ; k++) {
                    tab_inner = tab_inner + "<td>" + tab.rows[j].cells[k].innerHTML + "</td>";
                }
                tab_inner = tab_inner + "</tr>";
                //tab_text=tab_text+"</tr>";
            }
            tab_text = tab_text + tab_inner + "</table>";
            //tab_text = tab_text.replace(/<A[^>]*>|<\/A>/gi, "");//remove if u want links in your table
            //tab_text = tab_text.replace(/<img[^>]*>/gi, ""); // remove if u want images in your table
            //tab_text = tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
            var ua = window.navigator.userAgent;
            var msie = ua.indexOf("MSIE ");
            if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) // If Internet Explorer
            {

                txtArea1.document.open("txt/html", "replace");
                txtArea1.document.write(tab_text);
                txtArea1.document.close();
                txtArea1.focus();
                sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");

                document.open("txt/html", "replace");
                document.write(tab_text);
                document.close();

                sa = document.execCommand("SaveAs", true, "Yourfilename.xls");
            }
            else {//other browser 
                var a = document.createElement('a');
                var data_type = 'data:application/vnd.ms-excel';
                var table_div = tab_text;    //Your tab_text   
                var table_html = table_div.replace(/ /g, '%20');
                //alert(table_html)
                a.href = data_type + ', ' + table_html;
                //setting the file name
                a.download = 'exported_table.xls';
                //triggering the function
                a.click();

            }
        
            return (sa);

        }
        $(".truncatedData").show();
        $(".completeData").hide();
            
    </script>    
        
    
    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $( function() {
        $( "#datepicker" ).datepicker();
        } );
    </script>
        <p>Date: <input type="text" id="datepicker"></p>--%>
        
        
        
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a>,</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting Started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
