<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CroscoCBC._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
            <asp:TextBox ID="t11" runat="server"  />
            <asp:TextBox ID="t22" runat="server"  />
            <asp:Button ID="btnSave" Text="Save" runat="server" />
        </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="http://cdn.jsdelivr.net/json2/0.1/json2.js"></script>
    <script>
        $(function () {
            $("[id*=btnSave]").bind("click", function () {
                var user = {};
                user.Ime = $("[id*=t11]").val();
                user.Prezime = $("[id*=t22]").val();
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/SaveUser",
                    data: '{user: ' + JSON.stringify(user) + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("User has been added successfully.");
                        window.location.reload();
                    }
                });
                return false;
            });
        });
    </script>
    

    <script src="Scripts/jquery-1.12.4.js"></script>
    <script src="Scripts/jquery.dataTables.min.js"></script>
    <script src="Scripts/dataTables.bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/dataTables.bootstrap.min.css" rel="stylesheet" />
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
    <link href="Content/datatables.css" rel="stylesheet" />
    <link href="Content/datatables.min.css" rel="stylesheet" />

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
    

    <%--<link  href="../Jquery/jquery.multiselect.css" rel="stylesheet"/>
    <link  href="../Jquery/style.css" rel="stylesheet" />
    <link  href="../Jquery/prettify.css" rel="stylesheet" />
    <script  src="../Jquery/jquery.multiselect.js"></script>
    <script  src="../Jquery/prettify.js"></script>--%>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
   <%-- <link rel="stylesheet" href="//resources/demos/style.css"/>--%>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
            <input id="addRow" type="button" value="add" />
            <input id="DeleteRow" type="button" value="Delete" onclick="deleteRow();" />
            <input id="create-user" type="button" value="Edit" />
            <input id="insertbtm" type="button" value="Insert" onclick="insret();" />
            <input id="displaybtm" type="button" value="Display" onclick="display();" />
            <input id="updatebtm" type="button" value="Update" onclick="updateRow();" />
                        
        <asp:Panel ID="Panel2" ClientIDMode="Static" runat="server">
            
        </asp:Panel>
        </div>
         <div id="dddd1">
        </div>
        <script>
            $(document).ready(function () {
                $('#mytb1').DataTable({
                    select: true                
                } );

                var table1 = $('#mytb1').DataTable();
                var redid1 = [];
                $('#mytb1 tbody').on('click', 'tr', function () {
                    var data = table1.row(this).data();
                    
                    //var redid;
                    //if (data[0] == undefined) {
                    //    redid = redid1[0]; 
                    //}
                    //else {
                    //    redid1.shift();
                    //    redid1.push(data[0]);
                    //    redid = redid1[0];
                    //    var i = redid.length;
                    //    i = i-13;
                    //    redid = redid.substr(6, i);
                    //}
                    
                   
                    //getcolid(redid);
                    if ($(this).hasClass('selected') ) {
                        $(this).removeClass('selected');
                    }
                    else {
                        table1.$('tr.selected').removeClass('selected');
                        $(this).addClass('selected');
                    }
                } );
 
                $('#DeleteRow').click( function () {
                    table1.row('.selected').remove().draw(false);
                    var thisro = getcolid();
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.open('Get', 'InsertPage.aspx?id=' + thisro + '&opr=delete', false);
                    xmlhttp.send(null);
                    redid = "";
                });

                var t = $('#mytb1').DataTable();
                var counter = 1;
 
                $('#addRow').on( 'click', function () {
                    t.row.add( [
                        counter +'.1',
                        counter +'.2',
                        counter +'.3',
                        counter +'.4',
                        counter + '.5',
                        counter +'.6'
                    ] ).draw( false );
 
                    counter++;
                });
                
 
            // Automatically add a first row of data
            //$('#addRow').click();

                //var table1 = $('#mytb1').DataTable();
                //$('#mytb1 tbody').on( 'click', 'td', function () {
                //    alert( table1.cell( this ).data() );
                //});
                $(document).on('click', '#mytb1 td', function () {
                    var html = $(this).text()
                    var input = $('<input type="text" />');
                    input.val(html);
                    $(this).replaceWith(input);
                    $('#mytb1 input').focus();
                });
                var table2 = $('#mytb1').DataTable();
                $('#mytb1 tbody').on('click', 'td', function () {
                    var idx = table2.cell(this).index().column;
                    var title = table2.column(idx).header();
                    var colhed1 = [];
                    var colhed;
                    var provjera = $(title).html();
                    if (provjera == undefined) {
                        colhed = colhed1[0];
                    }
                    else {
                        colhed1.shift();
                        colhed1.push(provjera);
                        colhed = colhed1[0];
                    }
                    
                    getcolhed(colhed);
                    //alert('Column title clicked on: ' + $(title).html());
                    //alert( 'REd title clicked on: '+ idx );
                });
                
                $('#mytb1 tbody').on('click', 'tr', function () {
                    var data = table2.row(this).data();
                    //alert(data[0]);
                    var redid1 = [];
                    var redid;
                    if (data[0] == undefined) {
                        redid = redid1[0]; 
                    }
                    else {
                        redid1.push(data[0]);
                        redid = redid1[0];
                        var i = redid.length;
                        i = i-13;
                        redid = redid.substr(6, i);
                    }
                    
                   
                    getcolid(redid);
                    //alert(redid);
                    //var xmlhttp = new XMLHttpRequest();
                    //xmlhttp.open('Get', 'InsertPage.aspx?id=' + redid + '&ched='+ colheadder + '&newva='+ newValueup + '&opr=update', false);
                    //xmlhttp.send(null);
                    //redid = "";
                    
                    
                    //display();
                    //window.location.reload();
                });
                var yhed1 = [];
                var yhed;
                function getcolhed(val)
                {
                    //var yhed1 = [];
                    //var yhed;
                    if (val == undefined) {
                        yhed = yhed1[0];
                        //alert(yhed);
                        return yhed;
                    }
                    else {
                        yhed1.shift();
                        yhed1.push(val);
                        yhed = yhed1[0];
                        //alert(yhed);
                        return yhed;
                    }
                }
                var xhed1 = [];
                var xhed; 
                function getcolid(val1)
                {
                    if (val1 == undefined) {
                        xhed = xhed1[0];
                        //alert(xhed);
                        return xhed;
                    }
                    else {
                        xhed1.shift();
                        xhed1.push(val1);
                        xhed = xhed1[0];
                        //alert(xhed);
                        return xhed;
                    }
                    
                }
                var newValuup1 = [];
                var newValuup;
                $(document).on('blur', '#mytb1 input', function(){
                    $(this).replaceWith('<td class="asset_value"><span>' + this.value + '</span></td>')
                    var provjera1 = this.value;
                    if (provjera1 == undefined) {
                        newValuup = newValuup1[0];
                    }
                    else {
                        newValuup1.shift();
                        newValuup1.push(provjera1);
                        newValuup = newValuup1[0];
                    }

                    
                    var thiscol = getcolhed();
                    var thisro = getcolid();

                    //alert(newValueup);
                    //alert(thiscol);
                    //alert(thisro);
                    if (thiscol == "Fun") {

                    }
                    else if (thiscol == "Pozicija_engl") {
                        thiscol = "[Pozicija engl]";
                        var xmlhttp = new XMLHttpRequest();
                        xmlhttp.open('Get', 'InsertPage.aspx?id=' + thisro + '&ched=' + thiscol + '&newva=' + newValuup + '&opr=update', false);
                        xmlhttp.send(null);
                        newValuup = '';
                        thiscol = '';
                        thisro = '';
                    }
                    else if (thiscol == "Kadrovski_broj") {
                        thiscol = "[Kadrovski broj]";
                        if (Number.isInteger(Number(newValuup))) {
                            var xmlhttp = new XMLHttpRequest();
                            xmlhttp.open('Get', 'InsertPage.aspx?id=' + thisro + '&ched=' + thiscol + '&newva=' + newValuup + '&opr=update', false);
                            xmlhttp.send(null);
                            newValuup = '';
                            thiscol = '';
                            thisro = '';

                        }
                        else {

                        }
                    }
                    else {
                        var xmlhttp = new XMLHttpRequest();
                        xmlhttp.open('Get', 'InsertPage.aspx?id=' + thisro + '&ched=' + thiscol + '&newva=' + newValuup + '&opr=update', false);
                        xmlhttp.send(null);
                        newValuup = '';
                        thiscol = '';
                        thisro = '';
                    }
                
                    
                   
                });

                //var selected = [];
                
                //$('#mytb1').DataTable({
                //    "processing": true,
                //    "serverside": true,
                //    "ajax": "/default.aspx",
                //    "rowcallback": function( row, data ) {
                //        if ( $.inarray(data.dt_rowid, selected) !== -1 ) {
                //            $(row).addclass('selected');
                //        }
                //    }
        
                //});
                
                //$('#mytb1 tbody').on('click', 'tr', function () {
                //    //var data = table.row( this ).data();           
                //    //var id = data[0];
                //    var id = this.id;
                //    var index = $.inarray(id, selected);
 
                //    if ( index === -1 ) {
                //        selected.push( id );
                //    } else {
                //        selected.splice( index, 1 );
                //    }
 
                //    $(this).toggleclass('selected');
                //});
                ////var table = $('#mytb1').datatable();
                //$('#DeleteRow').click( function () {
                //    $('#mytb1').DataTable().row('.selected').remove().draw( false );
                //});
            });
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
        
    <%--<script>
      $( function() {
        var dialog, form,
 
          // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
          emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
          name = $( "#name" ),
          email = $( "#email" ),
          password = $( "#password" ),
          allFields = $( [] ).add( name ).add( email ).add( password ),
          tips = $( ".validateTips" );
 
        function updateTips( t ) {
          tips
            .text( t )
            .addClass( "ui-state-highlight" );
          setTimeout(function() {
            tips.removeClass( "ui-state-highlight", 1500 );
          }, 500 );
        }
 
        function checkLength( o, n, min, max ) {
          if ( o.val().length > max || o.val().length < min ) {
            o.addClass( "ui-state-error" );
            updateTips( "Length of " + n + " must be between " +
              min + " and " + max + "." );
            return false;
          } else {
            return true;
          }
        }
 
        function checkRegexp( o, regexp, n ) {
          if ( !( regexp.test( o.val() ) ) ) {
            o.addClass( "ui-state-error" );
            updateTips( n );
            return false;
          } else {
            return true;
          }
        }
 
        function addUser() {
          var valid = true;
          allFields.removeClass( "ui-state-error" );
 
          valid = valid && checkLength( name, "username", 3, 16 );
          valid = valid && checkLength( email, "email", 6, 80 );
          valid = valid && checkLength( password, "password", 5, 16 );
 
          valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
          valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
          valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
 
          if ( valid ) {
            $( "#users tbody" ).append( "<tr>" +
              "<td>" + name.val() + "</td>" +
              "<td>" + email.val() + "</td>" +
              "<td>" + password.val() + "</td>" +
            "</tr>" );
            dialog.dialog( "close" );
          }
          return valid;
        }
 
        dialog = $( "#dialog-form" ).dialog({
          autoOpen: false,
          height: 400,
          width: 350,
          modal: true,
          buttons: {
            "Create an account": addUser,
            Cancel: function() {
              dialog.dialog( "close" );
            }
          },
          close: function() {
            form[ 0 ].reset();
            allFields.removeClass( "ui-state-error" );
          }
        });
 
        form = dialog.find( "form" ).on( "submit", function( event ) {
          event.preventDefault();
          addUser();
        });
 
        $( "#create-user" ).button().on( "click", function() {
          dialog.dialog( "open" );
        });
      } );
    </script>    
         <div id="dialog-form" title="Create new user">
          <p class="validateTips">All form fields are required.</p>
 
            <form>
                <fieldset>
                    <label for="name">Name</label>
                    <input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">

                    <!-- Allow form submission with keyboard without duplicating the dialog button -->
                    <input type="submit" tabindex="-1" style="position: absolute; top: -1000px">
                </fieldset>
            </form>
         </div>
 
 
        <div id="users-contain" class="ui-widget">
            <h1>Existing Users:</h1>
            <table id="users" class="ui-widget ui-widget-content">
                <thead>
                    <tr class="ui-widget-header ">
                        <th style="width: 92px">Name</th>
                        <th>Email</th>
                        <th>Password</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 92px">John Doe</td>
                        <td>john.doe@example.com</td>
                        <td>johndoe1</td>
                    </tr>
                </tbody>
            </table>
        </div>--%>
        
        <script>
            function onSuccessCallBack() {
                var xmlhttp = new XMLHttpRequest();
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                    var resultText = xmlhttp.responseText;
                    document.getElementById("mytb1").innerHTML = xmlhttp.responseText;
                        console.log(resultText.length);
                    $('#mytb1').DataTable();
                    }
                }

            }

            function insret() {
                var name = document.getElementById("t1").value;
                var surname = document.getElementById("t2").value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open('Get', 'InsertPage.aspx?nm=' + name + '&sr=' + surname + '&opr=insert', true);
                xmlhttp.send(null);
                document.getElementById("t1").value = "";
                document.getElementById("t2").value = "";
                display();
                alert("ažurirano");
                //window.location.reload();
            }
            function deleteRow() {
               
                //var table2 = $('#mytb1').DataTable();
     
                //$('#mytb1 tbody').on('click', 'tr', function () {
                //    var data = table2.row(this).data();
                //    alert(data[0]);
                //    var redid = data[0];
                //    var i = redid.length;
                //    i = i-13;
                //    redid = redid.substr(6, i);
                
                    
                //var xmlhttp = new XMLHttpRequest();
                //xmlhttp.open('Get', 'InsertPage.aspx?id=' + redid + '&opr=delete', false);
                //xmlhttp.send(null);
                //redid = "";
                
                alert("izbrisano");
                //display();
                //window.location.reload();
            //} );
            }
            //function updateRow() {
                
            //    var trst = document.getElementsByClassName('selected').value;
            //    alert(trst);
            //    var table2 = $('#mytb1').DataTable();
            //    $('#mytb1 tbody').on( 'click', 'td', function () {
            //        var idx = table2.cell( this ).index().column;
            //        var title = table2.column( idx ).header();
 
            //        alert('Column title clicked on: ' + $(title).html());
            //        alert( 'REd title clicked on: '+ idx );
                
            //    $('#mytb1 tbody').on('click', 'tr', function () {
            //        var data = table2.row(this).data();
            //        var colheadder = $(title).html();
            //        alert(data[0]);
            //         alert(colheadder);
            //        var redid = data[0];
            //        var i = redid.length;
            //        i = i-13;
            //        redid = redid.substr(6, i);
            //        alert(redid);

                    
            //        var xmlhttp = new XMLHttpRequest();
            //        xmlhttp.open('Get', 'InsertPage.aspx?id=' + redid + '&ched='+ colheadder + '&opr=update', false);
            //        xmlhttp.send(null);
            //        redid = "";
                
            //        alert("izbrisano");
            //        //display();
            //        //window.location.reload();
            //        });
            //    } );
            //}
            function display() {

                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open('Get', 'InsertPage.aspx?opr=display', false);
                //xmlhttp.onreadystatechange = onSuccessCallBack;
                xmlhttp.send(null);
                //document.getElementById("Panel2").value = xmlhttp.responseText;
                //var tablica = document.getElementById("Panel2").value;
                //var tablica = $('#Panel2').value;
                //tablica= xmlhttp.responseText;
                //document.getElementById("mytb1").innerHTML = xmlhttp.responseText;
                    
                if (xmlhttp.readyState == 4) {
                    if (xmlhttp.status == 200) {
                        var resultText = xmlhttp.responseText;
                        document.getElementById("mytb1").innerHTML = xmlhttp.responseText;
                        if ($.fn.DataTable.isDataTable("#mytb1")) {
                            $('#mytb1').DataTable().clear().destroy();
                            $('#mytb1').DataTable({
                                select: true                
                            } );
                        }

                        //$('#mytb1').DataTable();
                        //$('#mytb1').DataTable().clear().destroy();

                        //$('#mytb1').DataTable().fnDestroy();
                            
                    }
                }
                //document.getElementById("dddd1").value = xmlhttp.responseText;

            } 
        </script>
       
            <div>
                <input type="text" id="t1" />
                <input type="text" id="t2" />
                               
            </div>
        <input id="pota" type="button" value="Potablice" onclick="potablicu();" />
        
        <%--<script>
        function potablicu() {
            $.ajax({
                type: "POST",
                url: "InsertPage.aspx",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.responseText);
                    
                },
                error: function (response) {
                    alert(response.responseText);
                    
                }
            });
        };
 
        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var CBC = xml.find("CROSCO_CBC");
            var table = $("#dvCBC table").eq(0).clone(true);
            $("#dvCBC table").eq(0).remove();
            $(CBC).each(function () {
                $(".ID", table).html($(this).find("ID").text());
                $(".column1", table).html($(this).find("column1").text());
                $(".Ime", table).html($(this).find("Ime").text());
                $(".Prezime", table).html($(this).find("Prezime").text());
                $(".Pozicija", table).html($(this).find("Pozicija").text());
                $(".Pozicija_engl", table).html($(this).find("Pozicija_engl").text());
                $("#dvCBC").append(table).append("<br />");
                table = $("#dvCBC table").eq(0).clone(true);
            });
        }
        </script>
               
         <div id = "dvCBC">
            <table border="1">
            <tr>
                <th>
                </th>
            </tr>
            <tr>
                <td>
                    <b><u><span class="ID"></span></u></b>
                    <b><u><span class="column1"></span></u></b>
                    <b><u><span class="Ime"></span></u></b>
                    <b><u><span class="Prezime"></span></u></b>
                    <b><u><span class="Pozicija"></span></u></b>
                    <b><u><span class="Pozicija_engl"></span></u></b>
                </td>
            </tr>
        </table>
    
        </div> --%>   
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
