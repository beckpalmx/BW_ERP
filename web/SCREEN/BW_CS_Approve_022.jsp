<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <script language="javascript">
            function cancal(){
                cancelAction();
                getId("runno").value = "";
                getId("show").innerHTML = "";
            }
            function showTable(){
                (getId("doc_date").value == "")?alert("กรุณาเลือกวันที่รับหัวมัน"):
                    //showTableNonPopupApprove('show','doc_id','table_s1','doc_date', '../SHOWDETAILSCREEN/BW_CS_ShowApprove_022.jsp');
                showTableNonPopup("show", "doc_date", "../SHOWDETAILSCREEN/BW_CS_ShowApprove_022.jsp?doc_date=");
            }
            function Send_to_Approve(){
                var IDsend = "";
                var value_ckbox = "";
                if(getId("doc_date").value != ""){
                    for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                    {

                        if(document.getElementsByName("ckbox")[i].checked ==true){
                            value_ckbox += document.getElementsByName("ckbox")[i].value+",";
                        }
                    
                        // getsaveApprove(URLsend(IDsend, "../JSP/CS_048_2.jsp"), "calreport");
                        /*if(Nochk != true && IDsend != ""){
                    getId("line_no").value = getId("line_no").value.substr(0, getId("line_no").value.length-1);
                    IDsend = IDsend.substr(0, IDsend.length-1);
                    IDsend = "process_id,table_h,table_s1,table_s2,doc_id,doc_date,line_no,"+IDsend;
                    //alert(IDsend);
                    //(URLsend(IDsend, "../JSP/CS_048_2.jsp"));
                    getId("doc_id").value = "";
                    getId("doc_date").value = "";
                    getId("line_no").value = "";
                    getId("show").innerHTML = "";
                    getId("chk_all").checked = false;
                }else if(Nochk != true && IDsend == ""){
                    overweight?alert("น้ำหนักที่รับเข้าคลังมีค่ามากกว่าน้ำหนักจริง กรุณากรอกน้ำหนักให้ถูกต้อง"):alert("กรุณากรอกข้อมูลให้ครบ");
                    overweight = false;
                }
                else{
                    alert("กรุณาเลือกข้อมูลที่จะบันทึก");
                }*/
                    }
                    //alert(value_ckbox);
                    if(value_ckbox != ""){
                        getId("runno").value = value_ckbox.substr(0, value_ckbox.length-1);
                        getsaveApprove(URLsend("runno,doc_date", "../JSP/BW_CS_Approve_022.jsp"), "calreport");
                        cancal();
                    }else{
                        alert("กรุณาเลือกข้อมูลที่ต้องการอนุมัติ");
                    }
                }else{
                    alert("กรุณาเลือกวันที่รับหัวมัน");
                }

            }
            
            function ckall(Value)//ทำการกดปุ้ม check ทั้งหมดใช้หรือไม่
            {

                for(var i=0;i<document.getElementsByName("ckbox").length;i++)
                {
                    document.getElementsByName("ckbox")[i].checked = Value;
                }

            }
            //-->
        </script>
    </head>

    <body onUnload="closepopup()">
        <div id="toolTipLayer" style="position:absolute; visibility: hidden"></div>
        <form name="btform" method="post" action="CS_048.jsp">
            <input type="hidden" name="table_h" id="table_h" >
            <input type="hidden" name="table_s1" id="table_s1" >
            <input type="hidden" name="doc_id" id="doc_id" >
            <input type="hidden" name="runno" id="runno">
            <div align="center">

                <table  cellpadding="0"  cellspacing="0">
                    <tr >
                        <td class="ftopleft"></td>
                        <td  class="ftopcenter" colspan="2">อนุมัติหัวมันวัตถุดิบ&nbsp;(BW_CS_Approve_022)</td>
                        <td class="ftopright"></td>
                    </tr>
                    <tr >
                        <td class="fcenterleft"></td>
                        <td  colspan="2" class="fcentercenter">
                            <div align="center">
                                <table  cellpadding="0" cellspacing="0" >
                                    <tr>
                                        <td colspan="2" align="right"><b>หมายเลขเอกสาร : </b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><b>วันที่มีผลบังคับใช้ : </b></td>
                                    </tr>

                                    <tr>
                                        <td width="22%" align="right">วันที่รับมัน</td>
                                        <td width="78%" class="columnobject"><input type="text" name="doc_date" id="doc_date" size="10"> &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'doc_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>
                                            <input type="button" name="bt_search" id="bt_search" value="ค้นหา" onclick="showTable()"></td>
                                    </tr>


                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <div width="100%">
                                                <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner3">

                                                    <tr>
                                                        <td class="headergrid" colspan="9">เอกสาร</td>
                                                    </tr>

                                                    <tr>
                                                        <td align="center" class="row3" width="7%"><input type="checkbox" name="chk_all" value="chk_all" onClick="ckall(this.checked);"/></td>
                                                        <td class="row3" width="3%">No.&nbsp;</td>
                                                        <td class="row3" width="14%">เลขที่เอกสาร&nbsp;</td>
                                                        <td class="row3" width="10%">วันที่เอกสาร&nbsp;</td>
                                                        <td class="row3" width="10%">เวลา&nbsp;</td>
                                                        <td class="row3" width="15%">ชื่อSupplier&nbsp;</td>
                                                        <td class="row3" width="13%">ชนิดมัน&nbsp;</td>
                                                        <td class="row3" width="13%">ประเภทมัน&nbsp;</td>
                                                        <td class="row3" width="15%">น้ำหนัก&nbsp;</td>

                                                    </tr>
                                                </table>
                                            </div>
                                            <div style="width:100%; height: 150px; overflow: auto;" id="show">                                            </div>                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                    <tr>
                                        <td colspan='2' align="right">
                                            <input type='button' name='but1' value='  บันทึก  ' onclick='javascript:Send_to_Approve();'/>
                                            <input type='button' name='but2' value='  ยกเลิก  ' onclick='cancal()'/>                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan='2' class='blankspace'></td>
                                    </tr>
                                </table>
                                <textarea name="calreport" id="calreport" cols="100" rows="7"></textarea>
                            </div></td>
                        <td class="fcenterright"></td>
                    </tr>
                    <tr bordercolor="0069B3">
                        <td class="ffootleft"></td>
                        <td  class="ffootcenter" colspan="2"></td>
                        <td class="ffootright"></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>
