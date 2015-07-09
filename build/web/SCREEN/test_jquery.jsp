<%-- 
    Document   : test_jquery
    Created on : Oct 6, 2014, 10:55:52 AM
    Author     : beckpalmx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>JQUERY Tutorials</title>
    <script type="text/javascript" src="../JS/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript">
        var sumpprice = $('#pprice').val();
        $('#pqty').change(function() {
            var sumpqty = $(this).val();
            var sumtotal = (sumpprice * sumpqty).toFixed(2);
            $('#totalpprice').val(sumtotal);
        })
                .change();

        $('#padd').click(function() {
            var pname = $('#pname').val();
            var pqty = $('#pqty').val();
            var pprice = $('#pprice').val();
            var totalpprice = (pqty * pprice).toFixed(2);
            $('#addhereform li:last').append('<input type="text" id="pname" name="pname" value="' + pname + '"/><input type="number" id="pqty" name="pqty" value="' + pqty + '"/><input type="text" id="pprice" name="pprice" value="' + pprice + '"/><input type="text" id="totalpprice" name="totalpprice" value="' + totalpprice + '"/></li><li>');
        });
    </script>
    <style>
        #pname
        {
            width:120px;
        }
        #pqty
        {
            width:50px;
        }
        #pprice
        {
            width:50px;
        }
        #totalpprice
        {
            width:50px;
        }        
    </style>
</head>
<body>
    <form method="get" action="here" onsubmit="">
        <input type="text" id="pname" name="pname" value="Product Name"/>
        <input type="number" id="pqty" name="pqty" value="3"/>
        <input type="text" id="pprice" name="pprice" value="2.80"/>
        <input type="text" id="totalpprice" name="totalpprice" value="" readonly/>
        <input type="button" id="padd" name="padd" value="add"/>
    </form>

    <ol id="addhereform">
        <li></li>
    </ol>

</body>
</html>
