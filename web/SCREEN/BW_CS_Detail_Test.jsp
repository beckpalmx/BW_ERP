<%-- 
    Document   : BW_CS_Detail_Test
    Created on : 30 ก.ค. 2555, 10:52:17
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BW ERP</title>
        <script type="text/javascript">
            function call_parentpage(){
                window.opener.test2();
            }

        </script>

    </head>
    <body>
        <h1>Hello World!</h1>
        <input type="button" value="test" onclick="call_parentpage()">
    </body>
</html>
