<%@page import="com.bw.bean.DataBean_Screen_Report"%>
<%@page import="com.bw.Util.HeaderScreen_Report"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="windows-874"%>
<%@page import="com.bw.bean.DataBean_Screen_Process"%>
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.Util.HeaderScreen_Process"%>
<html>
    <%!    String path, lookup, doc_eff_date, doc_no;
    %>
    <head>
        <META Http-Equiv="Cache-Control" Content="no-cache">
        <META Http-Equiv="Pragma" Content="no-cache">        
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>        
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" />
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/timepicker.css" />

        <link href="../CSS/component.css" rel="stylesheet" type="text/css">   

        <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
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


        <script type="text/javascript">

            function time_picker(input) {
                $(input).timepicker({showSecond: true,
                    timeFormat: 'hh:mm:ss'/*,hourGrid: 2,
                     minuteGrid: 10,secondGrid:5*/});
            }
            function Calculator_AVG() {
                var div = 0;
                var value_avg = 0;
                var strID = "";
                strID = getIDElements("input", "A_percent_");
                strID = strID.replace("A_percent_avg,", "");
                strID = strID.substr(0, strID.length - 1);
                var mem_value = strID.split(",");
                for (var i = 0; i < mem_value.length; i++) {
                    if (document.getElementById(mem_value[i]).value !== "" && document.getElementById(mem_value[i]).value !== "0") {
                        value_avg = value_avg + parseFloat(document.getElementById(mem_value[i]).value);
                        div += 1;
                    }
                }

                document.getElementById("A_percent_avg").value = (value_avg / div).toFixed(2);
            }
            function add()
            {
                return_amount_tapioca();
                var strID = "";
                strID = getIDElements('input', 'A_');
                strID += getIDElements('select', 'A_');
                strID += getIDElements('textarea', 'A_');
                strID = strID.substr(0, strID.length - 1);
                //alert(strID);
                confirmDialogSave(URLsend('chkNull,' + strID, '../JSP/BW_CS_022.jsp'));
                //location.replace('BW_CS_022.jsp')
            }
            function del() {
                confirmDialogDelete(URLsend('A_doc_id,D_status', '../JSP/BW_CS_022.jsp'));
            }
            function cancle()
            {
                cancelAction();
            }
            function Openproduct()
            {
                openBrWindow('Vproduct&stadment=and+pgroup_id+=+\'G001\'', 22, 'Search_Config2.jsp');
            }

            function Opendoc_id1()
            {
                openBrWindow('Vd_rawmatt_receive&stadment=and+complete_flag+<>+\'Y\'', 22, 'Search_Config2.jsp');
            }

            function Opendoc_id2()
            {
                openBrWindow('Vd_rawmatt_receive&stadment=and+complete_flag+=+\'Y\'', 22, 'Search_Config2.jsp');
            }

            function Chknull() {
                if (document.getElementById('A_doc_id').value === '') {
                    alert('��س����������Ţ����͡���');
                } else
                    document.report.submit();
            }
            function cal_total_weight() {
                if (isNaN((parseFloat(document.getElementById("A_car_in_weight").value) - parseFloat(document.getElementById("A_car_out_weight").value).toFixed(2)))) {
                    document.getElementById("A_total_weight").value = "0.00";
                } else {
                    document.getElementById("A_total_weight").value = (parseFloat(document.getElementById("A_car_in_weight").value) - parseFloat(document.getElementById("A_car_out_weight").value)).toFixed(2);
                }
                if (document.getElementById("A_total_weight").value !== "" && document.getElementById("A_deduct_weight").value !== "") {
                    document.getElementById("A_balance_weight").value = (parseFloat(document.getElementById("A_total_weight").value) - parseFloat(document.getElementById("A_deduct_weight").value)).toFixed(2);
                }
                if (document.getElementById("A_balance_weight").value !== "" && document.getElementById("A_price_accept").value !== "") {
                    document.getElementById("A_total_payment").value = (parseFloat(document.getElementById("A_balance_weight").value) * parseFloat(document.getElementById("A_price_accept").value)).toFixed(2);
                }

                if (document.getElementById("A_total_payment").value !== "" && document.getElementById("A_amount_deduct").value !== "") {
                    document.getElementById("A_amount_payment").value = (parseFloat(document.getElementById("A_total_payment").value) - parseFloat(document.getElementById("A_amount_deduct").value)).toFixed(2);
                }

            }
            function cal_deduct_weight() {
                var value_deduct_weight = 0;
                value_deduct_weight += document.getElementById("A_soil_deduct").value !== "" ? parseFloat(document.getElementById("A_soil_deduct").value) : 0;
                value_deduct_weight += document.getElementById("A_contamination_deduct").value !== "" ? parseFloat(document.getElementById("A_contamination_deduct").value) : 0;
                value_deduct_weight += document.getElementById("A_other_deduct").value !== "" ? parseFloat(document.getElementById("A_other_deduct").value) : 0;
                document.getElementById("A_deduct_weight").value = value_deduct_weight.toFixed(2);
                if (document.getElementById("A_total_weight").value !== "" && document.getElementById("A_deduct_weight").value !== "") {
                    document.getElementById("A_balance_weight").value = (parseFloat(document.getElementById("A_total_weight").value) - parseFloat(document.getElementById("A_deduct_weight").value)).toFixed(2);
                }
                if (document.getElementById("A_balance_weight").value !== "" && document.getElementById("A_price_accept").value !== "") {
                    document.getElementById("A_total_payment").value = (parseFloat(document.getElementById("A_balance_weight").value) * parseFloat(document.getElementById("A_price_accept").value)).toFixed(2);
                }
                if (document.getElementById("A_total_payment").value !== "" && document.getElementById("A_amount_deduct").value !== "" && document.getElementById("A_brake_income").value !== "") {
                    document.getElementById("A_amount_payment").value = ((parseFloat(document.getElementById("A_total_payment").value) + parseFloat(document.getElementById("A_brake_income").value)) - parseFloat(document.getElementById("A_amount_deduct").value)).toFixed(2);
                }
            }
            function cal_per_ref() {
                var arrayId = ("A_doc_date,A_supplyer_type,A_pc_ref,A_percent_avg").split(",");
                var matstr = "";
                var flag = false;
                for (var i = 0; i < arrayId.length; i++) {
                    if (document.getElementById(arrayId[i]).value !== "" || arrayId[i] === "A_pc_ref") {
                        if (arrayId[i] === "A_pc_ref") {
                            document.getElementById(arrayId[i]).value = (document.getElementById(arrayId[i]).value === "" ? "34" : document.getElementById(arrayId[i]).value);
                            matstr += "&" + arrayId[i] + "=" + document.getElementById(arrayId[i]).value;
                        } else {
                            matstr += "&" + arrayId[i] + "=" + document.getElementById(arrayId[i]).value;
                        }
                        flag = true;
                        //alert(matstr);
                    } else {
                        alert("��سҡ�͡���������ú");
                        document.getElementById(arrayId[i]).focus();
                        flag = false;
                        break;
                    }
                }
                if (flag === true) {
                    //alert(matstr);
                    //getData_d_rawmatt_receive('../JSP/BW_CS_022.jsp?status_calculator=5'+matstr,'A_price_ref,A_price_accept,A_per_cent_tapioca');
                    getData_d_rawmatt_receive('../JSP/BW_CS_022.jsp?status_calculator=5' + matstr, 'A_per_cent_tapioca');
                    //alert("�ӹǳ % �� ");
                    //alert("�ӹǳ % �� = " + getData_d_rawmatt_receive('../JSP/BW_CS_022.jsp?status_calculator=5' + matstr, 'A_per_cent_tapioca'));
                    var cal = ((parseFloat(document.getElementById("A_balance_weight").value).toFixed(2) * (parseFloat(document.getElementById("A_per_cent_tapioca").value).toFixed(2))) / 100).toFixed(0);
                    //var cal2 = ((parseFloat(document.getElementById("A_balance_weight").value).toFixed(2) * (parseFloat(document.getElementById("A_per_cent_tapioca").value).toFixed(2))) / 100).toFixed(0);
                    //document.getElementById("A_amount_tapioca").value = isNaN((parseFloat(document.getElementById("A_balance_weight").value).toFixed(2) * parseFloat(document.getElementById("A_per_cent_tapioca").value).toFixed(2))) ? 0 : cal;                    
                    document.getElementById("A_amount_tapioca").value = cal;
                    //alert("cal = " + cal + " cal2 = " + cal2);                    


                }
            }

            function return_amount_tapioca() {
                var cal = ((parseFloat(document.getElementById("A_balance_weight").value).toFixed(2) * (parseFloat(document.getElementById("A_per_cent_tapioca").value).toFixed(2))) / 100).toFixed(0);
                document.getElementById("A_amount_tapioca").value = isNaN((parseFloat(document.getElementById("A_balance_weight").value).toFixed(2) * parseFloat(document.getElementById("A_per_cent_tapioca").value).toFixed(2))) ? 0 : cal;
            }

            function Click_Complete_flag(value) {
                if (value) {
                    alert("�͡��ù������ó�");
                    document.getElementById("A_complete_flag").checked = value;
                    document.getElementById("A_complete_flag").value = "Y";
                } else {
                    document.getElementById("A_complete_flag").checked = value;
                    document.getElementById("A_complete_flag").value = "N";
                }
            }

        </script>
        <title>Insert title here</title>
    </head>
    <body >
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <%
                UserBean userbean = (UserBean) session.getAttribute("user");
                UtiDatabase objuti = new UtiDatabase();
                DataBean_Screen_Process objs_p = new DataBean_Screen_Process();
                HeaderScreen_Process h_p = new HeaderScreen_Process();
                objs_p = h_p.selectheaderscreen_detail(objs_p, "BW_CS_022");
                // _______________________________________________________________report
                DataBean_Screen_Report objr_p = new DataBean_Screen_Report();
                HeaderScreen_Report r_p = new HeaderScreen_Report();
                objr_p = r_p.Fn_Report(objr_p, "S501");
                path = objr_p.getPath();
                lookup = objr_p.getLookup();

                //doc_eff_date = objr_p.getDoc_eff_date();
                //doc_no = objr_p.getDoc_no();                
                doc_eff_date = objs_p.getIso_no();
                doc_no = objs_p.getEffective_date();

                //_______________________________________________________________report
%>
            <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
            <input name="D_status" type="hidden" id="D_status" value="3">
            <!-- �繡�� Delete �����ŷ����� -->
            <input type="hidden" id="status_cal" value="4" >
            <input name="chkNull" type="hidden" id="chkNull" value="A_doc_id,A_doc_date">
            <!---------------------------------------------------report----------------------------->
            <input type="hidden" id="report_code" name="report_code"  value="<%=path%>">
            <input type="hidden" id="type_report" name="type_report" value="2">
            <input type="hidden" id="lookup" name="lookup" value="<%=lookup%>">
            <input type="hidden" id="doc_eff_date" name="doc_eff_date" value="<%=doc_eff_date%>">
            <input type="hidden" id="doc_no" name="doc_no" value="<%=doc_no%>">

            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;<b>���§ҹ��èѴ��������ѹ�ӻ���ѧ��Ш��ѹ (BW_CS_022)</b></div>                        
                    <div class="panel-footer">                        
                        <div align="left">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="4" align="right"><b>�����Ţ�͡��� :<%=objs_p.getIso_no()%> </b></td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="right"><b>�ѹ����ռźѧ�Ѻ�� :<%=objs_p.getEffective_date()%></b></td>
                                </tr>

                                <tr>
                                    <td class="columnlabel1"><b>�͡�������ó� (�Ѻ����ѹ�������)</b>&nbsp;</td>
                                    <td class="columnobject">
                                        <div class="checkbox checkbox-primary">
                                            <input type="checkbox" id="A_complete_flag" name="A_complete_flag" value="N" onClick="Click_Complete_flag(this.checked)">
                                            <label for="A_complete_flag"></label> 
                                        </div>
                                    </td>
                                </tr>                                    

                                <tr>
                                    <td width="170" class="columnlabel1"><b><!--<input type="button" id="runid" name="runid" value="�Ţ���㺪���/�Ѻ�" onclick="AjaxRun_id('A_doc_id', '../JSP/BW_CS_022.jsp?status_runid=4')">-->
                                            �Ţ���㺪���/�Ѻ�*</b>&nbsp;</td>
                                    <td width="587" colspan="3" class="columnobject">
                                        <input name='A_doc_id' class='inputs' type="text" id="A_doc_id" value='' size='12' />
                                        &nbsp;<a href='#' onClick="Opendoc_id1();"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='����' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;                                            
                                        �ѹ����͡���*&nbsp;
                                        <input name='A_doc_date' class='inputs' type="text" id="A_doc_date" value='' size='10' readonly="readonly"/>
                                        &nbsp;<a id='date_1'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField: 'A_doc_date', ifFormat: '%d-%m-%Y', showsTime: false, button: 'date_1', singleClick: true, step: 1});</script>
                                        &nbsp;&nbsp;����*&nbsp;<input name='A_doc_time' class='inputs' type="text" id="A_doc_time" value='' size='10' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"></td>
                                    <td colspan="3" class="columnobject">
                                        <b>�͡��÷���Ѻ�������</b>&nbsp;<a href='#' onClick="Opendoc_id2()"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='����' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                    </td>
                                </tr>                                    
                                <tr>
                                    <td class="columnlabel1">����¹ö*</td>
                                    <td colspan="3" class="columnobject"><input name="A_car_no" class='inputs' type="text" id="A_car_no"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">���ͼ����*&nbsp;</td>
                                    <td colspan="3" class="columnobject">
                                        <input name='A_supplier_id' class='inputs' type="text" id="A_supplier_id" value='' size='10' readonly="readonly"/>
                                        &nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' style="cursor: pointer;" alt='����' name='IMAGE3' width='20' height='20' border='0' align='middle' onClick="openBrWindow('Vsupplier', 22, 'Search_Config.jsp');" >&nbsp;&nbsp;&nbsp;<input name='supplier_id_desc' class='inputs' type="text" id="supplier_id_desc" value='' size='20' readonly="readonly" />&nbsp;&nbsp;&nbsp;&nbsp;�������١���
                                        <%=objuti.ShowSelectBox("select supply_type_id,name_t from m_supplyer_type where delete_flag = 'N'  order by runno", "supply_type_id", "name_t", "A_supplyer_type")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"><p>�ѹ���ö���</p></td>
                                    <td colspan="3" class="columnobject"><input name='A_car_date_in ' class='inputs' type="text" id="A_car_date_in" value='' size='10' readonly="readonly"/>
                                        &nbsp;<!--<a id='date_2'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_car_date_in',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_2',singleClick:true,step:1});</script>-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����
                                        <input class='inputs' type="text" name="A_car_time_in" id="A_car_time_in"  maxlength="5" onfocus="document.getElementById('A_car_date_in').value = document.getElementById('A_doc_date').value;"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">�ѹ���ö�͡</td>
                                    <td colspan="3" class="columnobject"><input name='A_car_date_out' class='inputs' type="text" id="A_car_date_out" value='' size='10' readonly="readonly"/>
                                        &nbsp;<!--<a id='date_3'><img name='IMAGE2' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a><script type='text/javascript'>Calendar.setup({inputField:'A_car_date_out',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_3',singleClick:true,step:1});</script>-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����
                                        <input class='inputs' type="text" name="A_car_time_out" id="A_car_time_out"  maxlength="5" onfocus="document.getElementById('A_car_date_out').value = document.getElementById('A_doc_date').value;" onblur="document.getElementById('A_doc_time').value = document.getElementById(this.id).value"></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">��Դ�ѹ����ѹ*&nbsp;</td>
                                    <td colspan="3" class="columnobject"><%=objuti.ShowSelectBox("select cassava_type_id,name_t from m_cassava_type where delete_flag = 'N' order by runno", "cassava_type_id", "name_t", "A_potato_type")%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">����ૹ���ѹʴ</td>
                                    <td colspan="3" class="columnobject">
                                        <table width="96%" border="0">
                                            <tr>
                                                <td width="25%"><p>���駷�� 1
                                                        <input name="A_percent_1" class='inputs' type="text" id="A_percent_1" size="4" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                                <td width="26%"><p>���駷�� 2
                                                        <input name="A_percent_2" class='inputs' type="text" id="A_percent_2" size="4" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                                <td width="27%"><p>���駷��   3
                                                        <input name="A_percent_3" class='inputs' type="text" id="A_percent_3" size="4" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                                <td width="22%"><p>���駷��   4
                                                        <input name="A_percent_4" class='inputs' type="text" id="A_percent_4" size="4" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                            </tr>
                                            <tr>
                                                <td><p>���駷�� 5
                                                        <input name="A_percent_5" class='inputs' type="text" id="A_percent_5" size="4 " onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                                <td><p>���駷�� 6
                                                        <input name="A_percent_6" class='inputs' type="text" id="A_percent_6" size="4" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                                <td><p>���駷�� 7
                                                        <input name="A_percent_7" class='inputs' type="text" id="A_percent_7" size="4" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                                <td><p>���駷�� 8
                                                        <input name="A_percent_8" class='inputs' type="text" id="A_percent_8" size="4" onBlur="Calculator_AVG();" onKeyUp="IsNuber(this.value, this)">
                                                        %</p></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">
                                        <!--input type="button" id="cal_button"  value="�Ҥ���ҧ�ԧ���" onClick="cal_per_ref()"-->
                                        <input type="button" class="cgcButton_7" name="myBut" value="�Ҥ���ҧ�ԧ" onClick="cal_per_ref()"/>         
                                    </td>
                                    <td colspan="3" class="columnobject"><input name="A_pc_ref" class='inputs' type="text" id="A_pc_ref" value="34" size="5" onKeyUp="IsNuber(this.value, this)">
                                        %
                                        <input name="A_price_ref" class='inputs' type="text" id="A_price_ref" size="10">
                                        &nbsp;
                                        �ҷ&nbsp;&nbsp;
                                        �����繵������
                                        <input name="A_percent_avg" class='inputs' type="text" id="A_percent_avg" size="10" class="textboxtotal">
                                        %&nbsp;&nbsp;&nbsp;&nbsp;<br>�Ҥ��Ѻ����
                                        &nbsp;&nbsp;&nbsp;<input name="A_price_accept" class='inputs' type="text" id="A_price_accept" size="20">
                                        �ҷ</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">�ѡ�Թ</td>
                                    <td colspan="3" class="columnobject"><input name="A_soil_deduct" class='inputs' type="text" id="A_soil_deduct" size="10" onBlur="cal_deduct_weight()" onKeyUp="IsNuber(this.value, this)">
                                        ��.&nbsp;&nbsp;&nbsp;�ѡ�����ͻ�
                                        <input name="A_contamination_deduct" class='inputs' type="text" id="A_contamination_deduct" size="17" onBlur="cal_deduct_weight()" onKeyUp="IsNuber(this.value, this)">
                                        ��.&nbsp;&nbsp;&nbsp;�ѡ����
                                        <input name="A_other_deduct" class='inputs' type="text" id="A_other_deduct" size="20" onBlur="cal_deduct_weight()" onKeyUp="IsNuber(this.value, this)">
                                        ��.</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1"><p>�ѡ��Ҵ���</p></td>
                                    <td colspan="3" class="columnobject"><input name="A_dump_deduct" class='inputs' type="text" id="A_dump_deduct" size="10" >
                                        �ҷ&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">�����Թ���*&nbsp;</td>
                                    <td colspan="3" class="columnobject"><input name='A_product_id' class='inputs' type="text" id="A_product_id" value='001' size='10' readonly="readonly"/>
                                        <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='����' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('vproduct', 22, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;
                                        <input name='product_id_desc' class='inputs' type="text" id="product_id_desc" value='�ѹ�ӻ���ѧ' size='30' readonly="readonly" />                              </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">��ѧ�ѵ�شԺ*&nbsp;</td>
                                    <td colspan="3" class="columnobject"><input name='A_wh_in' class='inputs' type="text" id="A_wh_in" value='W001' size='10' readonly="readonly"/>
                                        <img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='����' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Mwarehouse&stadment=and+warehouse_id+=+\'<%=objs_p.getWarehouse_begin_id()%>\'', 22, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;
                                        <input name='wh_in_desc' class='inputs' type="text" id="wh_in_desc" value='��ѧ�ѵ�شԺ' size='30' readonly="readonly" />                              
                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">���˹ѡö���</td>
                                    <td colspan="3" class="columnobject"><input name="A_car_in_weight" class='inputs' type="text" id="A_car_in_weight" onBlur="cal_total_weight()" onKeyUp="IsNuber(this.value, this)" size="15">
                                        &nbsp;���š���                                </tr>
                                <tr>
                                    <td class="columnlabel1">���˹ѡö�͡</td>
                                    <td colspan="3" class="columnobject"><input name="A_car_out_weight" class='inputs' type="text" id="A_car_out_weight" size="15" onKeyUp="IsNuber(this.value, this)" onBlur="cal_total_weight()">
                                        ���š���                                </tr>
                                <tr>
                                    <td class="columnlabel1">���˹ѡ�ط��</td>
                                    <td colspan="3" class="columnobject"><input name="A_total_weight" class='inputs' type="text" id="A_total_weight" size="15" onKeyUp="IsNuber(this.value, this)" readonly class="textboxtotal">
                                        ���š���                          </tr>
                                <tr>
                                    <td class="columnlabel1">����ѡ���˹ѡ</td>
                                    <td colspan="3" class="columnobject"><input name="A_deduct_weight" class='inputs' type="text" id="A_deduct_weight" size="15" onKeyUp="IsNuber(this.value, this)" onBlur="cal_total_weight()" class="textboxtotal">
                                        ���š���                          </tr>
                                <tr>
                                    <td class="columnlabel1">���˹ѡ�������
                                        &nbsp;</td>
                                    <td colspan="3" class="columnobject"><input name="A_balance_weight" class='inputs' type="text" id="A_balance_weight" size="15" onKeyUp="IsNuber(this.value, this)" onBlur="cal_total_weight()" class="textboxtotal">
                                        ���š��� &nbsp;X&nbsp;��������<input class='inputs' type="text" id="A_per_cent_tapioca" name="A_per_cent_tapioca" size="10" >%&nbsp;=&nbsp;�Դ����<input id="A_amount_tapioca" name="A_amount_tapioca" class='inputs' type="text" onblur="return_amount_tapioca()">���š���</tr>
                                <tr>
                                    <td class="columnlabel1">�ӹǹ�Թ&nbsp;</td>
                                    <td colspan="3" class="columnobject"><input name='A_total_payment' class='inputs' type="text" id="A_total_payment" value='' size='15' onKeyUp="IsNuber(this.value, this)" class="textboxtotal"/>
                                        &nbsp;�ҷ &nbsp;&nbsp;����ä
                                        <input name="A_brake_income" class='inputs' type="text" id="A_brake_income" size="6">
                                        �ҷ&nbsp;&nbsp;����ä/˹���
                                        <input name="A_brake_value" class='inputs' type="text" id="A_brake_value" size="2" maxLength="2">
                                        ʵҧ�� (��͹ 0,8,10)</td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">����ѡ�Թ</td>
                                    <td colspan="3" class="columnobject"><input name='A_amount_deduct' class='inputs' type="text" id="A_amount_deduct" value='' size='15' onKeyUp="IsNuber(this.value, this)" onBlur="cal_total_weight();
                                            cal_deduct_weight();" />
                                        &nbsp;�ҷ                                             
                                    </td>
                                </tr>                                    
                                <tr>                                        
                                    <td class="columnlabel1">�ӹǹ�Թ����</td>
                                    <td colspan="3" class="columnobject"><input name='A_amount_payment' class='inputs' type="text" id="A_amount_payment" value='' size='15' onKeyUp="IsNuber(this.value, this)" class="textboxtotalpay"/>
                                        &nbsp;�ҷ                          
                                        <input type="button" class="cgcButton_9" name="myBut" value="�ӹǳ�Թ����" onClick="cal_deduct_weight();"/>   
                                </tr>
                                <tr>
                                    <td class="columnlabel1">�����˵�&nbsp;</td>
                                    <td colspan="3" class="columnobject"><textarea class='text_inputs' class='text_inputs' name='A_remark' cols='40' rows='5' id="A_remark" ></textarea></td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">�����§ҹ</td>
                                    <td colspan="3" class="columnobject"><input name="A_reporter_id" class='inputs' type="text" id="A_reporter_id" size="10">
                                        &nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='����' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee', 22, 'Search_Config2.jsp');" >&nbsp;&nbsp;&nbsp;<input name='reporter_id_desc' class='inputs' type="text" id="reporter_id_desc" value='' size='20' readonly="readonly" />                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">����Ǩ�ͺ</td>
                                    <td colspan="3" class="columnobject"><input name="A_checker_id" class='inputs' type="text" id="A_checker_id" size="10">
                                        &nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='����' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee1', 22, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;<input name='checker_id_desc' class='inputs' type="text" id="checker_id_desc" value='' size='20' readonly="readonly" />                                    </td>
                                </tr>
                                <tr>
                                    <td class="columnlabel1">���͹��ѵ�</td>
                                    <td colspan="3" class="columnobject"><input name="A_approve_id" class='inputs' type="text" id="A_approve_id" size="10">
                                        &nbsp;<img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='����' name='IMAGE3' width='20' height='20' border='0' align='middle' style="cursor: pointer;" onClick="openBrWindow('Vemployee2', 22, 'Search_Config2.jsp');">&nbsp;&nbsp;&nbsp;<input name='approve_id_desc' class='inputs' type="text" id="approve_id_desc" value='' size='20' readonly="readonly" />                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='4' class='blankspace'>
                                        <br>
                                        <div align="center">
                                            <a href="javascript:;" onClick="cancle();"><img alt="" class="imgtransparent" src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="add();"><img alt="" class="imgtransparent" src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                            <a href="javascript:;" onClick="del();"><img alt="" class="imgtransparent" src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>
                                            <!--a href="javascript:;"  onclick="Chknull()"><img alt="������͡���" class="imgtransparent" src="../IMAGES/BTN_PRINT_90.png" width="80" height="30" border="0"></a></div-->
                                        </div>
                                        <br>      		  	
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>                                
        </form>
    </body>
</html>