/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bw.bean;

import java.sql.Timestamp;

/**
 *
 * @author Administrator
 */
public class DataBeanCS_Transection_Warehouse {
    private String doc_id;
    private String doc_date;
    private String product_id;
    private String bag_weight;
    private String bag_amount;
    private String by;
    private Timestamp data;
    private String warehouse_id;
    private String process_id;
    private String complete_flag;
    private String bag_withdraw;
    private String line_no;

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
     * @return the product_id
     */
    public String getProduct_id() {
        return product_id;
    }

    /**
     * @param product_id the product_id to set
     */
    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    /**
     * @return the bag_weight
     */
    public String getBag_weight() {
        return bag_weight;
    }

    /**
     * @param bag_weight the bag_weight to set
     */
    public void setBag_weight(String bag_weight) {
        this.bag_weight = bag_weight;
    }

    /**
     * @return the bag_amount
     */
    public String getBag_amount() {
        return bag_amount;
    }

    /**
     * @param bag_amount the bag_amount to set
     */
    public void setBag_amount(String bag_amount) {
        this.bag_amount = bag_amount;
    }

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
     * @return the data
     */
    public Timestamp getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Timestamp data) {
        this.data = data;
    }

    /**
     * @return the warehouse_id
     */
    public String getWarehouse_id() {
        return warehouse_id;
    }

    /**
     * @param warehouse_id the warehouse_id to set
     */
    public void setWarehouse_id(String warehouse_id) {
        this.warehouse_id = warehouse_id;
    }

    /**
     * @return the process_id
     */
    public String getProcess_id() {
        return process_id;
    }

    /**
     * @param process_id the process_id to set
     */
    public void setProcess_id(String process_id) {
        this.process_id = process_id;
    }

    /**
     * @return the complete_flag
     */
    public String getComplete_flag() {
        return complete_flag;
    }

    /**
     * @param complete_flag the complete_flag to set
     */
    public void setComplete_flag(String complete_flag) {
        this.complete_flag = complete_flag;
    }

    /**
     * @return the bag_withdraw
     */
    public String getBag_withdraw() {
        return bag_withdraw;
    }

    /**
     * @param bag_withdraw the bag_withdraw to set
     */
    public void setBag_withdraw(String bag_withdraw) {
        this.bag_withdraw = bag_withdraw;
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

}
