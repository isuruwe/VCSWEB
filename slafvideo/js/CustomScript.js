//Date Picker for all Textbox
$(function () {
    $('.datepicker').datepicker();
});
//Msg Shade Out for all Textbox
$(function () {
    $("#Msg").delay(5000).fadeOut("slow");
});


$(function () {

    $("#ServiceNo").change(function () {
        $.ajax({
            url: '../VwPersonalProfiles',
            type: 'POST',
            dataType: 'json',
            data: { id: $("#ServiceNo").val() },
            success: function (data) {
                $("#FullName").val(data.Surname + " " + data.Initials);
                $("#Rank").val(data.Rank);
            },
            error: function () {
                alert("in error function");
            }
        });
    });
});

$(function () {

    $("#SectionName").change(function () {
        $.ajax({
            url: '../FaultRegistry/JobNoCreate', type: 'POST', dataType: 'json', data: { id: $("#SectionName").val() },
            success: function (data) {
                $("#JobNo").val(data.JobNo);
            },
            error: function () {
                alert("in error function");
            }
        });
    });
});

$(document).ready(function () {
    $("#MainDiv").hide();
    $("#SecondDiv").hide();

    $("#btnNotComplete").click(function () {
        $("#SecondDiv").show();
        $("#MainDiv").hide();
    });
    $("#btnNotUpdate").click(function () {
        $("#MainDiv").show();
        $("#SecondDiv").hide();
    });

    $("#Msg").delay(5000).fadeOut("slow");
});

$(function () {
    $("#AFNo").change(function () {
        var AFno = $('#AFNo').val();
        if (AFno != 0) {
            var i = 0;
            $.ajax({
                url: '../GetItem',
                type: 'POST',
                dataType: 'json',
                data: { id: AFno },
                success: function (data) {
                    var dv = $("#DetailsInfoGridView");
                    var tbl_Html = '<table class="table table-responsive table-striped table-hover" style=width:100%"><tr>' +
                                   '<th>Inventory Item</th>' +
                                   '<th>Serial No</th>' +
                                   '<th>Model Name</th>' +
                                   '<th>Make Name</th>' +
                                   '<th>Enter Defect</th>' +
                                   '<th></th>';
                    tbl_Html = tbl_Html + '</tr>';
                    $.each(data, function (key, value) {
                        i++;
                        var txtKey = key;
                        tbl_Html = tbl_Html + '<tr>' +
                                   '<td>' + value.InventoryItemType + '</td>' +
                                   '<td>' + value.SerialNo + '</td>' +
                                   '<td>' + value.ModelName + '</td>' +
                                   '<td>' + value.MakeName + '</td>' +
                                   '<td>' + '<textarea class="form-control" rows="1" id="txtKey' + i + '"></textarea>' + '</td>' +
                                   '<td>' + '<a href="#" onclick="SubmitDetails(' + value.PIID + ',' + i + ',' + value.ITID + ')" id="btnSubmit' + i + '" class="btn btn-success">Add</a>' + '</td>';
                        tbl_Html = tbl_Html + '</tr>'

                    });
                    tbl_Html = tbl_Html + '</table>';
                    dv.html(tbl_Html);

                },
                error: function () {
                    alert("Please type Item Serial No");
                }
            });
        }
    });
    $("#SerialNo").change(function () {
        var SerialNo = $('#SerialNo').val();
        var i = 0;
        $.ajax({
            url: '../GetItemInfo',
            type: 'POST',
            dataType: 'json',
            data: { id: SerialNo },
            success: function (data) {
                var dv = $("#DetailsInfoGridView");
                var tbl_Html = '<table class="table table-responsive table-striped table-hover" style=width:100%"><tr>' +
                       '<th>Inventory Item</th>' +
                       '<th>Serial No</th>' +
                       '<th>Model Name</th>' +
                       '<th>Make Name</th>' +
                       '<th>Enter Defect</th>' +
                       '<th></th>';
                tbl_Html = tbl_Html + '</tr>';
                $.each(data, function (key, value) {
                    i++;
                    tbl_Html = tbl_Html + '<tr>' +
                               '<td>' + value.InventoryItemType + '</td>' +
                               '<td>' + value.SerialNo + '</td>' +
                               '<td>' + value.ModelName + '</td>' +
                               '<td>' + value.MakeName + '</td>' +
                               '<td>' + '<textarea class="form-control" rows="1" id="txtKey' + i + '"></textarea>' + '</td>' +
                               '<td>' + '<a href="#" onclick="SubmitDetails(' + value.PIID + ',' + i + ',' + value.ITID + ')" id="btnSubmit' + i + '" class="btn btn-success">Add</a>' + '</td>';
                    tbl_Html = tbl_Html + '</tr>'

                });
                tbl_Html = tbl_Html + '</table>';
                dv.html(tbl_Html);

            },
            error: function () {
                alert("in error function");
            }
        });

    });

});

///Save data to WsTechConRegisterDetail and TechConRegisterHeader
function SubmitDetails(id, i, ITID) {
    $(function () {
        
        ///Assign Value to variables and check the null status
        var InventoryNo = $("#InventoryNo").val();
        var TakenOverDate = $("#TakenOverDate").val();
        var HandedOverby = $("#HandedOverby").val();
        var TakenOverBy = $("#TakenOverBy").val();
        var AFNo = $("#AFNo").val();
        var SerialNo = $("#SerialNo").val();

        var obj_WsTechConCommonDetails = {};
        if (i == 1)
        {
            if ((AFNo == "" || SerialNo == "") && InventoryNo == "" || TakenOverDate == "" || HandedOverby == "" || TakenOverBy == "") {
                alert("Please Fill All Fields.");
            }
            else {
                alert(AFNo);
                ///First Enter Header Details to First Add Button
                obj_WsTechConCommonDetails.JobNo = $("#JobNo").val();
                obj_WsTechConCommonDetails.FaultOriginDate = $("#FaultOriginDate").val();
                obj_WsTechConCommonDetails.InventoryNo = $("#InventoryNo").val();
                obj_WsTechConCommonDetails.TakenOverDate = $("#TakenOverDate").val();
                obj_WsTechConCommonDetails.HandedOverby = $("#HandedOverby").val();
                obj_WsTechConCommonDetails.TakenOverBy = $("#TakenOverBy").val();
                obj_WsTechConCommonDetails.Remarks = $("#Remarks").val();
                obj_WsTechConCommonDetails.JSID = $("#FSID").val();
                obj_WsTechConCommonDetails.AFNo = AFNo;
                obj_WsTechConCommonDetails.SerialNo = $("#SerialNo").val();
                obj_WsTechConCommonDetails.ContactNo = $("#txtContactNo").val();
                obj_WsTechConCommonDetails.SectionName = $("#txtSectionName").val();
                obj_WsTechConCommonDetails.UFRID = $("#txtUFRID").val();

                ///In here include Grid View Details.
                var txtDefects = $("#txtKey" + i + '').val();
                obj_WsTechConCommonDetails.JobNo = $("#JobNo").val();
                obj_WsTechConCommonDetails.Defect = txtDefects;
                obj_WsTechConCommonDetails.PIID = id;
                obj_WsTechConCommonDetails.ITMID = ITID;
                obj_WsTechConCommonDetails.IncrementCount = i;
                ///enter details techcon header and techcon details
                $.ajax({
                    type: "POST",
                    url: '../InsertTechConDetails',
                    data: '{obj_WsTechConCommonDetails: ' + JSON.stringify(obj_WsTechConCommonDetails) + '}',
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        if (data.Message != "Please Click Save Button First.") {
                            alert(data.Message);
                            $("#btnSubmit" + i + '').hide();
                            $("#txtKey" + i + '').val('');
                        }
                        else {
                            alert(data.Message);
                        }

                    },
                    error: function () {
                        alert("Error while inserting data");
                    }
                });
            }
        }
        else
        {
            /// In here second row detils can insert
            var txtDefects = $("#txtKey" + i + '').val();
            obj_WsTechConCommonDetails.JobNo = $("#JobNo").val();
            obj_WsTechConCommonDetails.Defect = txtDefects;
            obj_WsTechConCommonDetails.PIID = id;
            obj_WsTechConCommonDetails.ITMID = ITID;
            obj_WsTechConCommonDetails.AFNo = AFNo;
            obj_WsTechConCommonDetails.IncrementCount = i;
            $.ajax({
                type: "POST",
                url: '../InsertTechConDetails',
                data: '{obj_WsTechConCommonDetails: ' + JSON.stringify(obj_WsTechConCommonDetails) + '}',
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    if (data.Message != "Please Click Save Button First.") {
                        alert(data.Message);
                        $("#btnSubmit" + i + '').hide();
                        $("#txtKey" + i + '').val('');
                    }
                    else {
                        alert(data.Message);
                    }

                },
                error: function () {
                    alert("Error while inserting data");
                }
            });
        }
        return false;
    });
}


//// Stock Item Registering
/// Load Stock Item name to text box  when change the Epas No text bx change
///Location: StockRegistering.cshtml

$(function () {
    $("#EpassNo").change(function () {
        var ENo = $("#EpassNo").val();
        $.ajax({
            url: './GetItemName',
            type: "POST",
            dataType: "json",
            data: { id: ENo },
            success: function (data) {
                $("#ItemName").val(data.ItemName);
                //LoadData();
            },
            error: function () {
                alert("in error function");
            }
        });
    });
});

/// Load Epass Itemname related to the Demand Type to Drop Down List
///Location: StockIn.cshtml

$(function () {
    //$("#ErrMsg_").hide();
    $("#DMTID").change(function () {
        $.post("./LoadItemName",
            { id: $("#DMTID").val() },
            function (response) {
                var s = '<option value="-1">Please Select a Item</option>';
                for (var i = 0; i < response.length; i++) {
                    s += '<option value="' + response[i].SMHID + '">' + response[i].ItemDescription + '</option>';
                }
                $("#ItemListDropdown").html(s);
            }
         );
    });
});

/// Load Item Count to a div
///Location: StockIn.cshtml

$(function () {
    $("#ItemCount").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            alert("Insert Only Numbers");
            return false;
        }
        else {
            $("#ItemCount").change(function () {
                $("#ItemCountController").show();
                var Count = $("#ItemCount").val();
                var dvItemCount = $("#ItemCountController");
                dvItemCount.html(Count);
            });
        }
    });

});

/// Dynamically Generate textbox to enter Item Serial Number or Item Code
///Location: StockIn.cshtml

$(function () {
    $("#Quantity").keypress(function (e) {
        //if the letter is not digit then display error and don't type anything
        if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
            //display error message
            alert("Insert Only Numbers");
            return false;
        }
        else {
            $("#Quantity").change(function () {
                $("#dvStockSubmitButton").show();
                var ItemName = $("#ItemListDropdown").val()
                var ItemCount = $("#Quantity").val();
                var dv = $("#dvItemDetailsInfo");
                var dvSubmit = $("#dvStockSubmitButton");
                var x = 0;
                var SerialNo = 0;

                var tbl_Html = '<table class="table table-responsive table-striped table-hover" style=width:100%"><tr>' +
                          '<th>Serial No/Item Code</th>' +
                          '<th></th>';
                tbl_Html = tbl_Html + '</tr>';
                for (var i = 0; i < ItemCount; i++) {
                    SerialNo++;
                    x++;
                    tbl_Html = tbl_Html + '<tr>' +
                                '<td>' + '<textarea class="form-control" rows="1" id="txtSerialNo' + SerialNo + '"></textarea>' + '</td>' +
                                '<td>' + '<a href="#" id="btnStockAdd' + x + '" onclick = "AddtoStockList(' + SerialNo + ',' + x + ')" class="btn btn-success">Add to Stock</a>' + '</td>';
                    tbl_Html = tbl_Html + '</tr>'
                }
                tbl_Html = tbl_Html + '</table>';
                dv.html(tbl_Html);

            });
        }
    });
});

/// StockDetails and Item Serial No Insert to WsStockBatch table ,StockItemQuantity,StockItemDetails and StockTransactionLog
function AddtoStockList(SerialNo, x) {
    $(function () {
        var SerialNoOrItemCode = $("#txtSerialNo" + SerialNo + '').val();
        var obj_StockCommonInfo = {};
        var OrderNo = $("#OrderNo").val();
        var ItemCount = $("#ItemCount").val();
        var ReceivedDate = $("#ReceivedDate").val();
        var SMHID = $("#ItemListDropdown").val();
        var Quantity = $("#Quantity").val();
        var DMTID = $("#DMTID").val();
        if (x == 1) {
            obj_StockCommonInfo.SMHID = SMHID;
            obj_StockCommonInfo.OrderNo = OrderNo;
            obj_StockCommonInfo.ReceivedDate = ReceivedDate;
            obj_StockCommonInfo.SerialNoOrItemCode = SerialNoOrItemCode;
            obj_StockCommonInfo.Quantity = Quantity;
            obj_StockCommonInfo.DMTID = DMTID;
        }
        else {
            obj_StockCommonInfo.SerialNoOrItemCode = SerialNoOrItemCode;
        }

        $.ajax({
            type: "POST",
            url: './StockIn',
            data: '{obj_StockCommonInfo: ' + JSON.stringify(obj_StockCommonInfo) + '}',
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                alert(data.Message);
                $("#btnStockAdd" + x + '').hide();
                $("#txtSerialNo" + SerialNo + '').val('');
            },
            error: function () {
                alert("Error while inserting data");
            }
        });

        return false;
    });
}

///   Show a Notification when item handover to user 
$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: '../Dashboard/GetNotificationCount',
        dataType: "json",
        success: function (data) {           
            $("#Notification").html(data)

        },
        error: function () {
            alert(data.Message);
        }
    });
});

