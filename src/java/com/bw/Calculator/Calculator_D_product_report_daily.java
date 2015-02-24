/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bw.Calculator;

import com.bw.bean.DataBeanD_product_report_daily_header;

/**
 *
 * @author Administrator
 */
public class Calculator_D_product_report_daily extends Calculator_BW {

    private String m_time, fresh_skin, soil_skin, percent_tapioca;

    public double Round(double Rval, int Rpl) {

        float p = (float) Math.pow(10, Rpl);
        Rval = Rval * p;
        double tmp = Math.round(Rval);
        return (double) tmp / p;
    }

    public double parserDouble(String input) {
        return Double.parseDouble(input);
    }

    public String Tostring(double input) {
        return Double.toString(input);
    }

    ///--------------------------------------Calculator----------------------------------------------
    //-----------------------------------------------------------------------------------------------
    public DataBeanD_product_report_daily_header MainCalculator(DataBeanD_product_report_daily_header DataBean) {

        return DataBean;
    }

    public String Calculator_Total_milling_time(String M_time, String Total_stop_milling_hour) {
        
        if (M_time.equals("") || M_time == null) {
            M_time = "0.000";
        }  
        
        if (Total_stop_milling_hour.equals("") || Total_stop_milling_hour == null) {
            Total_stop_milling_hour = "0.000";
        }          
        
        return Diff_time(Total_stop_milling_hour, M_time);
    }

    public String Calculator_Milling_ratio(String Amount_cassava, String Total_milling_time) {
        
        if (Total_milling_time.equals("") || Total_milling_time == null) {
            Total_milling_time = "0.000";
        }        
        
        if (parserDouble(Total_milling_time) == 0) {
            return "0.000";
        } else {
            return Tostring(Round(parserDouble(Amount_cassava) / parserDouble(Total_milling_time), 3));
        }
    }

    public String Calculator_Total_roast_time(String r_time, String total_stop_roast_hour) {

        if (r_time.equals("") || r_time == null) {
            r_time = "00.00";
        }

        if (total_stop_roast_hour.equals("") || total_stop_roast_hour == null) {
            total_stop_roast_hour = "00.00";
        }

        return Diff_time(total_stop_roast_hour, r_time);
    }

    public String Calculator_Epower_unit(String epower_milling_from, String epwer_milling_to) {

        if (epower_milling_from.equals("") || epower_milling_from == null) {
            epower_milling_from = "0.000";
        }

        if (epwer_milling_to.equals("") || epwer_milling_to == null) {
            epwer_milling_to = "0.000";
        }

        return Tostring(Round(parserDouble(epwer_milling_to) - parserDouble(epower_milling_from), 3));
    }

    public String Calculator_Water_per_tapioca(String water_use, String qty_prd) {

        if (water_use.equals("") || water_use == null) {
            water_use = "0.000";
        }

        if (qty_prd.equals("") || qty_prd == null) {
            qty_prd = "0.000";
        }

        if (parserDouble(qty_prd) == 0) {
            return "0.000";
        } else {
            return Tostring(Round(parserDouble(water_use) / parserDouble(qty_prd), 3));
        }
    }

    public String Calculator_kw_per_tapioca(String kw_use, String qty_prd) {

        if (kw_use.equals("") || kw_use == null) {
            kw_use = "0.000";
        }
        if (qty_prd.equals("") || qty_prd == null) {
            qty_prd = "0.000";
        }

        if (parserDouble(qty_prd) == 0) {
            return "0.000";
        } else {
            return Tostring(Round(parserDouble(kw_use) / parserDouble(qty_prd), 3));
        }
    }

    public String Calculator_Qty_prd(String total_prd_weight, String total_starch_weight, String total_raw_weight, String starch_balance) {

        if (total_prd_weight.equals("") || total_prd_weight == null) {
            total_prd_weight = "0.000";
        }
        if (total_starch_weight.equals("") || total_starch_weight == null) {
            total_starch_weight = "0.000";
        }

        if (total_raw_weight.equals("") || total_raw_weight == null) {
            total_raw_weight = "0.000";
        }

        if (starch_balance.equals("") || starch_balance == null) {
            starch_balance = "0.000";
        }

        return Tostring(Round((parserDouble(total_prd_weight) + parserDouble(total_starch_weight)) - (parserDouble(total_raw_weight) + parserDouble(starch_balance)), 3));
    }

    public String Calculator_Percent_prd(String Qty_prd, String Amount_cassava) {
        if (Qty_prd.equals("") || Qty_prd == null) {
            Qty_prd = "0.000";
        }
        if (Amount_cassava.equals("") || Amount_cassava == null) {
            Amount_cassava = "0.000";
        }

        return Tostring(Round((parserDouble(Qty_prd) / parserDouble(Amount_cassava)) * 100, 3));
    }

    public String Calculator_Percent_diff(String Percent_prd, String Percent_tapioca) {
        if (Percent_prd.equals("") || Percent_prd == null) {
            Percent_prd = "0.000";
        }
        if (Percent_tapioca.equals("") || Percent_tapioca == null) {
            Percent_tapioca = "0.000";
        }
        return Tostring(Round((parserDouble(Percent_prd) - parserDouble(Percent_tapioca)), 3));
    }

    public String Calculator_Percent_yield(String Qty_prd, String Amount_tapioca) {

        if (Qty_prd.equals("") || Qty_prd == null) {
            Qty_prd = "0.000";
        }
        if (Amount_tapioca.equals("") || Amount_tapioca == null) {
            Amount_tapioca = "0.000";
        }

        return Tostring(Round((parserDouble(Qty_prd) / parserDouble(Amount_tapioca)) * 100, 3));
    }

    public String Calculator_Yield_val(String Percent_yield) {

        if (Percent_yield.equals("") || Percent_yield == null) {
            Percent_yield = "0.000";
        }
        return Tostring(Round((parserDouble(Percent_yield) - 100), 3));
    }
}
