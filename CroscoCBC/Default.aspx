<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CroscoCBC._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
    <link href="http://mottie.github.io/tablesorter/css/theme.default.css" rel="stylesheet">
     
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
    
        <script>
            $(function(){
                $("#mytb1").tablesorter({ widgets: ['zebra'] });
            });
        </script>
        
        
        <p>Search for a name in the input field:</p>

        <p><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." /></p>
  
        <div class="table-responsive">
        <asp:Panel ID="Panel2" runat="server">
            
        </asp:Panel>
            <script>
                $.fn.pageMe = function (opts) {
                    var $this = this,
                        defaults = {
                            perPage: 7,
                            showPrevNext: false,
                            hidePageNumbers: false
                        },
                        settings = $.extend(defaults, opts);

                    var listElement = $this;
                    var perPage = settings.perPage;
                    var children = listElement.children();
                    var pager = $('.pager');

                    if (typeof settings.childSelector != "undefined") {
                        children = listElement.find(settings.childSelector);
                    }

                    if (typeof settings.pagerSelector != "undefined") {
                        pager = $(settings.pagerSelector);
                    }

                    var numItems = children.size();
                    var numPages = Math.ceil(numItems / perPage);

                    pager.data("curr", 0);

                    if (settings.showPrevNext) {
                        $('<li><a href="#" class="prev_link">«</a></li>').appendTo(pager);
                    }

                    var curr = 0;
                    while (numPages > curr && (settings.hidePageNumbers == false)) {
                        $('<li><a href="#" class="page_link">' + (curr + 1) + '</a></li>').appendTo(pager);
                        curr++;
                    }

                    if (settings.showPrevNext) {
                        $('<li><a href="#" class="next_link">»</a></li>').appendTo(pager);
                    }

                    pager.find('.page_link:first').addClass('active');
                    pager.find('.prev_link').hide();
                    if (numPages <= 1) {
                        pager.find('.next_link').hide();
                    }
                    pager.children().eq(1).addClass("active");

                    children.hide();
                    children.slice(0, perPage).show();

                    pager.find('li .page_link').click(function () {
                        var clickedPage = $(this).html().valueOf() - 1;
                        goTo(clickedPage, perPage);
                        return false;
                    });
                    pager.find('li .prev_link').click(function () {
                        previous();
                        return false;
                    });
                    pager.find('li .next_link').click(function () {
                        next();
                        return false;
                    });

                    function previous() {
                        var goToPage = parseInt(pager.data("curr")) - 1;
                        goTo(goToPage);
                    }

                    function next() {
                        goToPage = parseInt(pager.data("curr")) + 1;
                        goTo(goToPage);
                    }

                    function goTo(page) {
                        var startAt = page * perPage,
                            endOn = startAt + perPage;

                        children.css('display', 'none').slice(startAt, endOn).show();

                        if (page >= 1) {
                            pager.find('.prev_link').show();
                        }
                        else {
                            pager.find('.prev_link').hide();
                        }

                        if (page < (numPages - 1)) {
                            pager.find('.next_link').show();
                        }
                        else {
                            pager.find('.next_link').hide();
                        }

                        pager.data("curr", page);
                        pager.children().removeClass("active");
                        pager.children().eq(page + 1).addClass("active");

                    }
                };

                $(document).ready(function () {

                    $('#myTable').pageMe({ pagerSelector: '#myPager', showPrevNext: true, hidePageNumbers: false, perPage: 10 });

                });

            </script>
            <script>
                    $(document).ready(function() 
                    { 
                        $("#myTable").tablesorter();
                    } 
                ); 
                </script>
            <script>
                function myFunction() {
                  var input, filter, table, tr, td, i;
                  input = document.getElementById("myInput");
                  filter = input.value.toUpperCase();
                  table = document.getElementById("myTable");
                  tr = table.getElementsByTagName("tr");
                  for (i = 0; i < tr.length; i++) {
                      td0 = tr[i].getElementsByTagName("td")[0];
                      td1 = tr[i].getElementsByTagName("td")[1];
                      td2 = tr[i].getElementsByTagName("td")[2];
                      td3 = tr[i].getElementsByTagName("td")[3];
                      td4 = tr[i].getElementsByTagName("td")[4];
                      td5 = tr[i].getElementsByTagName("td")[5];
                      if (td0.innerHTML.toUpperCase().indexOf(filter) > -1) {
                          tr[i].style.display = "table-row";
                          }else if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
                          tr[i].style.display = "table-row";
                          }else if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
                          tr[i].style.display = "table-row";
                          }else if (td3.innerHTML.toUpperCase().indexOf(filter) > -1) {
                          tr[i].style.display = "table-row";
                          }else if (td4.innerHTML.toUpperCase().indexOf(filter) > -1) {
                          tr[i].style.display = "table-row";
                          }else if (td5.innerHTML.toUpperCase().indexOf(filter) > -1) {
                          tr[i].style.display = "table-row";
                          }else {
                          tr[i].style.display = "none";
                          }
                    //  if (td0 || td1 || td2 || td3 || td4 || td5) {
                          
                    //}
                  }
                }
            </script>
           
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
        <div class="col-md-12 text-center">
            <ul class="pagination pagination-lg pager" id="myPager"></ul>
        </div>
        </div>
        <iframe id="txtArea1" style="display:none"></iframe>
        <button id="btnExport" onclick="fnExcelReport();"> EXPORT</button>
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
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
