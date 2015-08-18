
<%@page import="com.bw.bean.UserBean"%>
<%@page import="com.bw.Util.UtiDatabase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <%!    String path, lookup;
    %>
    <%
                lookup = (String) request.getParameter("lookup");
                path = (String) request.getParameter("report_code");
                
    %>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <link href="../CSS/cgc_button.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" media="all" href="../JS/jscalendar/skins/aqua/aqua.css" title="Aua" />
        <link rel="stylesheet" media="all" type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.17.custom.css" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>        
        <!-- main calendar program -->
        <script type="text/javascript" src="../JS/jscalendar/calendar.js"></script>
        <!-- language for the calendar -->
        <script type='text/javascript' src='../JS/jscalendar/lang/calendar-th.js'></script>
        <!-- the following script defines the Calendar.setup helper function, which makes
               adding a calendar a matter of 1 or 2 lines of code. -->
        <script type="text/javascript" src="../JS/jscalendar/calendar-setup.js"></script>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>        
        <script type="text/javascript">
            var my_window = null;
            function openBrown(tableID,SentToShow){
                if(my_window == null){
                    my_window = window.open("../SEARCHSCREEN/Search_Report.jsp?table="+tableID+"&sentdataToshow="+SentToShow,'','status=1,width=560,height=500');
                }else{
                    closepopup();
                    my_window = window.open("../SEARCHSCREEN/Search_Report.jsp?table="+tableID+"&sentdataToshow="+SentToShow,'','status=1,width=560,height=500');
                }
            }
            
            function bt_report(){
                //alert(ChkDate(document.report.date_f.value, document.report.date_t.value));
                var submit_boolen = false;
                var param_to = document.report.param_t.value ,
                param_from = document.report.param_f.value,
                date_to = document.report.date_t.value,
                date_from = document.report.date_f.value;
                var chk_param  = (param_to == "" && param_from == "")?true:false;
                var chk_date = (date_to == "" && date_from == "")?true:false;
                if(chk_param == false && chk_date == true){
                    if(param_to != "" && param_from != ""){
                        submit_boolen = true;
                    }else{
                        alert("กรุณากรอกข้อมูลให้ครบ");
                    }
                }else if(chk_param == true && chk_date == false){
                    if(chk_date == false){
                        if(date_to != "" && date_from != ""){
                            if(!ChkDate(document.report.date_f.value, document.report.date_t.value)){
                                document.report.date_form.value = format_Date(date_from);//dateFormat(da1.format,'yyyy-mm-dd').tostring;
                                document.report.date_to.value =  format_Date(date_to);
                                submit_boolen = true;
                            }else{
                                alert("กรุณากรอกใส่วันที่ให้ถูกต้อง");
                            }
                        }else{
                            alert("กรุณากรอกวันที่ให้ครบ");
                        }
                    }
                }else if(chk_param == false && chk_date == false){
                    if(!chk_param){
                        if(param_to != "" && param_from != ""){
                            submit_boolen =true;
                        }else{
                            alert("กรุณากรอกข้อมูลให้ครบ");
                        }
                    }
                    if(!chk_date && submit_boolen){
                        if(date_to != "" && date_from != ""){
                            if(!ChkDate(document.report.date_f.value, document.report.date_t.value)){
                                document.report.date_form.value = format_Date(date_from);//dateFormat(da1.format,'yyyy-mm-dd').tostring;
                                document.report.date_to.value =  format_Date(date_to);
                                submit_boolen = true;
                            }else{
                                submit_boolen = false;
                                alert("กรุณากรอกใส่วันที่ให้ถูกต้อง");
                            }
                        }else{
                            submit_boolen = false;
                            alert("กรุณากรอกวันที่ให้ครบ");
                        }
                    }
                }else{
                    submit_boolen = true;
                }
                if(submit_boolen){
                    //alert("test");
                    document.report.submit();
                }
            }
  
            function chk_report(){
            date_from = document.report.date_f.value;
                if (date_from != ""){       
                    //document.report.date_form.value = format_Date(date_from);
                    document.report.date_form.value = date_from;
                    document.report.submit();
                } else {
                    alert("กรุณากรอกใส่วันที่ให้ถูกต้อง");
                }
            }
            
            
            
        </script>
    </head>

    <body onUnload="closepopup()">
        <form name="report" method="post" action="../JSP/CS_REPORT.jsp" target="_blank">
            <% UtiDatabase objuti = new UtiDatabase(); %>
            <input type="hidden" name="report_code" value="<%=path%>">
            <input type="hidden" name="lookup" value="<%=lookup%>">
            <table  cellpadding="0"  cellspacing="0">
                <tr>
                    <td class="ftopleft"></td>
                    <td  class="ftopcenter" colspan="2">รายงาน 1&nbsp;</td>
                    <td class="ftopright"></td>
                </tr>
                <tr >
                    <td class="fcenterleft"></td>
                    <td  colspan="2" class="fcentercenter">
                        <%if (path.charAt(4) == '0') {%>
                        <div align="center">
                            <input type="hidden" name="type_report" value="1">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="2"  class="blankspace"></td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
                                </tr>

                                <tr>
                                    <td colspan='2' class='blankspace' align="right">
                                        <input type="button" class="cgcButton_11" name="myBut" value=" พิมพ์รายงาน  " onClick="javascript:document.report.submit();"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='2' class='blankspace' ></td>
                                </tr>
                            </table>
                        </div>
                        <%} else {%>
                        <div align="center">
                            <input type="hidden" name="type_report" value="6">
                            <input type="hidden" name="date_form" value="">
                            <input type="hidden" name="date_to" value="">
                            <table  cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td colspan="5"  class="blankspace"></td>
                                </tr>

                                <tr><td colspan='5'><b>กำหนดเงื่อนไข การออกรายงาน</b></td>
                                </tr>

                                <tr>
                                    <td width="153" class='columnobject'><div align="right">Date&nbsp;:&nbsp;</div></td>
                                    <td width="193" class='columnobject'><input name='date_f' type='text' id="date_f" value='' readonly/>
                                        &nbsp;<a id='date_1' href="javascript:;"><img name='IMAGE4' src='../IMAGES/BUTTON/MAIN/CALENDAR20.png' border='0' align='absmiddle'></a>
                                        <script type='text/javascript'>Calendar.setup({inputField:'date_f',ifFormat:'%d-%m-%Y',showsTime:false,button:'date_1',singleClick:true,step:1});</script>                                    
                                    </td>
                                    
                                </tr>
                                <%if (path.equals("BWRP_201")) {%>
                                <tr>
                                    <td class="columnlabel">ค่าเบรค*&nbsp;</td>
                                    <td colspan="3" class="columnobject"><%=objuti.ShowSelectBox("select brake_value,name_t from m_brake_value where delete_flag = 'N' order by runno", "brake_value", "name_t", "brake_value")%>
                                        <!--<select name="A_potato_type" id="A_potato_type">
                                            <option value="1" selected>เกษตรศาสตร์</option>
                                            <option value="2">ระยอง</option>
                                            <option value="3">ห้วยบง</option>
                                            <option value="4">ซีเอ็มอาร์/ซีเอ็มบี</option>
                                            <option value="5">อื่นๆ</option>
                                        </select>--></td>
                                </tr>  
                                <%}%>
                                <tr>
                                    <td colspan='5' class='blankspace' ></td>
                                </tr>

                                <tr>
                                    <td colspan='5' class='blankspace' align="right">
                                        <input type="button" class="cgcButton_11" name="myBut" value=" พิมพ์รายงาน  " onClick="chk_report()"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan='5' class='blankspace' ></td>
                                </tr>
                            </table>
                        </div>
                        <%}%>
                    </td>
                    <td class="fcenterright"></td>
                </tr>
                <tr bordercolor="0069B3">
                    <td class="ffootleft"></td>
                    <td  class="ffootcenter" colspan="2"></td>
                    <td class="ffootright"></td>
                </tr>
            </table>
        </form>
    </body>
</html>