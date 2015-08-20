<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.UserBean"%>
<html>
    <head>
        <title></title>
        <script type="text/javascript" src="../JS/myAjaxFramework.js">
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  
        <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">

        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">        

        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">

        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>                           

        <link rel="stylesheet" href="../CSS/checkbox/awesome-bootstrap-checkbox.css"/>     


        <script src="../JS/alertify/alertify.js"></script>        

        <link rel="stylesheet" href="../CSS/alertify/alertify.core.css" />

        <link rel="stylesheet" href="../CSS/alertify/alertify.default.css">

        <link rel="stylesheet" href="../FONTS/css/font-awesome.css" />                

    </head>
    <body onUnload="closepopup()">
        <%UserBean userbean = (UserBean) session.getAttribute("user");%>
        <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
        <input type="hidden" id="chkNull" value="export_id,name_t,lookup_name,param_name,param_value">
        <input type="hidden" id="status_u" value ="2">
        <input type = "hidden" id ="status_d" value ="3">

        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-wrench"></span>&nbsp;
                    <b>Export Parameter (CS_Export_Data)</b>
                </div>                        
                <div class="panel-footer">            
                    <div align="center">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1"><b>รหัสExport_id*</b>&nbsp;:&nbsp;</td>
                                <td class="columnobject"><input class='inputs' type="text" name='export_id' size='10' value='' id="export_id" />
                                    &nbsp;<a href='javascript:;' onClick="openBrWindow('mdata_export&stadment=and+status+=+\'Y\'', 204, 'Search_Config2.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                    <input class='inputs' type="text" name='name_t' size='30' value='' id="name_t" />                              </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ชื่อTable*&nbsp;:&nbsp;</td>
                                <td class="columnobject"><input name="lookup_name" class='inputs' type="text" id="lookup_name" size="45"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ชื่อที่ต้องการให้แสดง*&nbsp;:&nbsp;</td>
                                <td class="columnobject"><input name="param_name" class='inputs' type="text" id="param_name" size="90" alt="ระบุชื่อที่ต้องการแสดงในไฟล์ CSV "></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ชื่อColoumของTable*&nbsp;:&nbsp;</td>
                                <td class="columnobject"><input name="param_value" class='inputs' type="text" id="param_value" size="90" alt="ระบุชื่อColoumของTableให้ตรงกันกับชื่อที่ต้องการให้แสดง"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ช่องค้นหารหัส/เลขที่เอกสาร&nbsp;:&nbsp;</td>
                                <td class="columnobject"><select class='select_cgc2' name="param_from" id="param_from">
                                        <option value="runno" selected>รหัส/เลขที่เอกสาร</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ช่องค้นหาวันที่เอกสาร&nbsp;:&nbsp;</td>
                                <td class="columnobject"><select class='select_cgc2' name="param_value_from" id="param_value_from">
                                        <option value="" selected>ไม่ต้องการ</option>
                                        <option value="doc_date">วันที่เอกสาร</option>
                                    </select>                              </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">การเรียงลำดับเพื่อแสดงข้อมูล&nbsp;:&nbsp;</td>
                                <td class="columnobject"><select class='select_cgc2' name="order_by" id="order_by">
                                        <option value="" selected>ไม่ต้องการ</option>
                                        <option value="runno">เรียงตามลำดับเอกสาร น้อย->มาก</option>
                                        <option value="runno desc">เรียงตามลำดับเอกสาร มาก->น้อย</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">Flag&nbsp;ต่างๆ&nbsp;:&nbsp;</td>
                                <td class="columnobject"><select class='select_cgc2' name="complete_flag" id="complete_flag">
                                        <option value="" selected>ไม่ต้องการ</option>
                                        <option value="Y">complete_flag = Y</option>
                                        <option value="N">complete_flag = N</option>
                                    </select><select class='select_cgc2' name="retro_flag" id="retro_flag">
                                        <option value="" selected>ไม่ต้องการ</option>
                                        <option value="Y">retro_flag = Y</option>
                                        <option value="N">retro_flag = N</option>
                                    </select><select class='select_cgc2' name="cancel_flag" id="cancel_flag">
                                        <option value="" selected>ไม่ต้องการ</option>
                                        <option value="Y">cancel_flag = Y</option>
                                        <option value="N">cancel_flag = N</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">หมายเหตุ&nbsp;:&nbsp;</td>
                                <td class="columnobject"><textarea class='text_inputs' name='remark' rows='5' cols='40' id="remark"></textarea></td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>
                                    <br>
                                    <div align="center">
                                        <a href="javascript:;" onClick="cancelAction()"><img alt=""  src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="confirmDialogSave(URLsend('chkNull,export_id,name_t,lookup_name,param_name,param_value,param_from,param_value_from,order_by,complete_flag,retro_flag,cancel_flag,remark,username', '../JSP/CS_Export_Data.jsp'))"><img alt=""  src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="confirmDialogDelete(URLsend('export_id,name_t,lookup_name,param_name,param_value,param_from,param_value_from,order_by,complete_flag,retro_flag,cancel_flag,remark,status_d,username', '../JSP/CS_Export_Data.jsp'))"><img alt=""  src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>                                    </div>
                                    <br>                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
