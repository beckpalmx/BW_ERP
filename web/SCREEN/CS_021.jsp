<html>
    <head>
        <title></title>
        <link href="../CSS/MENU.css" rel="stylesheet" type="text/css">
        <link href="../CSS/BT.css" rel="stylesheet" type="text/css">  
        <link href="../CSS/component.css" rel="stylesheet" type="text/css"> 
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>

        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../JS/bootstrap/css/bootstrap-theme.min.css">

        <script src="../JS/jquery/jquery-2.1.4.js"></script>
        <script src="../JS/bootstrap/js/bootstrap.min.js"></script>                           

        <link rel="stylesheet" href="../CSS/checkbox/awesome-bootstrap-checkbox.css"/>     


        <script src="../JS/alertify/alertify.js"></script>        

        <link rel="stylesheet" href="../CSS/alertify/alertify.core.css" />

        <link rel="stylesheet" href="../CSS/alertify/alertify.default.css">

        <link rel="stylesheet" href="../FONTS/css/font-awesome.css" />       

        <script language="javascript">
            <!--
            var my_window = null;
            var t;
            function MM_openBrWindow(theURL, winName, features) { //v2.0
                if (my_window === null) {
                    my_window = window.open(theURL, winName, features);
                } else {
                    closepopup();
                    my_window = window.open(theURL, winName, features);
                }
            }
//-->
        </script>        

        <script language="javascript">

            function Save_Data() {

                confirmDialogSave(URLsend('chkNull,product_id,name_t_product,pgroup_id,pcat_id,ptype_id,price,min,max,safety,warehouse_id,location_id,value,remark_product,table_name', '../JSP/CS_021.jsp'));

            }

            function Delete_Data() {

                confirmDialogDelete(URLsend('product_id,name_t_product,pgroup_id,pcat_id,ptype_id,price,min,max,safety,warehouse_id,location_id,value,remark_product,chkstatus,table_name', '../JSP/CS_021.jsp'));

            }

        </script>            




    </head>
    <body onUnload="closepopup()">

        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading"> <span class="glyphicon glyphicon-tasks"></span>&nbsp;<b>ทะเบียนสินค้า / วัตถุดิบ (CS_021)</b>
                </div>                        
                <div class="panel-footer">                          
                    <div align="center">
                        <input type="hidden" id="table_name" name="table_name" value="mproduct">
                        <table  cellpadding="0" cellspacing="0" >
                            <tr>
                                <td class="columnlabel1"><b>รหัสสินค้า*</b>&nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='product_id' id="product_id" value='' />&nbsp;<a href='javascript:;' onClick="openBrWindow('vproduct', 21, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;
                                    <input class='inputs' type="text" name='name_t_product' id="name_t_product" size='30' value='' />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">กลุ่มสินค้า*&nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='pgroup_id' id="pgroup_id"  size='10' value='' readonly/>&nbsp;<a href='javascript:;' onClick="openBrWindow('mproduct_group', 21, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                    <input class='inputs' type="text" name='name_t_pgroup' id="name_t_pgroup" size='30' value='' readonly/>
                                    <input type="hidden" name="remark_pgroup" id="remark_pgroup">
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ชนิดสินค้า*&nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='pcat_id' id="pcat_id" size='10' value='' readonly/>&nbsp;<a href='javascript:;' onClick="openBrWindow('mproduct_cat', 21, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                    <input class='inputs' type="text" name='name_t_pcat' id="name_t_pcat" size='30' value='' readonly/>
                                    <input type="hidden" name="remark_pcat" id="remark_pcat">
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ประเภทสินค้า*&nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='ptype_id' id="ptype_id" size='10' value='' readonly/>&nbsp;<a href='javascript:;' onClick="openBrWindow('mproduct_type', 21, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE4' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                    <input class='inputs' type="text" name='name_t_ptype' id="name_t_ptype" size='30' value='' readonly/>
                                    <input type="hidden" name="remark_ptype" id="remark_ptype">
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">ราคาสินค้า : &nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='price' id="price" size='30' value='' onKeyUp="IsNumeric(this.value, this)"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">จุดต่ำสุด : &nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='min' id="min" size='30' value='' onKeyUp="IsNumeric(this.value, this)"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">จุดสูงสุด : &nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='max' id="max" size='30' value='' onKeyUp="IsNumeric(this.value, this)"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">จุด Safety : &nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='safety' id="safety" size='30' value='' onKeyUp="IsNumeric(this.value, this)"/>                </td>
                            </tr>

                            <tr>
                                <td class="columnlabel1">หน่วยนับ*&nbsp;</td>
                                <td class="columnobject">
                                    <input type='text' class="inputs" name='unit_id' id='unit_id'  size='10' value='' readonly/>&nbsp;<a href='javascript:;' onClick="openBrWindow('munit_code', 21, 'Search_Config2.jsp')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                    <input type='text' class="inputs" name='unit_name' id='unit_name' size='30' value='' readonly/>
                                </td>
                            </tr>                                       

                            <tr>
                                <td class="columnlabel1">น้ำหนักต่อหน่วย*&nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='warehouse_id' id="warehouse_id" size='10' value='' />&nbsp;
                                    <!--<a href='javascript:;' onClick="MM_openBrWindow('../JSP/SearchWareHouse.jsp?chk=0','','status=1,width=560,height=500')"><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
                                    <input class='inputs' type="text" name='name_t_warehouse' id="name_t_warehouse" size='30' value='' readonly/>
                                    <input type="hidden" name="remark_wh" id="remark_wh" >-->
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">เลขกอง : &nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='location_id' id="location_id" size='30' value='' />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">มูลค่า : &nbsp;</td>
                                <td class="columnobject">
                                    <input class='inputs' type="text" name='value' id="value" size='30' value='' />
                                </td>
                            </tr>
                            <tr>
                                <td class="columnlabel1">หมายเหตุ : &nbsp;</td>
                                <td class="columnobject"><textarea class='text_inputs' name='remark_product' id="remark_product" rows='5' cols='40'></textarea></td>
                            </tr>

                            <tr>
                                <td colspan='2' class='blankspace'></td>
                            </tr>
                            <tr>
                                <td colspan='2' class='blankspace'><div align="center">
                                        <input type="hidden" id="chkstatus" value="1">
                                        <input type="hidden" id="chkNull" value="product_id,name_t_product,pgroup_id,pcat_id,ptype_id,warehouse_id">
                                        <a href="javascript:;" onClick="cancelAction();"><img alt=""  src="../IMAGES/BTN_CANCEL_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="Save_Data();"><img alt=""  src="../IMAGES/BTN_SAVE_90.png" width="80" height="30" border="0"></a>
                                        <a href="javascript:;" onClick="Delete_Data();"><img alt=""  src="../IMAGES/BTN_DEL_90.png" width="80" height="30" border="0"></a></div></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
