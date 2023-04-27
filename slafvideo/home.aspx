<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="slafvideo.home" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
        content="SLAF">
    <title>SLAF</title>
     <link rel="stylesheet" href="css/bootstrap.min.css">
     <script src="js/jquery-3.5.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/popper.js"></script>
    
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script> 
    <!-- using online links -->
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
        integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="//malihu.github.io/custom-scrollbar/jquery.mCustomScrollbar.min.css">--%>

    <!-- using local links -->
    
    <link rel="stylesheet" href="css/all.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css"> 

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
</head>

<body>
    <div class="page-wrapper default-theme sidebar-bg bg1 toggled">
        <nav id="sidebar" class="sidebar-wrapper">
            <div class="sidebar-content">
                <!-- sidebar-brand  -->
                <!--<div class="sidebar-item sidebar-brand">
                    <a href="#">SLAF</a>
                </div>-->
                <!-- sidebar-header  -->
                <div class="sidebar-item sidebar-header d-flex flex-nowrap">
                    <div class="user-pic">
                        <img class="img-responsive img-rounded" id="uimg" src="img/user.jpg" alt="User picture">
                    </div>
                    <div class="user-info">
                        <span class="user-name" >
                            <strong id="userid"></strong>
                        </span>
                       <%-- <span class="user-role">Administrator</span>
                        <span class="user-status">
                            <i class="fa fa-circle"></i>
                            <span>Online</span>
                        </span>--%>
                         <button type="button" class="btn btn-primary" onclick="logout()">Logout</button>
                    </div>

                </div>
                <!-- sidebar-search  -->
                <div class="sidebar-item sidebar-search">
                    <div>
                        <div class="input-group">
                            <input type="text" class="form-control search-menu" placeholder="Search..." onkeyup="myFunction()" id="myinput">
                            <div class="input-group-append">
                                <span class="input-group-text">
                                    <i class="fa fa-search" aria-hidden="false"></i>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- sidebar-menu  -->
                <div class=" sidebar-item sidebar-menu">
                    <ul>
                        <!--<li class="header-menu">
                            <span>General</span>
                        </li>-->
                        <li class="sidebar-dropdown" id="afbm1">
                            <a href="#">
                                <i class="far fa-user"></i>
                                <span class="menu-text">AFBM</span>
                                <!--<span class="badge badge-pill badge-warning">New</span>-->
                            </a>
                            <div class="sidebar-submenu">
                                <ul  id="afbm">
                                    
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown" id="nonafbm1">
                            <a href="#">
                                <i class="fas fa-user-astronaut"></i>
                                <span class="menu-text">Non AFBM</span>
                                <!--<span class="badge fa-book">3</span>-->
                            </a>
                            <div class="sidebar-submenu">
                                <ul id="nonafbm">
                                   
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown" id="cmd1">
                            <a href="#">
                                <i class="fas fa-user"></i>
                                <span class="menu-text">Command Officers</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul id="cmd">
                                   
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown" id="bco1">
                            <a href="#">
                                <i class="fas fa-user-tie"></i>
                                <span class="menu-text">Base/Aca/School Commanders</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul id="bco">
                                    
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown" id="stnco1">
                            <a href="#">
                                <i class="fas fa-users"></i>
                                <span class="menu-text">Station CO's</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul id="stnco">
                                    
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown" id="fop1">
                            <a href="#">
                                <i class="fas fa-user-check"></i>
                                <span class="menu-text">Air Ops CO's</span>
                            </a>
                             <div class="sidebar-submenu">
                                <ul  id="fop">
                                    
                                </ul>
                            </div>
                        </li>
                          <li class="sidebar-dropdown" id="fopsup1">
                            <a href="#">
                                <i class="fas fa-user-check"></i>
                                <span class="menu-text">Air Ops Support CO's</span>
                            </a>
                             <div class="sidebar-submenu">
                                <ul  id="fopsup">
                                    
                                </ul>
                            </div>
                        </li>
                         <li class="sidebar-dropdown" id="so1">
                            <a href="#">
                                <i class="fas fa-user-check"></i>
                                <span class="menu-text">Staff Officers</span>
                            </a>
                             <div class="sidebar-submenu">
                                <ul  id="so">
                                    
                                </ul>
                            </div>
                        </li>

                        <!--<li class="header-menu">
                            <span>Extra</span>
                        </li>-->
                        <li class="sidebar-dropdown" id="othu1">
                            <a href="#">
                                <i class="far fa-address-book"></i>
                                <span class="menu-text">Other Users</span>
                                <!--<span class="badge badge-pill badge-primary">Beta</span>-->
                            </a>
                            <div class="sidebar-submenu">
                                <ul id="othu">
                                    
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown" id="onuser1">
                            <a href="#">
                                <i class="fas fa-user-check"></i>
                                <span class="menu-text">Connected Users</span>
                            </a>
                             <div class="sidebar-submenu">
                                <ul  id="onuser">
                                    
                                </ul>
                            </div>
                        </li>
                        <li  id="searc2" style="display:none">
                            <%--<a href="#">
                                <i class="fas fa-search"></i>
                                <span class="menu-text">Search</span>
                            </a>
                            <div class="sidebar-submenu">--%>
                                <ul  id="schr">
                                    
                                </ul>
                            <%--</div>--%>
                        </li>
                    </ul>
                </div>
                <!-- sidebar-menu  -->
            </div>
            <!-- sidebar-footer  -->
           <%-- <div class="sidebar-footer">
                <div class="dropdown">

                    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-bell"></i>
                        <span class="badge badge-pill badge-warning notification">3</span>
                    </a>
                    <div class="dropdown-menu notifications" aria-labelledby="dropdownMenuMessage">
                        <div class="notifications-header">
                            <i class="fa fa-bell"></i>
                            Notifications
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <div class="notification-content">
                                <div class="icon">
                                    <i class="fas fa-check text-success border border-success"></i>
                                </div>
                                <div class="content">
                                    <div class="notification-detail">Lorem ipsum dolor sit amet consectetur adipisicing
                                        elit. In totam explicabo</div>
                                    <div class="notification-time">
                                        6 minutes ago
                                    </div>
                                </div>
                            </div>
                        </a>
                        <a class="dropdown-item" href="#">
                            <div class="notification-content">
                                <div class="icon">
                                    <i class="fas fa-exclamation text-info border border-info"></i>
                                </div>
                                <div class="content">
                                    <div class="notification-detail">Lorem ipsum dolor sit amet consectetur adipisicing
                                        elit. In totam explicabo</div>
                                    <div class="notification-time">
                                        Today
                                    </div>
                                </div>
                            </div>
                        </a>
                        <a class="dropdown-item" href="#">
                            <div class="notification-content">
                                <div class="icon">
                                    <i class="fas fa-exclamation-triangle text-warning border border-warning"></i>
                                </div>
                                <div class="content">
                                    <div class="notification-detail">Lorem ipsum dolor sit amet consectetur adipisicing
                                        elit. In totam explicabo</div>
                                    <div class="notification-time">
                                        Yesterday
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-center" href="#">View all notifications</a>
                    </div>
                </div>
                <div class="dropdown">
                    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-envelope"></i>
                        <span class="badge badge-pill badge-success notification">7</span>
                    </a>
                    <div class="dropdown-menu messages" aria-labelledby="dropdownMenuMessage">
                        <div class="messages-header">
                            <i class="fa fa-envelope"></i>
                            Messages
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">
                            <div class="message-content">
                                <div class="pic">
                                    <img src="img/user.jpg" alt="">
                                </div>
                                <div class="content">
                                    <div class="message-title">
                                        <strong> Jhon doe</strong>
                                    </div>
                                    <div class="message-detail">Lorem ipsum dolor sit amet consectetur adipisicing
                                        elit. In totam explicabo</div>
                                </div>
                            </div>

                        </a>
                        <a class="dropdown-item" href="#">
                            <div class="message-content">
                                <div class="pic">
                                    <img src="img/user.jpg" alt="">
                                </div>
                                <div class="content">
                                    <div class="message-title">
                                        <strong> Jhon doe</strong>
                                    </div>
                                    <div class="message-detail">Lorem ipsum dolor sit amet consectetur adipisicing
                                        elit. In totam explicabo</div>
                                </div>
                            </div>

                        </a>
                        <a class="dropdown-item" href="#">
                            <div class="message-content">
                                <div class="pic">
                                    <img src="img/user.jpg" alt="">
                                </div>
                                <div class="content">
                                    <div class="message-title">
                                        <strong> Jhon doe</strong>
                                    </div>
                                    <div class="message-detail">Lorem ipsum dolor sit amet consectetur adipisicing
                                        elit. In totam explicabo</div>
                                </div>
                            </div>
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-center" href="#">View all messages</a>

                    </div>
                </div>
                <div class="dropdown">
                    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-cog"></i>
                        <span class="badge-sonar"></span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuMessage">
                        <a class="dropdown-item" href="#">My profile</a>
                        <a class="dropdown-item" href="#">Help</a>
                        <a class="dropdown-item" href="#">Setting</a>
                    </div>
                </div>
                <div>
                    <a href="#">
                        <i class="fa fa-power-off"></i>
                    </a>
                </div>
                <div class="pinned-footer">
                    <a href="#">
                        <i class="fas fa-ellipsis-h"></i>
                    </a>
                </div>
            </div>--%>
        </nav>
        <!-- page-content  -->
        <main class="page-content pt-2" id="ifg" style="height:100%" >
            <div class="container_row">
                <div class="foreground-layer">
                    <a id="toggle-sidebar" class="btn btn-secondary rounded-0" href="#">
                        <!--<span>Toggle Sidebar</span>-->
                        <i class="fa fa-bars"></i>
                    </a>
                    <!--<button type="button" id="toggle-sidebar" class="btn btn-default btn-circle "><i class="fa fa-bars"></i></button>-->
                </div>
                <div class="background-layer" >
                   
                </div>
            </div>
              
            
            <div id="overlay" class="overlay">
                
                <input id="clickMe" type="button" value="clickme" onclick="" />


            </div>
            
        </main>
        <!-- page-content" -->
    </div>
   

    <!-- page-wrapper -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Calling....</h5>
          <audio controls loop hidden  src="https://135.22.67.66/users/ring.mp3" id="radio" class="hidden" preload="none"></audio>
          
       <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>--%>
      </div>
     <%-- <div class="modal-body">
        ...
      </div>--%>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" id="clscll" data-dismiss="modal" onclick="stopp()">Cancel</button>
        <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
      </div>
    </div>
  </div>
</div>
   
     <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel2">Login</h5>
        
          
      <%--  <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>--%>
      </div>
      <div class="modal-body">
        <div class="form-group">
                                
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" 
                                    id="usern" name ="usern" placeholder="Username"/>
                                </div>
             
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" 
                                    id="passw" name ="passw" placeholder="Password"/>
                                </div>
                              </div>
      </div>
      <div class="modal-footer">
        <%--<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="stopp()">Cancel</button>--%>
        <button type="button" class="btn btn-primary" onclick="loggi()">Login</button>
      </div>
    </div>
  </div>
</div>
    
     <!-- using online scripts -->
  <%--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
    </script>
    <script src="//malihu.github.io/custom-scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>--%>

    <!-- using local scripts -->
    
  <%--Math.random().toString(36).slice(2)--%>
    <script src="https://135.22.67.67/external_api.js"></script>
    <script>
         //////debugger;
        var api;
        var curcall;
        var chnlid;
        var rmn;
        var callid="";
        var actcll="";
        var unme = "";
        var json = null;
        var ismcls = false;
        if (chnlid != null) {
            if (typeof chnlid !== 'undefined') {

            }
            else {
                chnlid = Math.random().toString(36).slice(2);

            }
        }
        else {
            chnlid = Math.random().toString(36).slice(2);
            // chnlid = rmn;
        }




        var paramsxx = getUrlParams(window.location.href);
        //alert(params.id); // 85

        if (paramsxx.id !== undefined && paramsxx.id1 === undefined) {
            //alert(paramsxx.id);
            auth(paramsxx.id, chnlid);
            //   var idx2 = url.indexOf("&");
            // var hash = idx != -1 ? url.substring(idx + 4, idx2) : "";
        }
      else  if (paramsxx.id1 !== undefined) {
            chnlid = paramsxx.id1;
            auth2(paramsxx.id, chnlid);
           // auth(paramsxx.id);
            //   var idx2 = url.indexOf("&");
            // var hash = idx != -1 ? url.substring(idx + 4, idx2) : "";
        }
        else {
            var retrievedObject = JSON.parse(localStorage.getItem('userdata'));




            if (retrievedObject !== null) {

                //alert(retrievedObject["un"]);
                document.getElementById("userid").textContent = retrievedObject["un"].toUpperCase();
                unme = retrievedObject["un"].toUpperCase();


                try {
                    initvd();
                }
                catch (err) {
                  
                }
               



            }
            else {
                // document.getElementById("exampleModal2").modal("toggle");

                $('#exampleModal2').modal({ show: true });
                document.getElementById("exampleModal2").setAttribute("style", "opacity:100;display:block;");


            }


        }

       
        //  var devi = api.getAvailableDevices().then(devices => { });
            //$('document').ready(function () {
            //    ////debugger;
         
          



        //});
           /////////////////////////////////////////////////////
         function getUrlParams (url) {
             var params = {};
             (url + '?').split('?')[1].split('&').forEach(
               function (pair) {
                   pair = (pair + '=').split('=').map(decodeURIComponent);
                   if (pair[0].length) {
                       params[pair[0]] = pair[1];
                   }
               });

             return params;
         }
       
        ///////////////////////////////////////////////////////////////
        function stopp() {
            try {
            var player = document.getElementById('radio');
            player.pause();
            //player.removeAttribute("autoplay");
           // player.src = player.src;
           
            var dataValue = { "txt": curcall, "un": unme };
            $.ajax({
                type: "GET",
                url: "stop.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                  //  alert("Incorrect Username or Password!");

                },
                success: function (result) {

                }
            });

            }
            catch (err) {

            }

        }
    /////////////////////////////////////////////////////////////////////    
        function callu(txt) {
           // ////debugger;
            try {
            $('#exampleModal').modal({ show: true });
            $('#exampleModal').modal({ backdrop: 'static', keyboard: false })
            document.getElementById("exampleModal").setAttribute("style", "opacity:100;display:block;");
            curcall = txt;
            var dataValue = { "txt": txt, "un": unme,"ch":chnlid };
            $.ajax({
                type: "GET",
                url: "call.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                   // alert("Error!");

                },
                success: function (result) {
                  //  ////debugger;
                    if (result != 0) {
                        var player = document.getElementById('radio');

                        var isPlaying = player.currentTime > 0 && !player.paused && !player.ended && player.readyState > 2;

                        if (!isPlaying) {
                            player.play();
                        }
                        
                        callid = result;
                        try {
                            checkcall(result);
                        } catch (err) {

                        }
                        ismcls = false;
                        
                       

                    }
                    else {

                       
                       
                        ismcls = true;
                        //$('#exampleModal').on('shown.bs.modal', function () {
                        //    //////debugger;
                        //    $('#exampleModal').toggle();
                        //    //$('#exampleModal').toggle();
                        //    //if (ismcls==true) {
                        //    //    $('#clscll').trigger("click");

                        //    //    ismcls = false;
                        //    //}
                            
                        //    //$('.modal-backdrop').toggle();
                        //    //$('#exampleModal').modal({ show: false });
                        //    //$('#clscll').click();
                        //});
                        setTimeout(function () {
                            $('#exampleModal').modal('hide');
                            alert("Caller in another call only he can call you!");
                        }, 1000);
                    }
                   
                   
                }
            });
            }
            catch (err) {

            }
          //  alert(txt);
        }
        ////////////////////////////////////////////////////////////////////
        function logout() {
            try {
            localStorage.clear();
            document.getElementById("userid").textContent = "";
                window.location.reload();
            }
            catch (err) {

            }
        }
        ////////////////////////////////////////////////////////////////
        function checkcall(result) {
           // ////debugger;
            try {
            var dataValue = { "txt": callid, "chl": chnlid };
            $.ajax({
                type: "GET",
                url: "getcall.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                   // alert("Error!");

                },
                success: function (result) {
                    //////debugger;
                    if (result != "suc") {
                        try {
                            setTimeout(checkcall, 3000);
                        } catch (err) {

                        }
                    }
                    else {
                      //  ////debugger;
                       
                        $('#exampleModal').modal('hide');
                        var player = document.getElementById('radio');
                        player.pause();
                       // player.removeAttribute("autoplay");
                        //player.src = player.src;
                    }
                }
            });
            
            
           
        }
                catch (err) {

        }
              
        
        }

        ///////////////////////////////////////////////////////////////
        function loggi() {
            try {
            var txtun = document.getElementById('usern').value;
            var txtpw = document.getElementById('passw').value;
            var dataValue = { "un": txtun, "pw": txtpw};
            $.ajax({
                type: "GET",
                url: "login.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                   // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    alert("Incorrect Username or Password!");

                },
                success: function (result) {
                    // alert("We returned: " + result);
                  //  ////debugger;
                    if (result=='suc') {
                        $('#exampleModal2').modal('hide');
                        var testObject = { 'un': txtun, 'pw': txtpw };
                        document.getElementById("userid").textContent = txtun.toUpperCase();
                        // Put the object into storage
                        localStorage.setItem('userdata', JSON.stringify(testObject));
                        var domain = "135.22.67.67/";
                        var options = {
                            roomName: chnlid,
                            width: '100%',
                            height: '100%',
                            parentNode: document.querySelector('#ifg'),
                            userInfo: {
                                displayName: txtun.toUpperCase(),
                                formattedDisplayName: txtun.toUpperCase(),
                                email: 'email@d.com'

                            }
                        }
                         //api = new JitsiMeetExternalAPI(domain, options);
                         //api.executeCommand('subject', 'SLAF VIDEO CONFERENCING SYSTEM');
                         //api.executeCommand('setVideoQuality', 360);
                         //api.addEventListener('readyToClose', function () {

                         //    hangcll();
                         //});
                         //////debugger;
                         //for (var key in json) {
                         //    if (typeof json[key].SeatRowNo !== 'undefined') {
                         //        if (json[key].CardID.toString().toUpperCase() == txtun.toUpperCase()) {
                                    
                         //            api.executeCommand('avatarUrl', (json[key].SeatRowNo.toString()));
                         //            $("#uimg").attr("src", json[key].SeatRowNo.toString());

                         //        }

                         //    }
                         //}


                         unme = txtun.toUpperCase();
                        retrievedObject = JSON.parse(localStorage.getItem('userdata'));
                        initvd();
                    }
                }
            });
            }
            catch (err) {

            }
        }
        /////////////////////////////////////////////////////////////

        function auth(id,id2) {

            try {
            var dataValue = { "un": id, "pw": id2 };
            $.ajax({
                type: "GET",
                url: "auth.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    alert("Error!");

                },
                success: function (result) {
                    // alert("We returned: " + result);
                     ////debugger;
                    if (result.length > 0) {
                        $('#exampleModal2').modal('hide');
                       
                        var testObject = { 'un': result[0].uname, 'pw': result[0].password };
                        document.getElementById("userid").textContent = result[0].uname.toUpperCase();
                        // Put the object into storage
                        localStorage.setItem('userdata', JSON.stringify(testObject));
                        //var domain = "135.22.67.67/";
                        //var options = {
                        //    roomName: chnlid,
                        //    width: '100%',
                        //    height: '100%',
                        //    noSSL: 'true',
                        //    parentNode: document.querySelector('#ifg'),
                        //    userInfo: {
                        //        displayName: txtun.toUpperCase(),
                        //        formattedDisplayName: txtun.toUpperCase(),
                        //        email: 'email@d.com'

                        //    }
                        //}
                        //api = new JitsiMeetExternalAPI(domain, options);
                        //api.executeCommand('subject', 'SLAF VIDEO CONFERENCING SYSTEM');
                        //api.executeCommand('setVideoQuality', 360);
                        //api.addEventListener('readyToClose', function () {

                        //    hangcll();
                        //});
                        //////debugger;
                        //for (var key in json) {
                        //    if (typeof json[key].SeatRowNo !== 'undefined') {
                        //        if (json[key].CardID.toString().toUpperCase() == txtun.toUpperCase()) {

                        //            api.executeCommand('avatarUrl', (json[key].SeatRowNo.toString()));
                        //            $("#uimg").attr("src", json[key].SeatRowNo.toString());

                        //        }

                        //    }
                        //}


                        unme = result[0].uname.toUpperCase();
                        retrievedObject = JSON.parse(localStorage.getItem('userdata'));
                        initvd();
                    }
                    else {
                        retrievedObject = null;
                        unme = "";
                        document.getElementById("userid").textContent = "";
                        $('#exampleModal2').modal({ show: true });
                        document.getElementById("exampleModal2").setAttribute("style", "opacity:100;display:block;");
                    }
                }
            });
            }
            catch (err) {

            }
        }
        function auth2(id, id2) {
            try {

            var dataValue = { "un": id, "pw": id2 };
            $.ajax({
                type: "GET",
                url: "auth2.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    alert("Error!");

                },
                success: function (result) {
                    // alert("We returned: " + result);
                    //////debugger;
                    if (result.length > 0) {
                        $('#exampleModal2').modal('hide');

                        var testObject = { 'un': result[0].uname, 'pw': result[0].password };
                        document.getElementById("userid").textContent = result[0].uname.toUpperCase();
                        // Put the object into storage
                        localStorage.setItem('userdata', JSON.stringify(testObject));
                        //var domain = "135.22.67.67/";
                        //var options = {
                        //    roomName: chnlid,
                        //    width: '100%',
                        //    height: '100%',
                        //    noSSL: 'true',
                        //    parentNode: document.querySelector('#ifg'),
                        //    userInfo: {
                        //        displayName: txtun.toUpperCase(),
                        //        formattedDisplayName: txtun.toUpperCase(),
                        //        email: 'email@d.com'

                        //    }
                        //}
                        //api = new JitsiMeetExternalAPI(domain, options);
                        //api.executeCommand('subject', 'SLAF VIDEO CONFERENCING SYSTEM');
                        //api.executeCommand('setVideoQuality', 360);
                        //api.addEventListener('readyToClose', function () {

                        //    hangcll();
                        //});
                        //////debugger;
                        //for (var key in json) {
                        //    if (typeof json[key].SeatRowNo !== 'undefined') {
                        //        if (json[key].CardID.toString().toUpperCase() == txtun.toUpperCase()) {

                        //            api.executeCommand('avatarUrl', (json[key].SeatRowNo.toString()));
                        //            $("#uimg").attr("src", json[key].SeatRowNo.toString());

                        //        }

                        //    }
                        //}


                        unme = result[0].uname.toUpperCase();
                        retrievedObject = JSON.parse(localStorage.getItem('userdata'));
                        initvd();
                    }
                    else {
                        retrievedObject = null;
                        unme = "";
                        document.getElementById("userid").textContent = "";
                        $('#exampleModal2').modal({ show: true });
                        document.getElementById("exampleModal2").setAttribute("style", "opacity:100;display:block;");
                    }
                }
            });
            }
            catch (err) {

            }
        }
        ///////////////////////////////////////////////////////////////
        function initvd() {
            try {
            var dataValue = { "tt": unme };
            $.ajax({
                type: "GET",
                url: "chkstatus.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    //  alert("Incorrect Username or Password!");

                },
                success: function (result) {


                     //////debugger;
                    json = result;
                    ///////////////////////////////////////

                    var names1 = [];
                    var names2 = [];
                    var names3 = [];
                    var names4 = [];
                    var names5 = [];
                    var names6 = [];
                    var names7 = [];
                    var names8 = [];
                    var names9 = [];
                    var names10 = [];

                    var names11 = [];
                    var names22 = [];
                    var names33 = [];
                    var names44 = [];
                    var names55 = [];
                    var names66 = [];
                    var names77 = [];
                    var names88 = [];
                    var names99 = [];
                    var names1010 = [];

                    var names11x = [];
                    var names22x = [];
                    var names33x = [];
                    var names44x = [];
                    var names55x = [];
                    var names66x = [];
                    var names77x = [];
                    var names88x = [];
                    var names99x = [];
                    var names1010x = [];


                    for (var key in result) {
                        //if (devi1.hasOwnProperty(key)) {
                        //    console.log(key + " -> " + devi1[key]);
                        //}

                        if (typeof result[key].Surname !== 'undefined') {
                            // alert(devi1[key].displayName);
                            if (result[key].isgroup == "1") {
                                //////debugger;
                                names1.push(result[key].Surname);
                                names11.push(result[key].CardID);
                                names11x.push(result[key].online);
                                var ul = document.getElementById("afbm");
                                ul.innerHTML = '';
                                for (var i = 0; i < names1.length; i++) {
                                    var name1 = names1[i];
                                    var name11 = names11[i];
                                    var name11x = names11x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');
                                    var sp1 = document.createElement('span');

                                    if (name11x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name11x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name11x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name11x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name11);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name11 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name1));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }
                            if (result[key].isgroup == "2") {
                                names2.push(result[key].Surname);
                                names22.push(result[key].CardID);
                                names22x.push(result[key].online);
                                var ul = document.getElementById("nonafbm");
                                ul.innerHTML = '';
                                for (var i = 0; i < names2.length; i++) {
                                    var name2 = names2[i];
                                    var name22 = names22[i];
                                    var name22x = names22x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');
                                    var sp1 = document.createElement('span');

                                    if (name22x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name22x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name22x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name22x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name22);

                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name22 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name2));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }
                            if (result[key].isgroup == "3") {
                                names3.push(result[key].Surname);
                                names33.push(result[key].CardID);
                                names33x.push(result[key].online);
                                var ul = document.getElementById("cmd");
                                ul.innerHTML = '';
                                for (var i = 0; i < names3.length; i++) {
                                    var name3 = names3[i];
                                    var name33 = names33[i];
                                    var name33x = names33x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');
                                    var sp1 = document.createElement('span');

                                    if (name33x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name33x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name33x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name33x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name33);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name33 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name3));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }
                            if (result[key].isgroup == "4") {
                                names4.push(result[key].Surname);
                                names44.push(result[key].CardID);
                                names44x.push(result[key].online);
                                var ul = document.getElementById("bco");
                                ul.innerHTML = '';
                                for (var i = 0; i < names4.length; i++) {
                                    var name4 = names4[i];
                                    var name44 = names44[i];
                                    var name44x = names44x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');

                                    var sp1 = document.createElement('span');

                                    if (name44x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name44x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name44x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name44x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name44);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name44 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name4));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }
                            if (result[key].isgroup == "5") {
                                names5.push(result[key].Surname);
                                names55.push(result[key].CardID);
                                names55x.push(result[key].online);
                                var ul = document.getElementById("stnco");
                                ul.innerHTML = '';
                                for (var i = 0; i < names5.length; i++) {
                                    var name5 = names5[i];
                                    var name55 = names55[i];
                                    var name55x = names55x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');

                                    var sp1 = document.createElement('span');

                                    if (name55x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name55x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name55x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name55x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name55);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name55 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name5));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }
                            if (result[key].isgroup == "6") {
                                names6.push(result[key].Surname);
                                names66.push(result[key].CardID);
                                names66x.push(result[key].online);
                                var ul = document.getElementById("othu");
                                ul.innerHTML = '';
                                for (var i = 0; i < names6.length; i++) {
                                    var name6 = names6[i];
                                    var name66 = names66[i];
                                    var name66x = names66x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');

                                    var sp1 = document.createElement('span');

                                    if (name66x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name66x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name66x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name66x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name66);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name66 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name6));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }

                            if (result[key].isgroup == "7") {
                                names8.push(result[key].Surname);
                                names88.push(result[key].CardID);
                                names88x.push(result[key].online);
                                var ul = document.getElementById("fop");
                                ul.innerHTML = '';
                                for (var i = 0; i < names8.length; i++) {
                                    var name8 = names8[i];
                                    var name88 = names88[i];
                                    var name88x = names88x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');

                                    var sp1 = document.createElement('span');

                                    if (name88x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name88x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name88x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name88x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name88);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name88 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name8));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }

                            if (result[key].isgroup == "8") {
                                names9.push(result[key].Surname);
                                names99.push(result[key].CardID);
                                names99x.push(result[key].online);
                                var ul = document.getElementById("fopsup");
                                ul.innerHTML = '';
                                for (var i = 0; i < names9.length; i++) {
                                    var name9 = names9[i];
                                    var name99 = names99[i];
                                    var name99x = names99x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');

                                    var sp1 = document.createElement('span');

                                    if (name99x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name99x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name99x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name99x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name99);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name99 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name9));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }
                            if (result[key].isgroup == "9") {
                                names10.push(result[key].Surname);
                                names1010.push(result[key].CardID);
                                names1010x.push(result[key].online);
                                var ul = document.getElementById("so");
                                ul.innerHTML = '';
                                for (var i = 0; i < names10.length; i++) {
                                    var name10 = names1010[i];
                                    var name1010 = names1010[i];
                                    var name1010x = names1010x[i];
                                    var li = document.createElement('li');
                                    var af = document.createElement('a');
                                    var ir = document.createElement('i');

                                    var sp1 = document.createElement('span');

                                    if (name1010x == "Online") {
                                        sp1.setAttribute("class", "badge badge-pill badge-success");
                                    }
                                    if (name1010x == "Offline") {
                                        sp1.setAttribute("class", "badge badge-pill badge-warning");
                                    }
                                    if (name1010x == "In-Call") {
                                        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                    }
                                    sp1.appendChild(document.createTextNode(name1010x));
                                    sp1.setAttribute("style", "margin-left:10px;");
                                    sp1.setAttribute("id", name1010);
                                    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                    ir.setAttribute("style", "margin-left:auto;");
                                    af.setAttribute("onclick", "callu('" + name1010 + "');");
                                    af.setAttribute("data-target", "#exampleModal");
                                    af.setAttribute("data-toggle", "modal");
                                    af.setAttribute("data-backdrop", "static");
                                    af.setAttribute("data-keyboard", "false");
                                    li.appendChild(af);
                                    af.appendChild(document.createTextNode(name10));
                                    af.appendChild(sp1);
                                    af.appendChild(ir);
                                    ul.appendChild(li);
                                }

                            }
                            names7.push(result[key].Surname);
                            names77.push(result[key].CardID);
                            // names77x.push(result[key].online);
                            var ul = document.getElementById("schr");
                            ul.innerHTML = '';
                            for (var i = 0; i < names7.length; i++) {
                                // ////debugger;
                                var name7 = names7[i];
                                var name77 = names77[i];
                                //var name77x = names77x[i];
                                var li = document.createElement('li');
                                var af = document.createElement('a');
                                var ir = document.createElement('i');
                                //var sp1 = document.createElement('span');

                                //   if (name77x == "Online") {
                                //        sp1.setAttribute("class", "badge badge-pill badge-success");
                                //     }
                                //     if (name77x == "Offline") {
                                //          sp1.setAttribute("class", "badge badge-pill badge-warning");
                                //      }
                                //      if (name77x == "In-Call") {
                                //        sp1.setAttribute("class", "badge badge-pill badge-danger");
                                //       }
                                //     sp1.appendChild(document.createTextNode(name77x));
                                //       sp1.setAttribute("style", "margin-left:10px;");
                                //sp1.setAttribute("id", name77);

                                ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                                ir.setAttribute("style", "margin-left:auto;");
                                af.setAttribute("onclick", "callu('" + name77 + "');");
                                af.setAttribute("data-target", "#exampleModal");
                                af.setAttribute("data-toggle", "modal");
                                af.setAttribute("data-backdrop", "static");
                                af.setAttribute("data-keyboard", "false");
                                li.appendChild(af);
                                af.appendChild(document.createTextNode(name7));
                                //af.appendChild(sp1);
                                af.appendChild(ir);
                                ul.appendChild(li);
                            }
                            // ////debugger;
                            //names7.push(result[key].Surname);
                            //names77.push(result[key].CardID);
                            //var ul = document.getElementById("schr");
                            //ul.innerHTML = '';
                            //for (var i = 0; i < names7.length; i++) {
                            //    // ////debugger;
                            //    var name7 = names7[i];
                            //    var name77 = names77[i];
                            //    var li = document.createElement('li');
                            //    var af = document.createElement('a');
                            //    var ir = document.createElement('i');
                            //    ir.setAttribute("class", "fas fas fa-phone fa-flip-horizontal");
                            //    ir.setAttribute("style", "margin-left:auto;");
                            //    af.setAttribute("onclick", "callu('" + name77 + "');");
                            //    af.setAttribute("data-target", "#exampleModal");
                            //    af.setAttribute("data-toggle", "modal");
                            //    af.setAttribute("data-backdrop", "static");
                            //    af.setAttribute("data-keyboard", "false");
                            //    li.appendChild(af);
                            //    af.appendChild(document.createTextNode(name7));
                            //    af.appendChild(ir);
                            //    ul.appendChild(li);
                            //}

                        }
                    }
                    //////////////////////////////////////////////////////
                    try {
                        doSomething();
                    }
                    catch (err) {
                        
                    }
                  
                }
            });
            }
            catch (err) {

            }
        }
        ///////////////////////////////////////////////////////////////
        function myFunction() {
            try {
            var input, filter, ul, li, a, i, txtValue;
            document.getElementById("searc2").style.display = "block";
            input = document.getElementById("myinput");
            filter = input.value.toUpperCase();
            ul = document.getElementById("schr");
            li = ul.getElementsByTagName("li");
            for (i = 0; i < li.length; i++) {
                a = li[i].getElementsByTagName("a")[0];
                txtValue = a.textContent || a.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    li[i].style.display = "";
                } else {
                    li[i].style.display = "none";
                }
            }
            if (filter.length==0) {
                document.getElementById("searc2").style.display = "none";
                document.getElementById("afbm1").style.display = "block";
                document.getElementById("nonafbm1").style.display = "block";
                document.getElementById("cmd1").style.display = "block";
                document.getElementById("bco1").style.display = "block";
                document.getElementById("stnco1").style.display = "block";
                document.getElementById("othu1").style.display = "block";
                document.getElementById("onuser1").style.display = "block";
                document.getElementById("fop1").style.display = "block";
                document.getElementById("fopsup1").style.display = "block";
                document.getElementById("so1").style.display = "block";
            }
            else {
                document.getElementById("afbm1").style.display = "none";
                document.getElementById("nonafbm1").style.display = "none";
                document.getElementById("cmd1").style.display = "none";
                document.getElementById("bco1").style.display = "none";
                document.getElementById("stnco1").style.display = "none";
                document.getElementById("othu1").style.display = "none";
                document.getElementById("onuser1").style.display = "none";
                document.getElementById("fop1").style.display = "none";
                document.getElementById("fopsup1").style.display = "none";
                document.getElementById("so1").style.display = "none";
            }
        }
                catch (err) {

        }
        }
        /////////////////////////////////////////////////////////
        function cutcll(trt) {
            try {
            var dataValue = { "txt": trt ,"chl":chnlid,"clid": unme};
            $.ajax({
                type: "GET",
                url: "cutcll.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                   // alert("Error!");

                },
                success: function (result) {
                   
                    alert(result);
                }
            });
            }
            catch (err) {

            }
        }
        /////////////////////////////////////////////////////////
        function hangcll() {
            try {
            var dataValue = { "uid": unme };
            $.ajax({
                type: "GET",
                url: "hangcll.ashx",
                data: dataValue,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    // alert("Error!");

                },
                success: function (result) {

                   // alert(result);
                }
            });
            }
            catch (err) {

            }
        }
        /////////////////////////////////////////////////////////

            function doSomething() {
          // debugger;
                
                try {
                    
                    //var element = document.getElementsByName('iframe').contentWindow.document.getElementById('sub-frame-error');
                    //if (typeof (element) != 'undefined' && element != null) {
                    //    debugger;
                    //    window.location.reload();
                    //}

              /////////////////////////////////////////////////////////////

                var dataValue = { "un": unme };
                $.ajax({
                    type: "GET",
                    url: "checkcall.ashx",
                    data: dataValue,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                       // alert("Error!");

                        debugger;

                        window.location.reload();

                    },
                    success: function (result1) {
                       //////debugger;
                        
                        var result;

                        if (result1.length>0) {
                          
                                 result = result1[0].channel;
                                actcll = result1[0].cid;
                            
                          
                            if (chnlid !== result) {
                               // ////debugger;
                           

                                if (typeof api === 'undefined' || api === null) {
                                    
                                }
                                else {
                                    api.executeCommand('hangup');
                                    //var frame = document.getElementById("ifg");
                                    //frame.parentNode.removeChild(frame);
                                    var iframes = document.querySelectorAll('iframe');
                                    for (var i = 0; i < iframes.length; i++) {
                                        iframes[i].parentNode.removeChild(iframes[i]);
                                    }
                                }
                                chnlid = result;
                                //////debugger;
                                var domain = "135.22.67.67/";
                            var options = {
                                roomName: chnlid,
                                width: '100%',
                                height: '100%',
                                
                                parentNode: document.querySelector('#ifg'),
                                userInfo: {
                                    displayName: retrievedObject["un"].toUpperCase(),
                                    formattedDisplayName: retrievedObject["un"].toUpperCase(),
                                    email: 'email@d.com'

                                }
                            }
                            api = new JitsiMeetExternalAPI(domain, options);
                            api.executeCommand('subject', 'SLAF VIDEO CONFERENCING SYSTEM');
                           // api.executeCommand('setVideoQuality', 360);
                            api.addEventListener('readyToClose', function () {

                                hangcll();
                            });
                           // ////debugger;
                            for (var key in json) {
                                if (typeof json[key].SeatRowNo !== 'undefined') {
                                   
                                    if (json[key].CardID.toString().toUpperCase() == unme.toUpperCase()) {
                                        api.executeCommand('avatarUrl', (json[key].SeatRowNo.toString()));
                                        $("#uimg").attr("src", json[key].SeatRowNo.toString());
                                       
                                    }
                                   
                                }
                            }
                            }

                            else {
                                if (typeof api === 'undefined' || api === null) {
                                    ////debugger;
                                    var domain = "135.22.67.67/";
                                    var options = {
                                        roomName: chnlid,
                                        width: '100%',
                                        height: '100%',

                                        parentNode: document.querySelector('#ifg'),
                                        userInfo: {
                                            displayName: retrievedObject["un"].toUpperCase(),
                                            formattedDisplayName: retrievedObject["un"].toUpperCase(),
                                            email: 'email@d.com'

                                        }
                                    }
                                    api = new JitsiMeetExternalAPI(domain, options);
                                    api.executeCommand('subject', 'SLAF VIDEO CONFERENCING SYSTEM');
                                    //api.executeCommand('setVideoQuality', 360);
                                    api.addEventListener('readyToClose', function () {

                                        hangcll();
                                    });
                                   // //debugger;
                                    for (var key in json) {
                                        if (typeof json[key].SeatRowNo !== 'undefined') {
                                            if (json[key].CardID.toString().toUpperCase() == unme.toUpperCase()) {

                                                api.executeCommand('avatarUrl', (json[key].SeatRowNo.toString()));
                                                $("#uimg").attr("src", json[key].SeatRowNo.toString());

                                            }

                                        }
                                    }
                                }
                            }
                        }
                        else {
                            if (typeof api === 'undefined' || api === null) {
                                ////debugger;
                                var domain = "135.22.67.67/";
                                var options = {
                                    roomName: chnlid,
                                    width: '100%',
                                    height: '100%',
                                    
                                    parentNode: document.querySelector('#ifg'),
                                    userInfo: {
                                        displayName: retrievedObject["un"].toUpperCase(),
                                        formattedDisplayName: retrievedObject["un"].toUpperCase(),
                                        email: 'email@d.com'

                                    }
                                }
                                api = new JitsiMeetExternalAPI(domain, options);
                                api.executeCommand('subject', 'SLAF VIDEO CONFERENCING SYSTEM');
                                //api.executeCommand('setVideoQuality', 360);
                                api.addEventListener('readyToClose', function () {

                                    hangcll();
                                });
                                ////debugger;
                                for (var key in json) {
                                    if (typeof json[key].SeatRowNo !== 'undefined') {
                                        if (json[key].CardID.toString().toUpperCase() == unme.toUpperCase()) {
                                            
                                            api.executeCommand('avatarUrl', (json[key].SeatRowNo.toString()));
                                            $("#uimg").attr("src", json[key].SeatRowNo.toString());

                                        }

                                    }
                                }
                            } else {

                                var dataValue = { "txt": actcll };
                                $.ajax({
                                    type: "GET",
                                    url: "actcall.ashx",
                                    data: dataValue,
                                    contentType: 'application/json; charset=utf-8',
                                    dataType: 'json',
                                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                                        // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                                        //alert("Error!");

                                    },
                                    success: function (rs1) {
                                      // //debugger;
                                       if (rs1 .length>0) {
                                            api.executeCommand('hangup');
                                            actcll = "";
                                            //var frame = document.getElementById("ifg");
                                            //frame.parentNode.removeChild(frame);
                                            var iframes = document.querySelectorAll('iframe');
                                            for (var i = 0; i < iframes.length; i++) {
                                                iframes[i].parentNode.removeChild(iframes[i]);
                                            }
                                           // //debugger;
                                            chnlid = Math.random().toString(36).slice(2);
                                            var domain = "135.22.67.67/";
                                            var options = {
                                                roomName:chnlid,
                                                width: '100%',
                                                height: '100%',
                                               
                                                parentNode: document.querySelector('#ifg'),
                                                userInfo: {
                                                    displayName: retrievedObject["un"].toUpperCase(),
                                                    formattedDisplayName: retrievedObject["un"].toUpperCase(),
                                                    email: 'email@d.com'

                                                }
                                            }
                                            api = new JitsiMeetExternalAPI(domain, options);
                                            api.executeCommand('subject', 'SLAF VIDEO CONFERENCING SYSTEM');
                                           // api.executeCommand('setVideoQuality', 360);
                                            api.addEventListener('readyToClose', function () {

                                                hangcll();
                                            });
                                            ////debugger;
                                            for (var key in json) {
                                                if (typeof json[key].SeatRowNo !== 'undefined') {
                                                    if (json[key].CardID.toString().toUpperCase() == unme.toUpperCase()) {
                                                       
                                                        api.executeCommand('avatarUrl', (json[key].SeatRowNo.toString()));
                                                        $("#uimg").attr("src", json[key].SeatRowNo.toString());

                                                    }

                                                }
                                            }

                                        }

                                    }
                                });


                                //api.executeCommand('hangup');
                                //var domain = "meet.jit.si/";
                                //var options = {
                                //    roomName: chnlid,
                                //    width: '100%',
                                //    height: '100%',
                                //    parentNode: document.querySelector('#ifg'),
                                //    userInfo: {
                                //        displayName: retrievedObject["un"].toUpperCase(),
                                //        formattedDisplayName: retrievedObject["un"].toUpperCase(),
                                //        email: 'email@d.com'

                                //    }
                                //}
                                //api = new JitsiMeetExternalAPI(domain, options);
                                //api.executeCommand('subject', 'SLAF');
                            }
                            
                        }
                    }
                });



              //  //debugger;
                if (typeof api === 'undefined' || api === null) {

                }
                else {
                    //debugger;
                    var devi1 = api._participants;
                    if (Object.keys(devi1).length<=1) {
                        //setTimeout( hangcll(),20000);
                    }
                    var names = [];
                    for (var key in devi1) {
                        //if (devi1.hasOwnProperty(key)) {
                        //    console.log(key + " -> " + devi1[key]);
                        //}

                        if (typeof devi1[key].displayName !== 'undefined') {
                            // alert(devi1[key].displayName);
                            names.push(devi1[key].displayName);
                        }
                    }

                    var ul = document.getElementById("onuser");
                    ul.innerHTML = '';
                    for (var i = 0; i < names.length; i++) {
                        var name = names[i];
                        var li = document.createElement('li');
                        var af = document.createElement('a');
                        var ir = document.createElement('i');
                        ir.setAttribute("class", "fas fas fa-phone text-error");
                        ir.setAttribute("style", "margin-left:auto;");
                        af.setAttribute("onclick", "cutcll('" + name + "');");
                        li.appendChild(af);
                        af.appendChild(document.createTextNode(name));
                        af.appendChild(ir);
                        ul.appendChild(li);
                    }
                }
                ///////////////////////////////////////////////////////////

                    var dataValue = { "tt": unme };
                    try {
                $.ajax({
                    type: "GET",
                    url: "chkstatus.ashx",
                    data: dataValue,
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        // alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                        //  alert("Incorrect Username or Password!");

                    },
                    success: function (result) {
                    


                        for (var key in result) {
                            //if (devi1.hasOwnProperty(key)) {
                            //    console.log(key + " -> " + devi1[key]);
                            //}

                            if (typeof result[key].CardID !== 'undefined') {
                                // alert(devi1[key].displayName);
                                
                                   
                                   
                                   // var ul = document.getElementById(result[key].CardID);
                                   // ul.innerHTML = '';
                                    for (var i = 0; i < result.length; i++) {
                                       
                                        var sp1 = document.getElementById(result[key].CardID);
                                        if (typeof sp1 !== 'undefined'&& sp1 != null) {
// //debugger;
sp1.innerHTML = '';
                                        if (result[key].online == "Online") {
                                            sp1.setAttribute("class", "badge badge-pill badge-success");
                                        }
                                        if (result[key].online == "Offline") {
                                            sp1.setAttribute("class", "badge badge-pill badge-warning");
                                        }
                                        if (result[key].online == "In-Call") {
                                            sp1.setAttribute("class", "badge badge-pill badge-danger");
                                        }
                                        sp1.appendChild(document.createTextNode(result[key].online));
                                    }

                                    }

                                }
                               
                    
}}
                });

                }
                catch (err) {

                }


                ///////////////////////////////////////////////////////////

                   
               
                    
                }
                catch (err) {

                }
                setTimeout(doSomething, 8000);

            }



            //api.on('readyToClose', () => {
            //    alert('opaaaaa');
            //});
        try {
            document.getElementById("clickMe").onclick = function () {
               // //debugger;

                var devi1 = api._participants;
                for (i = 0; i < devi1.length;i++){
                    
                }
                for (var key in devi1) {
                    //if (devi1.hasOwnProperty(key)) {
                    //    console.log(key + " -> " + devi1[key]);
                    //}

                    if (typeof devi1[key].displayName !== 'undefined') {
                        alert(devi1[key].displayName);
                    }
                }
               // api.executeCommand('hangup');
               
            };
         }
                catch (err) {

        }
            function randomString(length) {
                return Math.random().toString(36).slice(2);
        }

    </script>
    <script src="js/main.js"></script>
    <script>
        ////debugger;
        //var names = ['John', 'Jane'];
        //var ul = document.getElementById("afbm");

        //for (var i = 0; i < names.length; i++) {
        //    var name = names[i];
        //    var li = document.createElement('li');
        //    var af = document.createElement('a');
        //    var ir = document.createElement('i');
        //    ir.setAttribute("class", "far fa-bell");
        //    li.appendChild(af);
        //    af.appendChild(document.createTextNode(name));
        //    af.appendChild(ir);
        //    ul.appendChild(li);
        //}
    </script>
</body>

</html>