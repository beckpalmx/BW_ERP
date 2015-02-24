/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.bean;

/**
 *
 * @author Administrator
 */
public class DataBeanD_Status_id {
    private int int_status;
    public void set_Int_status(int int_status){
        this.int_status = int_status;
    }
    public String get_Int_status(){
        String string_return = new String();
        switch(int_status){
            case 1:
                string_return = "สามารถใช้เลขที่เอกสารนี้ได้";
                break;
            case 2:
                 string_return = "มีเลขที่เอกสารนี้อยู่แล้ว";
                break;
            case 3:
                 string_return = "ไม่สามารถใช้เลขที่เอกสารนี้ได้";
                break;
            default:
                break;
        }
        return string_return;
    }
}
