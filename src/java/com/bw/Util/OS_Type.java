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
public class OS_Type {

    public String GetOS_Type(String Status) throws Exception//Get OS Type
    {
        String OS = "";
        OS = System.getProperty("os.name").substring(0, 3).toUpperCase();
        return OS;
    }

    public String GetPath(String OS) throws Exception//Get Path
    {
        String exp_path = "";
        if (OS.equals("WIN")) {
            exp_path = "D:\\Temp_Upload\\File_Excel\\";
        } else {
            exp_path = "/home/share-disk/cgc/file_excel/";
        }
        return exp_path;
    }

}
