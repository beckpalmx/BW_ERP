/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.bean;

import java.sql.Timestamp;

/**
 *
 * @author B
 */
public class DataBeanD_product_report_daily_detail_starch {
    private String by;
    private Timestamp date;
    private String doc_id;
    private String doc_date;
    private String line_no;
    private String qty_starch;
    private String be_val;
    private String sg_val;
    private String amount;
    private String tank;
    private String cassava_of_date;
    private String starch_bal;
    private String qty_tank;
    private String starch_bal_x_qty_tank;

    /**
     * @return the by
     */
    public String getBy() {
        return by;
    }

    /**
     * @param by the by to set
     */
    public void setBy(String by) {
        this.by = by;
    }

    /**
     * @return the date
     */
    public Timestamp getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Timestamp date) {
        this.date = date;
    }

    /**
     * @return the doc_id
     */
    public String getDoc_id() {
        return doc_id;
    }

    /**
     * @param doc_id the doc_id to set
     */
    public void setDoc_id(String doc_id) {
        this.doc_id = doc_id;
    }

    /**
     * @return the doc_date
     */
    public String getDoc_date() {
        return doc_date;
    }

    /**
     * @param doc_date the doc_date to set
     */
    public void setDoc_date(String doc_date) {
        this.doc_date = doc_date;
    }

    /**
     * @return the line_no
     */
    public String getLine_no() {
        return line_no;
    }

    /**
     * @param line_no the line_no to set
     */
    public void setLine_no(String line_no) {
        this.line_no = line_no;
    }

    /**
     * @return the qty_starch
     */
    public String getQty_starch() {
        return qty_starch;
    }

    /**
     * @param qty_starch the qty_starch to set
     */
    public void setQty_starch(String qty_starch) {
        this.qty_starch = qty_starch;
    }

    /**
     * @return the be_val
     */
    public String getBe_val() {
        return be_val;
    }

    /**
     * @param be_val the be_val to set
     */
    public void setBe_val(String be_val) {
        this.be_val = be_val;
    }

    /**
     * @return the sg_val
     */
    public String getSg_val() {
        return sg_val;
    }

    /**
     * @param sg_val the sg_val to set
     */
    public void setSg_val(String sg_val) {
        this.sg_val = sg_val;
    }

    /**
     * @return the amount
     */
    public String getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTank(){
        return tank;
    }
    public void setTank(String tank){
        this.tank = tank;
    }

    /**
     * @return the cassava_of_date
     */
    public String getCassava_of_date() {
        return cassava_of_date;
    }

    /**
     * @param cassava_of_date the cassava_of_date to set
     */
    public void setCassava_of_date(String cassava_of_date) {
        this.cassava_of_date = cassava_of_date;
    }

    /**
     * @return the starch_bal
     */
    public String getStarch_bal() {
        return starch_bal;
    }

    /**
     * @param starch_bal the starch_bal to set
     */
    public void setStarch_bal(String starch_bal) {
        this.starch_bal = starch_bal;
    }

    /**
     * @return the qty_tank
     */
    public String getQty_tank() {
        return qty_tank;
    }

    /**
     * @param qty_tank the qty_tank to set
     */
    public void setQty_tank(String qty_tank) {
        this.qty_tank = qty_tank;
    }

    /**
     * @return the starch_bal_x_qty_tank
     */
    public String getStarch_bal_x_qty_tank() {
        return starch_bal_x_qty_tank;
    }

    /**
     * @param starch_bal_x_qty_tank the starch_bal_x_qty_tank to set
     */
    public void setStarch_bal_x_qty_tank(String starch_bal_x_qty_tank) {
        this.starch_bal_x_qty_tank = starch_bal_x_qty_tank;
    }
}
