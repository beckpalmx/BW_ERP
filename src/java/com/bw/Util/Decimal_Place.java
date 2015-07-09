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
public class Decimal_Place {

    public static float Round(Double Rval, int Rpl) {

        float p = (float) Math.pow(10, Rpl);
        //JOptionPane.showConfirmDialog(null, p);
        System.out.println("P = " + p);
        Rval = Rval * p;
        //JOptionPane.showConfirmDialog(null, Rval);
        System.out.println("Rval = " + Rval + " Replace = " + Rpl);
        float tmp = Math.round(Rval);
        //JOptionPane.showConfirmDialog(null, tmp);
        System.out.println("tmp = " + tmp);
        System.out.println("tmp/p = " + tmp / p);

        return (float) tmp / p;

    }

    public static int Decimal_position(int Rpl) {
        System.out.println("Befor Loop = " + Rpl);
        if ((Rpl >= 1 && Rpl < 10)) {
            Rpl = Rpl * 10;
        }

        if (Rpl > 0 && Rpl <= 49) {
            Rpl = 0;
            //System.out.println("Loop 1 = " + Rpl);
        } else {
            Rpl = 5;
            //System.out.println("Loop 2 = " + Rpl);
        }
        return Rpl;

    }
    
        public static Double Decimal_position_Up_Down(Double Rpl) {
        System.out.println("Befor Loop = " + Rpl);
        if ((Rpl >= 1 && Rpl < 10)) {
            Rpl = Rpl * 10;
        }

        if (Rpl > 0 && Rpl <= 49) {
            Rpl = 0.00;
            //System.out.println("Loop 1 = " + Rpl);
        } else {
            Rpl = 1.00;
            //System.out.println("Loop 2 = " + Rpl);
        }
        return Rpl;

    }

}
