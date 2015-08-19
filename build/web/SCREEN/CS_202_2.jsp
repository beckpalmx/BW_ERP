<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.UserBean"%>
<html>
    <head>
        <title></title>
        <script type="text/javascript" src="../JS/myAjaxFramework.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <script type="text/javascript">
            function add()
            {
                var strID = "";
                strID = getIDElements('input','A_');
                strID = strID.substr(0, strID.length-1);
                alert(strID);
                confirmDialogSave(URLsend('chkNull,'+strID,'../JSP/CS_202_2.jsp'));
            }
            function del(){
                confirmDialogDelete(URLsend('A_cassava_price_id,D_status','../JSP/CS_202_2.jsp'));
            }
            function showdetail(){
                showTableNonPopup("show", "A_cassava_price_id", "../SHOWDETAILSCREEN/BW_CS_Show202_2.jsp?doc_id=");
            }
        </script>
    </head>
    <body onUnload="closepopup()">
        <%UserBean userbean = (UserBean) session.getAttribute("user");%>
        <input name="A_username" type="hidden" id="A_username" value="<%=userbean.getUsername()%>" size="30" readonly/>
        <input name="chkNull" type="hidden" id="chkNull" value="A_cassava_price_id,A_eff_date,A_end_date">
        <input name="U_status" type="hidden" id="U_status" value ="2">
        <input name="D_status" type = "hidden" id ="D_status" value ="3">
        <input type="hidden" id="status_cancle" value=""><!-- status_cancle = 1 คือค่าที่นำมา Edit แต่ถ้า ="" จะเป็นการ Insert -->
        <table  cellpadding="0"  cellspacing="0">
            <tr >
                <td class="ftopleft"></td>
                <td  class="ftopcenter" colspan="2">ตารางราคารับซื้อมัน (CS_202)</td>
                <td class="ftopright"></td>
            </tr>
            <tr >
                <td class="fcenterleft"></td>
                <td  colspan="2" class="fcentercenter">
                    <div align="center">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td colspan="2"  class="blankspace"></td>
                            </tr>
                            <tr>
                                <td class="columnlabel"><b>เลขที่*</b>&nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='A_cassava_price_id' size='10' value='' id="A_cassava_price_id" />
                                    &nbsp;<a href='javascript:;' onClick="openBrWindow('m_cassava_price_setting',2022,'Search_Doc_id.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">วันที่รับซื้อ</td>
                                <td class="columnobject"><input class='inputs' type="text" name="A_eff_date" id="A_eff_date" readonly>&nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_eff_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="columnlabel">วันที่ปิดรับ</td>
                                <td class="columnobject"><input class='inputs' type="text" name="A_end_date" id="A_end_date" readonly>&nbsp;<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_end_date',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_2',singleClick:true,step:1});</script>&nbsp;</td>
                            </tr>
                            <tr>

                            </tr>
                            <tr>
                                <td height="200" colspan="2" align="center">
                                    <div style="width:100%;" >
                                        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                            <tr>
                                                <td colspan="3" class="h_multi">แสดงลายละเอียด<!--<input type="button" id="showdetail" value="แสดงลายละเอียด" onclick="showdetail();">--></td>
                                                <td colspan="4" class="btn_multi">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="row3" width="5%">&nbsp;</td>
                                                <td class="row3" width="20%">%มันรับซื้อ</td>
                                                <td class="row3" width="35%">ราคารับซื้อ</td>
                                                <td class="row3" width="35%">ราคารับซื้อ</td>
                                                <td class="row3" width="5%">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div  id="show">
                                        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="1" class="inner">
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">34</td>
                                                <td class="forborder" width="35%">34.00-99.00
                                                    <input name="A_price_value_1_34" class='inputs' type="text" id="A_price_value_1_34" size="10"></td>
                                                <td class="forborder" width="35%"><!--<input class='inputs' type="text" name="A_price_value_34" id="A_price_value_34">-->
                                                    <input name="A_price_value_2_34" type="hidden" id="A_price_value_2_34" value="0">&nbsp;</td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">33</td>
                                                <td class="forborder" width="35%">33.00-33.49
                                                    <input name="A_price_value_1_33" class='inputs' type="text" id="A_price_value_1_33" size="10"></td>
                                                <td class="forborder" width="35%">33.50-33.99
                                                    <input name="A_price_value_2_33" class='inputs' type="text" id="A_price_value_2_33" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">32</td>
                                                <td class="forborder" width="35%">32.00-32.49
                                                    <input name="A_price_value_1_32" class='inputs' type="text" id="A_price_value_1_32" size="10"></td>
                                                <td class="forborder" width="35%">32.50-32.99
                                                    <input name="A_price_value_2_32" class='inputs' type="text" id="A_price_value_2_32" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">31</td>
                                                <td class="forborder" width="35%">31.00-31.49
                                                    <input name="A_price_value_1_31" class='inputs' type="text" id="A_price_value_1_31" size="10"></td>
                                                <td class="forborder" width="35%">31.50-31.99
                                                    <input name="A_price_value_2_31" class='inputs' type="text" id="A_price_value_2_31" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">30</td>
                                                <td class="forborder" width="35%">30.00-30.49
                                                    <input name="A_price_value_1_30" class='inputs' type="text" id="A_price_value_1_30" size="10"></td>
                                                <td class="forborder" width="35%">30.50-30.99
                                                    <input name="A_price_value_2_30" class='inputs' type="text" id="A_price_value_2_30" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">29</td>
                                                <td class="forborder" width="35%">29.00-29.49
                                                    <input name="A_price_value_1_29" class='inputs' type="text" id="A_price_value_1_29" size="10"></td>
                                                <td class="forborder" width="35%">29.50-29.99
                                                    <input name="A_price_value_2_29" class='inputs' type="text" id="A_price_value_2_29" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">28</td>
                                                <td class="forborder" width="35%">28.00-28.49
                                                    <input name="A_price_value_1_28" class='inputs' type="text" id="A_price_value_1_28" size="10"></td>
                                                <td class="forborder" width="35%">28.50-28.99
                                                    <input name="A_price_value_2_28" class='inputs' type="text" id="A_price_value_2_28" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">27</td>
                                                <td class="forborder" width="35%">27.00-27.49
                                                    <input name="A_price_value_1_27" class='inputs' type="text" id="A_price_value_1_27" size="10"></td>
                                                <td class="forborder" width="35%">27.50-27.99
                                                    <input name="A_price_value_2_27" class='inputs' type="text" id="A_price_value_2_27" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">26</td>
                                                <td class="forborder" width="35%">26.00-26.49
                                                    <input name="A_price_value_1_26" class='inputs' type="text" id="A_price_value_1_26" size="10"></td>
                                                <td class="forborder" width="35%">26.50-26.99
                                                    <input name="A_price_value_2_26" class='inputs' type="text" id="A_price_value_2_26" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">25</td>
                                                <td class="forborder" width="35%">25.00-25.49
                                                    <input name="A_price_value_1_25" class='inputs' type="text" id="A_price_value_1_25" size="10"></td>
                                                <td class="forborder" width="35%">25.50-25.99
                                                    <input name="A_price_value_2_25" class='inputs' type="text" id="A_price_value_2_25" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">24</td>
                                                <td class="forborder" width="35%">24.00-24.49
                                                    <input name="A_price_value_1_24" class='inputs' type="text" id="A_price_value_1_24" size="10"></td>
                                                <td class="forborder" width="35%">24.50-24.99
                                                    <input name="A_price_value_2_24" class='inputs' type="text" id="A_price_value_2_24" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">23</td>
                                                <td class="forborder" width="35%">23.00-23.49
                                                    <input name="A_price_value_1_23" class='inputs' type="text" id="A_price_value_1_23" size="10"></td>
                                                <td class="forborder" width="35%">23.50-23.99
                                                    <input name="A_price_value_2_23" class='inputs' type="text" id="A_price_value_2_23" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">22</td>
                                                <td class="forborder" width="35%">22.00-22.49
                                                    <input name="A_price_value_1_22" class='inputs' type="text" id="A_price_value_1_22" size="10"></td>
                                                <td class="forborder" width="35%">22.50-22.99
                                                    <input name="A_price_value_2_22" class='inputs' type="text" id="A_price_value_2_22" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                                <td class="forborder" width="20%">21</td>
                                                <td class="forborder" width="35%">21.00-21.49
                                                    <input name="A_price_value_1_21" class='inputs' type="text" id="A_price_value_1_21" size="10"></td>
                                                <td class="forborder" width="35%">21.50-21.99
                                                    <input name="A_price_value_2_21" class='inputs' type="text" id="A_price_value_2_21" size="10"></td>
                                                <td class="forborder" width="5%">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder">&nbsp;</td>
                                                <td class="forborder">20</td>
                                                <td class="forborder">20.00-20.49
                                                    <input name="A_price_value_1_20" class='inputs' type="text" id="A_price_value_1_20" size="10"></td>
                                                <td class="forborder">20.50-20.99
                                                    <input name="A_price_value_2_20" class='inputs' type="text" id="A_price_value_2_20" size="10"></td>
                                                <td class="forborder">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder">&nbsp;</td>
                                                <td class="forborder">19</td>
                                                <td class="forborder">19.00-19.49
                                                    <input name="A_price_value_1_19" class='inputs' type="text" id="A_price_value_1_19" size="10"></td>
                                                <td class="forborder">19.50-19.99
                                                    <input name="A_price_value_2_19" class='inputs' type="text" id="A_price_value_2_19" size="10"></td>
                                                <td class="forborder">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder">&nbsp;</td>
                                                <td class="forborder">18</td>
                                                <td class="forborder">18.00-18.49
                                                    <input name="A_price_value_1_18" class='inputs' type="text" id="A_price_value_1_18" size="10"></td>
                                                <td class="forborder">18.50-18.99
                                                    <input name="A_price_value_2_18" class='inputs' type="text" id="A_price_value_2_18" size="10"></td>
                                                <td class="forborder">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder">&nbsp;</td>
                                                <td class="forborder">17</td>
                                                <td class="forborder">17.00-17.49
                                                    <input name="A_price_value_1_17" class='inputs' type="text" id="A_price_value_1_17" size="10"></td>
                                                <td class="forborder">17.50-17.99
                                                    <input name="A_price_value_2_17" class='inputs' type="text" id="A_price_value_2_17" size="10"></td>
                                                <td class="forborder">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder">&nbsp;</td>
                                                <td class="forborder">16</td>
                                                <td class="forborder">16.00-16.49
                                                    <input name="A_price_value_1_16" class='inputs' type="text" id="A_price_value_1_16" size="10"></td>
                                                <td class="forborder">16.50-16.99
                                                    <input name="A_price_value_2_16" class='inputs' type="text" id="A_price_value_2_16" size="10"></td>
                                                <td class="forborder">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="forborder">&nbsp;</td>
                                                <td class="forborder">15</td>
                                                <td class="forborder">15.00-15.49
                                                    <input name="A_price_value_1_15" class='inputs' type="text" id="A_price_value_1_15" size="10"></td>
                                                <td class="forborder">15.50-15.99
                                                    <input name="A_price_value_2_15" class='inputs' type="text" id="A_price_value_2_15" size="10"></td>
                                                <td class="forborder">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>
                                    <br>
                                    <div align="center">
                                        <a href="javascript:;" onClick="cancelAction()"><img alt=""  src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="add();"><img alt=""  src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="del();"><img alt=""  src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>                                    </div>
                                    <br>                                </td>
                            </tr>
                        </table>
                    </div></td>
                <td class="fcenterright"></td>
            </tr>
            <tr bordercolor="0069B3">
                <td class="ffootleft"></td>
                <td  class="ffootcenter" colspan="2"></td>
                <td class="ffootright"></td>
            </tr>
        </table>
    </body>
</html>
