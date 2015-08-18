<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bw.bean.UserBean"%>
<html>
    <head>
        <title></title>
        <script type="text/javascript" src="../JS/myAjaxFramework.js">
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
    </head>
    <body onUnload="closepopup()">
        <%UserBean userbean = (UserBean) session.getAttribute("user");%>
        <input name="username" type="hidden" id="username" value="<%=userbean.getUsername()%>" size="30" readonly/>
        <input type="hidden" id="chkNull" value="be,sg">
        <input type="hidden" id="status_u" value ="2">
        <input type = "hidden" id ="status_d" value ="3">
        <table  cellpadding="0"  cellspacing="0">
            <tr >
                <td class="ftopleft"></td>
                <td  class="ftopcenter" colspan="2">ทะเบียนค่าSG(CS_204)</td>
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
                              <td class="columnlabel"><b>ค่า Be'*</b>&nbsp;</td>
                              <td class="columnobject"><input type='text' name='be' size='10' value='' id="be" />
                                &nbsp;<a href='javascript:;' onClick="openBrWindow('m_sg_config',204,'Search_Config2.jsp');"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE1' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                              </td>
                            </tr>
                            <tr>
                              <td class="columnlabel"><b>ค่า S.G.'*</b>&nbsp;</td>
                              <td class="columnobject"><input type='text' name='sg' size='10' value='' id="sg" /></td>
                            </tr>
                            <tr>
                                <td class="columnlabel">หมายเหตุ&nbsp;</td>
                                <td class="columnobject"><textarea name='remark' rows='5' cols='40' id="remark"></textarea></td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'>
                                    <br>
                                    <div align="center">
                                        <a href="javascript:;" onClick="cancelAction()"><img alt=""  src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="confirmDialogSave(URLsend('chkNull,be,sg,remark,username','../JSP/CS_204.jsp'))"><img alt=""  src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="confirmDialogDelete(URLsend('be,sg,remark,status_d,username','../JSP/CS_204.jsp'))"><img alt=""  src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a>                                    </div>
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
