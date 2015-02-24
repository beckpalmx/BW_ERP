/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.Util;

/**
 *
 * @author beckpalmx
 */
public class Check_empty_string_number {

    public String GetNumber(String Number) throws Exception//Get Number
    {
        if (Number.equals("") || Number==null) {
            Number = "0";
        }
        return Number;
    }

}
