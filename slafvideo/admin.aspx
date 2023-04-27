<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="slafvideo.admin" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="refresh" content="20">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
        content="SLAF">
    <title>SLAF</title>
    <link href="css/adminlte/css/AdminLTE.min.css" rel="stylesheet" />
    <link href="css/adminlte/css/AdminLTE.css" rel="stylesheet" />
     <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css"> 
    <link href="css/all.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/sidebar-themes.css">
    <link rel="shortcut icon" type="image/png" href="img/favicon.ico" />



    <style>


        .btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}

.btn-circle.btn-xl {
  width: 70px;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border-radius: 35px;
  border-width: thick;
  background-color: darkgrey;
  color: white;
}


/*Image overlay*/

.container_row {
  position: relative;
}

.background-layer {
  position: absolute;
  z-index: 1;
  left: 50px;
  top: 10px;
  height: 50px;
}

.foreground-layer {
  position: absolute;
  z-index: 2;
  left: 0;
  top: 0;
  height: 50px;
}

.btn-lg-overlay {
  width: 300px;
  height: 50px;
  border-color: lightgrey;
  border-width: 5px;
  background-color: darkgray;
}
 *.text-error {color: red !important}
      
    </style>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script> 
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/modernizr-2.6.2.js"></script>
    <script src="js/bootstrap.js"></script>


</head>

<body class="content" >
   
    <form id="form1" runat="server">
   
    <select id="notifmess" class="form-group" style="width:290px;margin-left:10px;height:30px;"></select><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
&nbsp;<div class="box-body" style="width:500px;">
                 <table class="table table-bordered table-striped" id="list_table_json" >
    <thead>
        <tr>
            <th>Name</th>
            <th>ID</th>                  
        </tr>                   
    </thead>
</table>
        </div>


        <%--Math.random().toString(36).slice(2)--%>
  
    <script src="js/main.js"></script>
  <script>

      $('select').on('change', function () {
          //alert(this.value);
          //alert(this.selectedIndex);
          localStorage.setItem('calldataVal', JSON.stringify(this.value));
          localStorage.setItem('calldataIndex', JSON.stringify(this.selectedIndex));
          var dataValue = { "txt": this.value};
          $.ajax({
              url: "gettable.ashx",
              dataType: 'json',
              type: 'get',
              data: dataValue,
              contentType: 'application/json; charset=utf-8',
              success: function (result) {
                  /*console.log(data);*/
                 
                  var event_data = '';
                  $.each(result, function (index, value) {
                      //debugger;
                      var sp1 = document.createElement('span');

                      if (value.status == "1") {
                          sp1.setAttribute("class", "badge badge-pill badge-warning");
                          sp1.appendChild(document.createTextNode("Pending"));
                      }
                      if (value.status == "2") {
                          sp1.setAttribute("class", "badge badge-pill badge-success");
                          sp1.appendChild(document.createTextNode("Connected"));
                      }
                      if (value.status == "3") {
                          sp1.setAttribute("class", "badge badge-pill badge-danger");
                          sp1.appendChild(document.createTextNode("Rejected"));
                      }
                      if (value.status == "4") {
                          sp1.setAttribute("class", "badge badge-pill badge-danger");
                          sp1.appendChild(document.createTextNode("Disconnected"));
                      }
                      sp1.setAttribute("style", "margin-left:10px;");
                      event_data += '<tr>';
                      event_data += '<td>' + value.callerid + '</td>';
                      event_data += '<td >' + sp1.outerHTML + '</td>';
                      event_data += '<td>  <button type="button" class="btn btn-primary" onclick="connect(' + value.cid + ')">Connect</button></td>';
                      event_data += '<td>  <button type="button" class="btn btn-danger" onclick="disconnect(' + value.cid + ')">Disconnect</button></td>';
                      event_data += '</tr>';

                     
                  });
                  $("#list_table_json").html(event_data);
              },
              error: function (d) {
                  /*console.log("error");*/
                  alert("404. Please wait until the File is Loaded.");
              }
          });



      });

      function setSelectedIndex(s,i)
      {
          s.options[i - 1].selected = true;
          return;
      }

 $('document').ready(function () {        
     loadselect();
     
     var keyValue = JSON.parse(localStorage.getItem('calldataVal'));
    
     //alert(keyIndex);
    
          var dataValue = { "txt": keyValue};
          $.ajax({
              url: "gettable.ashx",
              dataType: 'json',
              type: 'get',
              data: dataValue,
              contentType: 'application/json; charset=utf-8',
              success: function (result) {
                  /*console.log(data);*/
                 
                  var event_data = '';
                  $.each(result, function (index, value) {
                      //debugger;
                      var sp1 = document.createElement('span');

                      if (value.status == "1") {
                          sp1.setAttribute("class", "badge badge-pill badge-warning");
                          sp1.appendChild(document.createTextNode("Pending"));
                      }
                      if (value.status == "2") {
                          sp1.setAttribute("class", "badge badge-pill badge-success");
                          sp1.appendChild(document.createTextNode("Connected"));
                      }
                      if (value.status == "3") {
                          sp1.setAttribute("class", "badge badge-pill badge-danger");
                          sp1.appendChild(document.createTextNode("Rejected"));
                      }
                      if (value.status == "4") {
                          sp1.setAttribute("class", "badge badge-pill badge-danger");
                          sp1.appendChild(document.createTextNode("Disconnected"));
                      }
                      sp1.setAttribute("style", "margin-left:10px");
                      event_data += '<tr>';
                      event_data += '<td>' + value.callerid + '</td>';
                      event_data += '<td >' + sp1.outerHTML + '</td>';
                      event_data += '<td>  <button type="button" class="btn btn-primary" onclick="connect(' + value.cid + ')">Connect</button></td>';
                      event_data += '<td>  <button type="button" class="btn btn-danger" onclick="disconnect(' + value.cid + ')">Disconnect</button></td>';
                      event_data += '</tr>';

                     
                  });
                  $("#list_table_json").html(event_data);
              },
              error: function (d) {
                  /*console.log("error");*/
                  //alert("404. Please wait until the File is Loaded.");
              }
          });


        });
        function getlist() {
            //debugger;
            var dataValue = { "txt": $('#notifmess option:selected').val() };
            $.ajax({
                url: "gettable.ashx",
                dataType: 'json',
                type: 'get',
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                success: function (result) {
                    /*console.log(data);*/

                    var event_data = '';
                    $.each(result, function (index, value) {
                        //debugger;
                        var sp1 = document.createElement('span');

                        if (value.status == "1") {
                            sp1.setAttribute("class", "badge badge-pill badge-warning");
                            sp1.appendChild(document.createTextNode("Pending"));
                        }
                        if (value.status == "2") {
                            sp1.setAttribute("class", "badge badge-pill badge-success");
                            sp1.appendChild(document.createTextNode("Connected"));
                        }
                        if (value.status == "3") {
                            sp1.setAttribute("class", "badge badge-pill badge-danger");
                            sp1.appendChild(document.createTextNode("Rejected"));
                        }
                        if (value.status == "4") {
                            sp1.setAttribute("class", "badge badge-pill badge-danger");
                            sp1.appendChild(document.createTextNode("Disconnected"));
                        }
                        sp1.setAttribute("style", "margin-left:10px;");
                        event_data += '<tr>';
                        event_data += '<td>' + value.callerid + '</td>';
                        event_data += '<td >' + sp1.outerHTML + '</td>';
                        event_data += '<td>  <button type="button" class="btn btn-primary" onclick="connect(' + value.cid + ')">Connect</button></td>';
                        event_data += '<td>  <button type="button" class="btn btn-danger" onclick="disconnect(' + value.cid + ')">Disconnect</button></td>';
                        event_data += '</tr>';


                    });
                    $("#list_table_json").html(event_data);
                },
                error: function (d) {
                    /*console.log("error");*/
                    alert("404. Please wait until the File is Loaded.");
                }
            });
        }

        function connect(id) {
           
            var dataValue = { "txt":id ,"un":"2"};
            $.ajax({
                type: "GET",
                url: "updatestatus.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    //  alert("Incorrect Username or Password!");

                },
                success: function (result) {
                    
                    getlist();
                    
                }
            });
        }
        function disconnect(id) {
            var dataValue = { "txt": id ,"un":"4"};
            $.ajax({
                type: "GET",
                url: "updatestatus.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    //  alert("Incorrect Username or Password!");

                },
                success: function (result) {
                    getlist();
                   
                }
            });
        }


        function loadselect() {       
            var dataValue = { "txt": "", "un": "" };
            $.ajax({
                type: "GET",
                url: "getchannel.ashx",
                data: "",
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    //  alert("Incorrect Username or Password!");

                },
                success: function (result) {
                   
                    var $el = $("#notifmess");
                    $el.empty(); // remove old options
                    $el.append($("<option></option>")
                            .attr("value", '').text('Please Select'));
                    $.each(result, function (value, key) {
                       
                        $el.append($("<option></option>")
                                .attr("value", key.cid).text(key.callerid +": "+ key.createddate));
                    });
                    //debugger;
                    var keyIndex = JSON.parse(localStorage.getItem('calldataIndex'));
                    $("#notifmess")[0].selectedIndex = parseInt(keyIndex);
                }
            });



        }
    </script>
    </form>
</body>

</html>
