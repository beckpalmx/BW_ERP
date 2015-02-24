<%-- 
    Document   : BW_Test_Screen
    Created on : 27 ก.ค. 2555, 15:37:30
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script language="javascript" src="../JS/myAjaxFramework.js"></script>
        <link type="text/css" href="../CSS/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="../JS/jquery/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="../JS/jquery/jquery-ui-1.8.18.custom.min.js"></script>
        <script type="text/javascript" >
            function test(){
                open("BW_CS_Detail_Test.jsp");
            }
            function test2(){
                alert("test");
            }
            $(function(){
                $('#dialog').dialog({
                    autoOpen: false,
                    width: 600,
                    //height: 600,
                    buttons: {
                        "ตกลง": function() {
                            //alert($('#test').val());
                            $('#test_show').html($('#test').val());
                            $(this).dialog("close");
                        },
                        "ยกเลิก": function() {
                            $(this).dialog("close");
                        }
                    }
                });
                $('#test2').click(function(){
                    $('#dialog').dialog('open');
                    return false;
                });
                
            });
            function Opendoc_id()
            {
                openBrWindow('Vd_rawmatt_receive&stadment=and+complete_flag+<>+\'Y\'', 22, '../SEARCHSCREEN/Search_Config3.jsp');
            }

        </script>
        <style type="text/css">
            /*demo page css*/
            body{ font: 62.5% "Trebuchet MS", sans-serif; margin: 50px;}
            .demoHeaders { margin-top: 2em; }
            #dialog_link {padding: .4em 1em .4em 20px;text-decoration: none;position: relative;}
            #dialog_link span.ui-icon {margin: 0 5px 0 0;position: absolute;left: .2em;top: 50%;margin-top: -8px;}
            ul#icons {margin: 0; padding: 0;}
            ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
            ul#icons span.ui-icon {float: left; margin: 0 4px;}
        </style>
    </head>
    <body>
        <input type="button" value="test"  onclick="test()">
        <input type="text" id="test_txt" name="test_txt" value="">
        <input type="button" value="test2"  id="test2">
        <div id="dialog" title="Dialog Title">
            <p><input type="text" id="test" name="test"></p>
        </div>
        <div id="test_show">
           
        </div>
        <input type="button" value="test" onclick="Opendoc_id()">

        <a href='#' onClick="openBrWindow('vproduct', 22, 'Search_Config3.jsp');" ><img src='../IMAGES/BUTTON/MAIN/SEARCH20.png' alt='ค้นหา' name='IMAGE3' width='20' height='20' border='0' align='middle' ></a>&nbsp;&nbsp;&nbsp;
    </body>
</html>
