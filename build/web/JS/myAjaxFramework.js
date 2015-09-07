
function createRequestObject()//Create Ajax Object
{
    var requestObjectTemp = false;
    if (window.XMLHttpRequest)
    {
        requestObjectTemp = new XMLHttpRequest();//Support Firfox 
    }
    else if (window.ActiveXObject)
    {
        requestObjectTemp = new ActiveXObject('Microsoft.XMLHTTP');//Support IE
    }
    else
    {
        alert("Your browser does not support");//Not Support
    }
    return requestObjectTemp;
}
function getId(idname)//�ӡ�� return ��� ID ���������к� .value ���� .innerHTML
{
    return document.getElementById(idname);
}
function senddataPopup(IDname)//�ӡ�� return ��� ID ���������к� .value ���� .innerHTML(��͹ Popup)
{
    return opener.document.getElementById(IDname);
}
function readDatainnerHTML(DIVID, xhrObject)
{
    return getId(DIVID).innerHTML = xhrobject.responseText;
}
//---------------------------------------------------------------------
function getSave(array)//การส่งข้อมูลแบบ Ajax
{
    //var obj = getId(show);
    var URL = array[0];
    var IDname = array[1];
    var xhr = createRequestObject();
    var chknull = new Array;
    chknull = IDname.split(",");
    var al;
    if (ChkParameter(chknull)) {
        if (xhr !== null)
        {
            xhr.open("GET", URL);
            xhr.onreadystatechange = function()
            {
                if (xhr.readyState === 4 && xhr.status === 200)
                {
                    al = xhr.responseText;
                    al = Trim(al);

                    if (al === "LOGIN") {
                        window.location.href = "SCREEN/main.html";
                    } else if (al === "edit") {
                        confirmDialogEdit(array);
                    } else {
                        if (al !== "") {
                            alert(al);
                            ResetParameter(IDname);
                        } else {
                            ResetParameter(IDname);
                        }
                        //ResetParameter();
                    }

                }
                //obj.innerHTML = "status:" + xhr.responseText;
            };
        }
        xhr.send(null);
    }
    /*if(al != ""){
     
     }*/
}
//---------------------------------------------------------------------
function getEdit(array)//การส่งข้อมูลแบบ Ajax
{
    //var obj = getId(show);
    var URL = array[0];
    var IDname = array[1];
    var xhr = createRequestObject();
    var chknull = new Array;
    chknull = IDname.split(",");
    var al;
    if (ChkParameter(chknull)) {
        if (xhr !== null)
        {
            xhr.open("GET", URL + "&confirm=true");
            xhr.onreadystatechange = function()
            {
                if (xhr.readyState === 4 && xhr.status === 200)
                {
                    al = xhr.responseText;
                    al = Trim(al);

                    if (al !== "") {
                        alert(al);
                        ResetParameter(IDname);
                    } else {
                        ResetParameter(IDname);
                    }


                }
            };
        }
        xhr.send(null);
    }
    /*if(al != ""){
     
     }*/
}
//---------------------------------------------------------------------
function getEdit_img(array)//การส่งข้อมูลแบบ Ajax
{
    //var obj = getId(show);
    var URL = array[0];
    var IDname = array[1];
    var xhr = createRequestObject();
    var chknull = new Array;
    chknull = IDname.split(",");
    var al;
    if (ChkParameter(chknull)) {
        if (xhr !== null)
        {
            xhr.open("GET", URL + "&confirm=true");
            xhr.onreadystatechange = function()
            {
                if (xhr.readyState === 4 && xhr.status === 200)
                {
                    al = xhr.responseText;
                    al = Trim(al);
                    if (al !== "") {
                        alert(al);
                        document.getElementById("imgLoading").style.display = 'none';
                        document.getElementById("showpage").style.display = '';
                        ResetParameter();
                    } else {
                        document.getElementById("imgLoading").style.display = 'none';
                        document.getElementById("showpage").style.display = '';
                        ResetParameter(IDname);
                    }
                }
            };
        }
        xhr.send(null);
    }
}
//---------------------------------------------------------------------
function LTrim(str) {
    if (str === null) {
        return null;
    }
    for (var i = 0; str.charAt(i) === "\n"; i++)
        ;
    return str.substring(i, str.length);
}
function RTrim(str) {
    if (str === null) {
        return null;
    }
    for (var i = str.length - 1; str.charAt(i) === "\n"; i--)
        ;
    return str.substring(0, i + 1);
}
function Trim(str) {
    return LTrim(RTrim(str));
}
//---------------------------------------------------------------------
function gettoShow(dataInput, getIdshow)//เรียกข้อมูลตอน Brown แล้วข้อมูลทั้งหมดจะไปอยู่ที่ช่องที่กำหนดให้
{
    var arryData = new Array;
    var arryID = new Array;
    arryData = dataInput.split("|");
    arryID = getIdshow.split("|");

    //alert(arryData + " - " + arryID);

    for (var i = 0; i < arryData.length; i++)
    {
        if (arryID[i] === "status") { //---> ตรวจสอบ สถานะพนักงาน
            if (arryData[i] === "Y") { //---> ตรวจสอบ ค่า Null
                opener.document.getElementById("radio1").checked = true;
            } else
                opener.document.getElementById("radio2").checked = true;
        }
        if (arryID[i] === "qc_check") {
            if (arryData[i] === "Y") {
                senddataPopup("chkbox_qc").checked = true;
            } else {
                senddataPopup("chkbox_qc").checked = false;
            }
        }
        if (arryID[i] === "type_cost") {
            if (arryData[i] === "Y") {
                senddataPopup("type_cost").checked = true;
                opener.document.getElementById("cost_value").readOnly = true;
            } else {
                senddataPopup("type_cost").checked = false;
                opener.document.getElementById("cost_value").readOnly = false;
            }
        }

        if (arryID[i] === "A_complete_flag" || arryID[i] === "complete_flag")
        {
            senddataPopup(arryID[i]).checked = arryData[i] === "Y" ? true : false;
            senddataPopup(arryID[i]).value = arryData[i] === "Y" ? "Y" : "N";
            senddataPopup(arryID[i]).disabled = arryData[i] === "N" ? false : true;
        }    

        if (arryData[i] !== "null") {
            if (arryID[i] === "A_percent_1" || arryID[i] === "A_percent_2" || arryID[i] === "A_percent_3" || arryID[i] === "A_percent_4"
                    || arryID[i] === "A_percent_5" || arryID[i] === "A_percent_6" || arryID[i] === "A_percent_7" || arryID[i] === "A_percent_8") {
                opener.document.getElementById(arryID[i]).value = arryData[i].replace('', '0');
            }
        }

        if (arryData[i] !== "null") {
            if (arryID[i] === "remark") {
                for (var y = 0; y < arryData[i].length; y++) {
                    arryData[i] = arryData[i].replace('<br>', '\n');
                }
                opener.document.getElementById(arryID[i]).value = arryData[i].replace('<br>', '\n');
            } else {
                opener.document.getElementById(arryID[i]).value = arryData[i].replace(/(3422042#34)/g, "\"").replace(/(3927047#39)/g, "\'");
            }


        } else {
            opener.document.getElementById(arryID[i]).value = '';
        }

    }
    window.close();
}
//---------------------------------------------------------------------
function IsNumeric(sText, obj)//javascript ที่ดักข้อมูลตัวเลข  keyup sText= this.value,obj = this;
{
    var ValidChars = "0123456789.";
    var IsNumber = true;
    var Char;
    for (i = 0; i < sText.length && IsNumber === true; i++)
    {
        Char = sText.charAt(i);
        if (ValidChars.indexOf(Char) === -1)
        {
            IsNumber = false;
        }
    }
    if (IsNumber === false) {
        alert("กรุณากรอกข้อมูลด้วยตัวเลขเท่านั้น");
        obj.value = sText.substr(0, sText.length - 1);
    }
}
//---------------------------------------------------------------------
function URLsend(IDname, URLwork)//เป็นการรวมข้อมูลการก่อนการSend ID=name áÅÐ ID=code  àÇÅÒàÃÕÂ¡ãªé ¡ç¨Ðà»ç¹ URLsend('name,code',test.jsp) ¤èÒ·Õèä´é¡ÅÑºÁÒ¨Ðà»ç¹  test.jsp?name=&code=
{
    var URL = URLwork + "?";
    var arry = new Array;
    arry = IDname.split(",");

    for (var i = 0; i < arry.length; i++)
    {
        if (i === 0)
        {
            URL = URL + arry[i] + "=" + encodeToHex(getId(arry[i]).value);
        }
        else
        {
            //alert(URL);
            URL = URL + "&" + arry[i] + "=" + encodeToHex(getId(arry[i]).value);
        }
    }
    var arry2 = new Array;
    arry2[0] = URL;
    arry2[1] = IDname;
    return arry2;

}

//---------------------------------------------------------------------
function confirmDialogSave(URL)
{
    var r = confirm("คุณต้องการบันทึกใช่หรือไม่");
    if (r === true)
    {
        getSave(URL);
    }

}
//---------------------------------------------------------------------
function confirmDialogDelete(URL)//
{
    var r = confirm("คุณต้องการลบข้อมูลนี้ใช่หรือไม่");
    if (r === true)
    {
        getSave(URL);
    }
}
//-----------------------------------------------------------------------
function confirmDialogEdit(URL)
{
    var r = confirm("คุณต้องการแก้ไขข้อมูลนี้ใช่หรือไม่");
    if (r === true)
    {
        getEdit(URL);
    }

}
//-----------------------------------------------------------------------
function confirmDialogEdit_img(URL)
{
    var r = confirm("คุณต้องการแก้ไขข้อมูลนี้ใช่หรือไม่");
    if (r === true)
    {
        getEdit_img(URL);
    } else {
        document.getElementById("imgLoading").style.display = 'none';
        document.getElementById("showpage").style.display = '';
    }

}
//---------------------------------------------------------------------
function ResetParameter(IDname)//ยกเลิกข้อมูลทั้งหมดของหน้าจอ
{
    cancelAction();
    /* var arryID = new Array;
     arryID = IDname.split(",");
     for(i=0; i < arryID.length; i++)
     {
     if(arryID[i] == "status_d" || arryID[i] == "chkstatus")
     getId(arryID[i]).value = "3";
     else if(arryID[i] == "chkNull"){
     
     }else
     getId(arryID[i]).value = "";
     }*/
}
//---------------------------------------------------------------------
function ChkParameter(ChkNull)//ตรวจสอบข้อมูลที่กำหนดว่ามีการกรอกหรือยังไม่ทำการกรอกถ้ายังกรอกไม่ครบจะทำการระบุช่องที่กรอกข้อมูลให้
{
    var re = true;
    if (ChkNull[0] === 'chkNull') {
        var arryID = new Array;
        arryID = getId(ChkNull[0]).value.split(",");
        for (var i = 0; i < arryID.length; i++)
        {
            if (getId(arryID[i]).value === "") {
                alert('ข้อมูลไม่ครบถ้วน');
                getId(arryID[i]).focus();
                re = false;
                break;
            }
        }
    }
    return re;
}

//---------------------------------------------------------------------

function gettoShowpage4(dataInput, getIdshow)//การบันทึกหน้าจอของ CS_004
{
    var arryData = new Array;
    var arryID = new Array;
    arryData = dataInput.split(",");

    //alert(arryData.valueOf()+arryData.length);
    arryID = getIdshow.split(",");
    //alert(arryID.valueOf());
    for (i = 0; i < arryData.length - 1; i++)
    {
        if (arryData[i] === arryID[i])
        {
            senddataPopup(arryID[i]).checked = true;
            senddataPopup(arryID[i]).value = arryData[i];
        }
        else
        {
            senddataPopup(arryID[i]).checked = false;
        }
        //else
        //{
        //	senddataPopup(arryID[i]).checked = false;
        //}

        senddataPopup(arryID[i]).value = arryData[i];

    }
    window.close();
}
//---------------------------------------------------------------------
function cancelAction()//การ Reset หน้าจอทั้งหมด
{
    var formInputs = document.getElementsByTagName('input');
    for (var i = 0; i < formInputs.length; i++) {
        var theInput = formInputs[i];
        if (theInput.type === 'text' || theInput.type === 'checkbox' || theInput.type === 'radio' || theInput.type === 'password') {
            if (theInput.type === 'checkbox' || theInput.type === 'radio') {
                theInput.checked = false;
                theInput.disabled = false;
            } else {
                if (theInput.id !== "process_id" && theInput.id !== "process_name") {
                    theInput.value = '';
                    theInput.checked = false;
                    theInput.disabled = false;
                }

            }
        }
    }
    var formArea = document.getElementsByTagName('textarea');
    for (var j = 0; j < formArea.length; j++) {
        var theArea = formArea[j];
        theArea.value = '';
    }
}

//---------------------------------------------------------------------
function Delete_Line_no(URL)
{
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        // alert(URL+getId(Valueinput).value+"&ts="+Math.random()+new Date().getTime());
        requestObject.open("GET", URL + "&ts=" + Math.random() + new Date().getTime());

        //alert(URL+senddataPopup(Valueinput).value+"&ts="+Math.random()+"&ts2="+new Date().getTime());

        //alert(requestObject.responseText);
        requestObject.onreadystatechange = function()
        {
            //alert(requestObject.responseText);

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                //alert("สำเร็จ");
                //obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
//window.close();
}
//---------------------------------------------------------------------
function showTableNonPopup(DivShow, Valueinput, URL)//ส่งพารามิเตอร์ได้1ตัว
{
    var obj = getId(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        // alert(URL+getId(Valueinput).value+"&ts="+Math.random()+new Date().getTime());
        requestObject.open("GET", URL + getId(Valueinput).value + "&ts=" + Math.random() + new Date().getTime());

        //alert(URL+senddataPopup(Valueinput).value+"&ts="+Math.random()+"&ts2="+new Date().getTime());

        //alert(requestObject.responseText);
        requestObject.onreadystatechange = function()
        {
            //alert(requestObject.responseText);

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
//window.close();


}
//---------------------------------------------------------------------
function showTableNonPopup2(DivShow, Valueinput1, URL)//ส่งพารามิเตอร์ได้หลายตัว
{
    var obj = getId(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        var split_id = Valueinput1.split(",");
        for (var i = 0; i < split_id.length; i++) {
            if (i === 0) {
                URL += "?" + split_id[i] + "=" + encodeToHex(getId(split_id[i]).value);
            } else {
                URL += "&" + split_id[i] + "=" + encodeToHex(getId(split_id[i]).value);
            }
        }
        //alert(URL);
        requestObject.open("GET", URL + "&ts=" + Math.random() + new Date().getTime());
        requestObject.onreadystatechange = function()
        {
            //alert(requestObject.responseText);

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                //alert("สำเร็จ");
                obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
//window.close();


}
//---------------------------------------------------------------------
//---------------------------------------------------------------------
function showTableNonPopupApprove(DivShow, Value_Process, Value_Table, Value_doc_id, URL)
{
    var obj = getId(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        //alert(URL+"?process_id="+getId(Value_Process).value+"&table="+getId(Value_Table).value+"&doc_id="+getId(Value_doc_id).value+"&ts="+Math.random()+new Date().getTime());
        requestObject.open("GET", URL + "?process_id=" + getId(Value_Process).value + "&table=" + getId(Value_Table).value + "&doc_id=" + getId(Value_doc_id).value + "&ts=" + Math.random() + new Date().getTime());

        //alert(URL+senddataPopup(Valueinput).value+"&ts="+Math.random()+"&ts2="+new Date().getTime());

        //alert(requestObject.responseText);
        requestObject.onreadystatechange = function()
        {
            //alert(requestObject.responseText);

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                //alert("สำเร็จ");
                obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
//window.close();


}
//---------------------------------------------------------------------
function showTable(DivShow, Valueinput, URL)
{
    var obj = senddataPopup(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {

        requestObject.open("GET", URL + senddataPopup(Valueinput).value + "&ts=" + Math.random() + new Date().getTime());
        requestObject.onreadystatechange = function()
        {
            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }


}
//---------------------------------------------------------------------
function showTable2(DivShow, Valueinput1, URL)
{
    var obj = senddataPopup(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        var split_id = Valueinput1.split(",");
        for (var i = 0; i < split_id.length; i++) {
            if (i === 0) {
                URL += "?" + split_id[i] + "=" + encodeToHex(getId(split_id[i]).value);
            } else {
                URL += "&" + split_id[i] + "=" + encodeToHex(getId(split_id[i]).value);
            }
        }
        //alert(URL);
        requestObject.open("GET", URL + "&ts=" + Math.random() + new Date().getTime());
        requestObject.onreadystatechange = function()
        {
            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }


}

//---------------------------------------------------------------------

var my_window = null;

function openBrWindow(table, page, jsp) { //v2.0
    if (my_window === null) {
        openpopup(table, page, jsp);

    } else {
        closepopup();
        openpopup(table, page, jsp);
    }
}

function openpopup(table, page, jsp) {

    var t;
    t = '../SEARCHSCREEN/' + jsp + '?page=' + page + '&table=' + table;
    if (jsp.trim() === ("Search_Config2.jsp")) {
        my_window = window.open(t, "mywindow", "status=1,width=700,height=530");
    } else {
        my_window = window.open(t, "mywindow", "status=1,width=700,height=500");
    }


}

function closepopup() {
    if (false === my_window.closed) {
        my_window.close();
    }
}

//---------------------------------------------------------------------
function IsNumber2(sText, obj) {
    var ValidChars = "0123456789";
    var IsNumber = true;
    var Char;
    for (i = 0; i < sText.length && IsNumber === true; i++)
    {
        Char = sText.charAt(i);
        if (ValidChars.indexOf(Char) === -1)
        {
            IsNumber = false;
            break;
        }
    }

    if (IsNumber === false) {
        alert("กรุณาพิมพ์เฉาะตัวเลขเท่านั้น");
        //obj.value=sText.substr(0,sText.length-1);
        obj.value = 0;
    }
}
//--------------------------------------------------------------------
function IsNuber(sText, obj)//javascript ตัวเลขอย่างเดียว  keyup sText= this.value,obj = this;
{
    var ValidChars = "0123456789.";
    var IsNumber = true;
    var Char;
    var Isdot = 0;
    var ckreplate = 0;
    for (i = 0; i < sText.length && IsNumber === true; i++)
    {
        Char = sText.charAt(i);
        if (ValidChars.indexOf(Char) === -1)
        {
            IsNumber = false;
        }
        //alert(sText);

        Isdot = (Char.indexOf(".") !== -1) ? Isdot + 1 : Isdot;
        //alert(Isdot);

    }
    /*for(var i = 0 ; i<sText.length ;i++){
     Isdot = (sText.indexOf(".",) != -1)?Isdot+1:Isdot;
     }*/
    if (IsNumber === false) {
        alert("กรุณาพิมพ์เฉาะตัวเลขเท่านั้น");
        //obj.value=sText.substr(0,sText.length-1);
        obj.value = 0;
    }

    if (Isdot > 1) {
        for (var i = 0; i < sText.length; i++) {
            Char = sText.charAt(i);
            if (Char.indexOf(".") !== -1 && ckreplate === 0) {
                ckreplate = 1;
            }
            else if (Char.indexOf(".") !== -1 && ckreplate === 1) {
                sText = sText.substr(0, i);
                obj.value = parseFloat(sText).toFixed(2);
                break;
            }

        }
    }
}
//---------------------------------------------------------------------
function MyDate(lang) {
    NDate = new Date();
    var thday = new Array("อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัส", "ศุกร์", "เสาร์");
    var engDay = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
    var thmonth = new Array("มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม");
    var engMonth = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
    //var thDate=thday[NDate.getDay()]+", "+NDate.getDate()+" "+thmonth[NDate.getMonth()]+" "+(NDate.getYear()+543);
    var thDate = thday[NDate.getDay()] + ", " + NDate.getDate() + " " + thmonth[NDate.getMonth()] + " " + (NDate.getUTCFullYear() + 543);
    var engDate = engDay[NDate.getDay()] + ", " + NDate.getDate() + " " + engMonth[NDate.getMonth()] + " " + NDate.getYear();
    var result = "";
    if (lang === "tha") {
        result = thDate;
    } else {
        result = engDate;
    }
    document.write(result);
}
//---------------------------------------------------------------------
function getData_d_rawmatt_receive(URL, idshow)
{
    var arrayidshow = new Array;
    var arraycal = new Array;
    arrayidshow = idshow.split(",");
    var requestObject = createRequestObject();
    if (requestObject)
    {
        requestObject.open("GET", URL + "&ts=" + Math.random() + new Date().getTime());
        requestObject.onreadystatechange = function()
        {
            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                var arraycal = Trim(requestObject.responseText).split(",");
                for (var i = 0; i < arraycal.length; i++) {
                    getId(arrayidshow[i]).value = arraycal[i];
                }

            }
        };
        requestObject.send(null);
    }
}
function Delete_Line_no(URL)
{
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        // alert(URL+getId(Valueinput).value+"&ts="+Math.random()+new Date().getTime());
        requestObject.open("GET", URL + "&ts=" + Math.random() + new Date().getTime());

        //alert(URL+senddataPopup(Valueinput).value+"&ts="+Math.random()+"&ts2="+new Date().getTime());

        //alert(requestObject.responseText);
        requestObject.onreadystatechange = function()
        {
            //alert(requestObject.responseText);

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                //alert("เธชเธณเน€เธฃเน�เธ�");
                //obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
//window.close();
}

function Delete_Line_no_ShowTotal(URL, IDshowTotal)//140754
{

    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        requestObject.open("GET", URL + "&ts=" + Math.random() + new Date().getTime());
        requestObject.onreadystatechange = function()
        {

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                //alert(Trim(requestObject.responseText));
                if (Trim(requestObject.responseText) !== "-1")
                    getId(IDshowTotal).value = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
//window.close();
}
function Delete_Line_no_ShowTotal2(URL, IDshowTotal)//140754
{
    var arryID = new Array;
    var arryShow = new Array;
    arryID = IDshowTotal.split(",");
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        // alert(URL+getId(Valueinput).value+"&ts="+Math.random()+new Date().getTime());
        requestObject.open("GET", URL + "&ts=" + Math.random() + new Date().getTime());

        //alert(URL+senddataPopup(Valueinput).value+"&ts="+Math.random()+"&ts2="+new Date().getTime());

        //alert(requestObject.responseText);
        requestObject.onreadystatechange = function()
        {

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                //alert(Trim(requestObject.responseText));

                if (Trim(requestObject.responseText) !== "-1") {
                    arryShow = Trim(requestObject.responseText).split(",");
                    for (i = 0; i < arryID.length; i++) {
                        getId(arryID[i]).value = arryShow[i];
                    }
                }

            }

        };
        requestObject.send(null);

    }
//window.close();
}

//---------------------------ไว้โชว์ข้อมูลส่วน Detail แบบ Ajax------------------------------------------
function sendShow_Detail(URLShowDetail, DivShow, Valueinput) {
    var obj = senddataPopup(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {

        requestObject.open("GET", URLShowDetail + Valueinput + "&ts=" + Math.random() + new Date().getTime());
        requestObject.onreadystatechange = function()
        {
            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
}
function gettoShow_Doc_id(dataInput, getIdshow, URLShowDetail, DivShow, Valueinput)
{
    sendShow_Detail(URLShowDetail, DivShow, Valueinput);
    var arryData = new Array;
    var arryID = new Array;
    arryData = dataInput.split("|");
    arryID = getIdshow.split("|");
    for (var i = 0; i < arryData.length; i++)
    {
        //alert(arryData[i] );
        //senddataPopup(arryID[0]).readOnly =true;
        if (arryData[i] !== "null") {

            if (arryID[i] === "A_complete_flag" || arryID[i] === "A_doc_confirm") {
                opener.document.getElementById(arryID[i]).value = arryData[i];
                opener.document.getElementById(arryID[i]).checked = arryData[i] === "N" ? false : true;
                opener.document.getElementById(arryID[i]).disabled = arryData[i] === "N" ? false : true;
            }            
            

            //alert(arryData[i]);
            //opener.document.getElementById(arryID[i]).value = arryData[i];
            if (arryID[i] === "remark") {
                for (var y = 0; y < arryData[i].length; y++) {
                    arryData[i] = arryData[i].replace('<br>', '\n');
                }
                opener.document.getElementById(arryID[i]).value = arryData[i].replace('<br>', '\n');
            } else {
                if (arryData[i] === "Y") {
                    opener.document.getElementById(arryID[i]).checked = arryData[i] === "Y" ? true : false;
                    opener.document.getElementById(arryID[i]).value = arryData[i];
                } else {
                    opener.document.getElementById(arryID[i]).value = arryData[i];
                }

            }
            //senddataPopup(arryID[i]).value = arryData[i];
        } else {

            senddataPopup(arryID[i]).value = "";
            //opener.document.getElementById(arryID[i]).value = '';
        }
        
        //senddataPopup(arryID[i]).value = arryData[i];

    }
    //gettoShow(dataInput, getIdshow);
    senddataPopup("status_cancle").value = "1";
    setTimeout('window.close()', 1000);
}

function gettoShow_Doc_id2(dataInput, getIdshow, URLShowDetail, DivShow, DivShow2, Valueinput)
{
    var splitURL = URLShowDetail.split(",");
    sendShow_Detail(splitURL[0], DivShow, Valueinput);
    sendShow_Detail(splitURL[1], DivShow2, Valueinput);

    //alert("URLShowDetail = " + URLShowDetail);

    var arryData = new Array;
    var arryID = new Array;

    arryData = dataInput.split("|");
    arryID = getIdshow.split("|");
    for (var i = 0; i < arryData.length; i++)
    {
        if (arryData[i] !== "null") {

            if (arryID[i] === "A_complete_flag" || arryID[i] === "A_doc_confirm") {
                opener.document.getElementById(arryID[i]).value = arryData[i];
                opener.document.getElementById(arryID[i]).checked = arryData[i] === "N" ? false : true;
                opener.document.getElementById(arryID[i]).disabled = arryData[i] === "N" ? false : true;
            }   
            //alert(arryData[i]);
            //opener.document.getElementById(arryID[i]).value = arryData[i];
            if (arryID[i] === "A_remark") {
                for (var y = 0; y < arryData[i].length; y++) {
                    arryData[i] = arryData[i].replace('<br>', '\n');
                }
                senddataPopup(arryID[i]).value = arryData[i].replace('<br>', '\n');
            } else if (arryData[i] === "N" || arryData[i] === "Y") {
                if (arryData[i] === "Y") {
                    senddataPopup(arryID[i]).checked = true;
                    senddataPopup(arryID[i]).value = arryData[i];
                } else {
                    senddataPopup(arryID[i]).checked = false;
                    senddataPopup(arryID[i]).value = arryData[i];
                }
            } else if (arryID[i] === "A_base_plate") {
                senddataPopup(arryID[i]).value = arryData[i];
                if (arryData[i] === "1") {
                    senddataPopup("base_plate1").checked = true;
                    senddataPopup("A_base_plate_qty").disabled = true;
                    senddataPopup("A_wrap_on_pallet").disabled = true;
                    senddataPopup("A_pallet_qty").disabled = true;
                } else if (arryData[i] === "2") {
                    senddataPopup("base_plate2").checked = true;
                    senddataPopup("A_base_plate_qty").disabled = false;
                    senddataPopup("A_wrap_on_pallet").disabled = true;
                    senddataPopup("A_pallet_qty").disabled = true;
                } else {
                    senddataPopup("base_plate3").checked = true;
                    senddataPopup("A_base_plate_qty").disabled = true;
                    senddataPopup("A_wrap_on_pallet").disabled = false;
                    senddataPopup("A_pallet_qty").disabled = false;
                }
            } else {
                senddataPopup(arryID[i]).value = arryData[i];
            }
        } else {

            senddataPopup(arryID[i]).value = "";
        }
        senddataPopup("status_cancle").value = "1";
    }


    setTimeout('window.close()', 1000);
}

function gettoShow_Doc_id3(dataInput, getIdshow, URLShowDetail, DivShow, DivShow1, DivShow2, DivShow3, DivShow4, Valueinput)
{
    var splitURL = URLShowDetail.split(",");
    sendShow_Detail(splitURL[0], DivShow, Valueinput);
    sendShow_Detail(splitURL[1], DivShow1, Valueinput);
    sendShow_Detail(splitURL[2], DivShow2, Valueinput);
    sendShow_Detail(splitURL[3], DivShow3, Valueinput);
    sendShow_Detail(splitURL[4], DivShow4, Valueinput);

    var arryData = new Array;
    var arryID = new Array;

    //alert("gettoShow_Doc_id3 = URLShowDetail = " + URLShowDetail);

    arryData = dataInput.split("|");
    arryID = getIdshow.split("|");
    for (var i = 0; i < arryData.length; i++)
    {
        if (arryData[i] !== "null") {
            //alert(arryData[i]);
            //opener.document.getElementById(arryID[i]).value = arryData[i];
            if (arryID[i] === "A_remark") {
                for (var y = 0; y < arryData[i].length; y++) {
                    arryData[i] = arryData[i].replace('<br>', '\n');
                }
                senddataPopup(arryID[i]).value = arryData[i].replace('<br>', '\n');
            } else if (arryData[i] === "N" || arryData[i] === "Y") {
                if (arryData[i] === "Y") {
                    senddataPopup(arryID[i]).checked = true;
                    senddataPopup(arryID[i]).value = arryData[i];
                } else {
                    senddataPopup(arryID[i]).checked = false;
                    senddataPopup(arryID[i]).value = arryData[i];
                }
            } else if (arryID[i] === "A_base_plate") {
                senddataPopup(arryID[i]).value = arryData[i];
                if (arryData[i] === "1") {
                    senddataPopup("base_plate1").checked = true;
                    senddataPopup("A_base_plate_qty").disabled = true;
                    senddataPopup("A_wrap_on_pallet").disabled = true;
                    senddataPopup("A_pallet_qty").disabled = true;
                } else if (arryData[i] === "2") {
                    senddataPopup("base_plate2").checked = true;
                    senddataPopup("A_base_plate_qty").disabled = false;
                    senddataPopup("A_wrap_on_pallet").disabled = true;
                    senddataPopup("A_pallet_qty").disabled = true;
                } else {
                    senddataPopup("base_plate3").checked = true;
                    senddataPopup("A_base_plate_qty").disabled = true;
                    senddataPopup("A_wrap_on_pallet").disabled = false;
                    senddataPopup("A_pallet_qty").disabled = false;
                }
            } else {
                senddataPopup(arryID[i]).value = arryData[i];
            }
        } else {

            senddataPopup(arryID[i]).value = "";
        }
        senddataPopup("status_cancle").value = "1";
    }


    setTimeout('window.close()', 1000);
}
//**************************************เข้ารหัสเป็น ASCII *************************************************
function encodeToHex(str) {
    var r = "";
    var e = str.length;
    var c = 0;
    var h;
    while (c < e) {
        h = str.charCodeAt(c++).toString(16);
        if (h.indexOf("e") === 0)
        {
            h = (parseInt(h, 16) - parseInt("D60", 16)).toString(16);
            r += "%" + h;
        }
        else {
            if (h !== "d" && h !== "a") {
                r += "%" + h;
            } else {
                r += "<br>";
                c++;
            }

        }

    }
    //alert(str);
    return r;
}

//*****************************Search_Detail.jsp*****************************************

function gettoShow_Detail(dataInput, getIdshow) {
    if (dataInput.indexOf("|") !== -1 && getIdshow.indexOf("|") !== -1) {
        var arryData = new Array;
        var arryID = new Array;
        arryData = dataInput.split("|");
        arryID = getIdshow.split("|");
        for (var i = 0; i < arryData.length; i++)
        {
            senddataPopup(arryID[i]).value = arryData[i];
        }
    } else {
        if (dataInput.indexOf("|") !== -1) {
            dataInput = dataInput.substr(0, dataInput.indexOf("|"));
        }
        //alert(dataInput);
        senddataPopup(getIdshow).value = dataInput;
    }
    window.close();

}
function cancle_chkboxAll(IDcheckboxall, thisvalue) {

    if (thisvalue === false) {
        getId(IDcheckboxall).checked = false;
    }
}
/*
 function SendReport(URL)
 {
 var requestObject = createRequestObject();
 //alert(URL[0]);
 if(requestObject != null)
 {
 // alert(URL+getId(Valueinput).value+"&ts="+Math.random()+new Date().getTime());
 requestObject.open("GET",URL[0]+"&ts="+Math.random()+new Date().getTime());
 
 //alert(URL+senddataPopup(Valueinput).value+"&ts="+Math.random()+"&ts2="+new Date().getTime());
 
 //alert(requestObject.responseText);
 requestObject.onreadystatechange = function()
 {
 //alert(requestObject.responseText);
 
 if(requestObject.readyState == 4 && requestObject.status == 200)
 {
 //alert("เธชเธณเน€เธฃเน�เธ�");
 //obj.innerHTML = requestObject.responseText;
 }
 
 }
 requestObject.send(null);
 
 }
 //window.close();
 
 }*/
function select_value() {
    getId("product_id_select").value = getId("product_id").value;
}
function click_value() {
    getId("product_id").value = getId("product_id_select").value;
}
function format_Date(str) {
    return str.substr(6, 4) + "-" + str.substr(3, 2) + "-" + str.substr(0, 2);
}
function SelectBoxSearch(value, inputname, stadment) {
    var str = "";
    str = " and " + value + " = '" + getId(inputname).value + "'";
    getId(stadment).value = str;
}
function getsaveApprove(Data, textArea) {

    var URL = Data[0];
    var IDname = Data[1];
    var xhr = createRequestObject();
    var al;
    if (xhr !== null)
    {
        xhr.open("GET", URL);
        getId(textArea).value = "กำลังอนุมัติเอกสาร..........กรุณารอสักครู่";
        xhr.onreadystatechange = function()
        {

            if (xhr.readyState === 4 && xhr.status === 200)
            {

                al = xhr.responseText;
                al = Trim(al);
                //alert(al);
                getId(textArea).value = al;
                //ResetParameter(IDname);
                //alert(URL.indexOf(encodeToHex("PR_040")));
                /*if(URL.indexOf(encodeToHex("PR_040")) != -1){
                 
                 document.btform.but1.disabled = false;
                 document.btform.but3.disabled = false;
                 }*/

            }
        };
    }
    xhr.send(null);
//}
}

function getsaveApprove2(Data, textArea) {
    var count = 0;
    var URL = Data[0];
    var IDname = Data[1];
    var xhr = createRequestObject();
    var al;
    if (xhr !== null)
    {
        xhr.open("GET", URL);
        getId(textArea).value = "กำลังประมวลผล..........กรุณารอสักครู่";
        xhr.onreadystatechange = function()
        {
            if (xhr.readyState === 4 && xhr.status === 200)
            {

                al = xhr.responseText;
                al = Trim(al);
                getId(textArea).value = al;

            }
        };
    }
    xhr.send(null);
//}
}

function AjaxRun_id(TextShow, URL) {
    var xhr = createRequestObject();
    if (xhr !== null)
    {
        xhr.open("GET", URL);
        xhr.onreadystatechange = function()
        {
            //getId(textArea).value = "กำลังอนุมัติเอกสาร..........กรุณารอสักครู่";
            if (xhr.readyState === 4 && xhr.status === 200)
            {
                getId(TextShow).value = Trim(xhr.responseText);
            }
        };
    }
    xhr.send(null);
}

function ChkDate(Date_from, Date_to) {
    var return_chk = false;
    var number_day_from = parseInt(Date_from.substr(0, 2), 10);
    var number_month_from = parseInt(Date_from.substr(3, 2), 10);
    var number_year_from = parseInt(Date_from.substr(6, 4), 10);
    var number_day_to = parseInt(Date_to.substr(0, 2), 10);
    var number_month_to = parseInt(Date_to.substr(3, 2), 10);
    var number_year_to = parseInt(Date_to.substr(6, 4), 10);
    var ans_day = number_day_to - number_day_from;
    //alert(ans_day);
    var ans_month = number_month_to - number_month_from;
    //alert(ans_month);
    var ans_year = number_year_to - number_year_from;
    //alert(ans_year);
    if (ans_year < 0) {
        return_chk = true;
    } else if (ans_year === 0) {
        if (ans_month < 0) {
            return_chk = true;
        } else if (ans_month === 0) {
            if (ans_day < 0) {
                return_chk = true;
            } else if (ans_day === 0) {
                return_chk = false;
            } else {
                return_chk = false;
            }
        } else {

            return_chk = false;
        }
    } else {
        return_chk = false;
    }
    return return_chk;
}
function getLogin(Data) {

    var URL = Data[0];
    var IDname = Data[1];
    var xhr = createRequestObject();
    var al;
    if (xhr !== null)
    {
        xhr.open("GET", URL);
        document.getElementById("imgLoading").style.display = '';
        document.getElementById("button").style.display = 'none';
        xhr.onreadystatechange = function()
        {


            if (xhr.readyState === 4 && xhr.status === 200)
            {

                al = xhr.responseText;
                al = Trim(al);
                if (al === "LOGIN") {
                    window.location.href = "SCREEN/main.html";
                } else {
                    alert(al);
                    document.getElementById("imgLoading").style.display = 'none';
                    document.getElementById("button").style.display = '';
                    ResetParameter();
                }
            }
        };
        //
        xhr.send(null);
        //return al;
    }


//}
}
//----------------------------เป็นการนับจำนวนวันตั้งแต่วันถึงวัน-------------จะได้ค่าจำนวยวันทั้งหมดเช่น from 01-01-2554,to 10-01-2554  จะได้ทั้งหมด 10วัน
function Count_Date(value_date_from, value_date_to) {
    var count_date = 0;
    var day_2 = 0;
    //--------------------date_to---------------------------
    var d_to = parseInt(value_date_to.substr(0, 2), 10);
    var m_to = parseInt(value_date_to.substr(3, 2), 10);
    var y_to = parseInt(value_date_to.substr(6, 4), 10);
    //--------------------date_from-------------------------
    var d_from = parseInt(value_date_from.substr(0, 2), 10);
    var m_from = parseInt(value_date_from.substr(3, 2), 10);
    var y_from = parseInt(value_date_to.substr(6, 4), 10);
    //-------------------------------------------------------
    if ((y_to - y_from) === 0) {
        if ((m_to - m_from) === 0) {
            count_date = (d_to - d_from) + 1;
        } else if ((m_to - m_from) === 1) {
            if (m_from === 2) {
                day_2 = ((y_from - 543) % 4) === 0 ? 29 : 28;
                day_2 = (day_2 - d_from) + 1;
                count_date = day_2 + d_to;
            } else if (m_from === 4 || m_from === 6 || m_from === 9 || m_from === 11) {
                count_date = (30 - d_from) + 1;
                count_date = count_date + d_to;
            } else {
                count_date = (31 - d_from) + 1;
                count_date = count_date + d_to;
            }
        } else {
            count_date = 0;
        }

    }
    return count_date;
}

function getsave_imgload(Data) {

    var URL = Data[0];
    var IDname = Data[1];
    var xhr = createRequestObject();
    var chknull = new Array;
    chknull = IDname.split(",");
    var al;
    if (ChkParameter(chknull)) {
        if (xhr !== null)
        {
            xhr.open("GET", URL);
            xhr.onreadystatechange = function()
            {
                document.getElementById("imgLoading").style.display = '';
                document.getElementById("showpage").style.display = 'none';

                if (xhr.readyState === 4 && xhr.status === 200)
                {

                    al = xhr.responseText;
                    al = Trim(al);
                    if (al === "edit") {
                        confirmDialogEdit_img(Data);
                    } else {
                        if (al !== "") {
                            alert(al);
                            document.getElementById("imgLoading").style.display = 'none';
                            document.getElementById("showpage").style.display = '';
                            ResetParameter();
                        } else {
                            document.getElementById("imgLoading").style.display = 'none';
                            document.getElementById("showpage").style.display = '';
                            ResetParameter(IDname);
                        }
                    }
                }
            };
        }
        xhr.send(null);
    }
//}
}
function getIDElements(inputType, Check_indexOf) {
    var strId = "";
    var formInputs = document.getElementsByTagName(inputType);
    for (var i = 0; i < formInputs.length; i++) {

        var theInput = formInputs[i];
        //if(theInput.type == 'text' || theInput.type){
        if (theInput.id.toString().indexOf(Check_indexOf) !== -1) {
            strId += theInput.id.toString() + ",";
        }

        //}

    }
    return strId;
}
//-----------------------------เวลาเลือกหน้าหย่อยของส่วนdetail----------------------------------------
function showTableNonPopup_Detail(DivShow, Valueinput, Screen, URL)//ส่งพารามิเตอร์ได้2ตัว
{
    var obj = getId(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        // alert(URL+getId(Valueinput).value+"&ts="+Math.random()+new Date().getTime());
        //alert(URL+getId(Valueinput).value+"&screen="+getId(Screen).value+"&ts="+Math.random()+new Date().getTime());
        requestObject.open("GET", URL + getId(Valueinput).value + "&screen=" + getId(Screen).value + "&ts=" + Math.random() + new Date().getTime());

        //alert(URL+senddataPopup(Valueinput).value+"&ts="+Math.random()+"&ts2="+new Date().getTime());

        //alert(requestObject.responseText);
        requestObject.onreadystatechange = function()
        {
            //alert(requestObject.responseText);

            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                //alert("สำเร็จ");
                obj.innerHTML = requestObject.responseText;
            }

        };
        requestObject.send(null);

    }
//window.close();


}
function getSave_Detail(array, URLShowDetail, DivShow, Valueinput) {

    var URL = array[0];
    var IDname = array[1];
    var xhr = createRequestObject();
    var chknull = new Array;
    chknull = IDname.split(",");
    var al;
    if (ChkParameter(chknull)) {
        if (xhr !== null)
        {
            //alert(URL);
            xhr.open("GET", URL);
            xhr.onreadystatechange = function()
            {
                if (xhr.readyState === 4 && xhr.status === 200)
                {
                    sendShow_Detail(URLShowDetail, DivShow, Valueinput);
                    al = xhr.responseText;
                    al = Trim(al);

                    if (al === "LOGIN") {
                        window.location.href = "SCREEN/main.html";
                    } else if (al === "edit") {
                        confirmDialogEdit(array);
                    } else {
                        if (al !== "") {
                            alert(al);
                            ResetParameter(IDname);
                        } else {
                            ResetParameter(IDname);
                        }
                        //ResetParameter();
                        window.close();
                    }

                }
                //obj.innerHTML = "status:" + xhr.responseText;
            };
        }
        xhr.send(null);

    }
}

//---------------------------------------------------------------------
function getshow_status(DivShow, Valueinput, URL)//ไว้แสดงหน้า รหัสเอกสารหน้า BW_CS_032
{
    var obj = getId(DivShow);
    var requestObject = createRequestObject();
    if (requestObject !== null)
    {
        requestObject.open("GET", URL + getId(Valueinput).value + "&ts=" + Math.random() + new Date().getTime());
        requestObject.onreadystatechange = function()
        {
            if (requestObject.readyState === 4 && requestObject.status === 200)
            {
                if (requestObject.responseText.replace(/\n/g, "") === "สามารถใช้เลขที่เอกสารนี้ได้") {
                    obj.style.color = "#008000";
                } else {
                    obj.style.color = "#FF0000";
                }

                obj.innerHTML = requestObject.responseText.replace(/\n/g, "");
            }

        };
        requestObject.send(null);

    }
}