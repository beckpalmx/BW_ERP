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
public class DataBeanD_product_milling_header {
    private String by;
    private Timestamp date;
    private String doc_id;
    private String total_2;
    private String cod_in;
    private String cod_out;
    private String cassava_roots_qty;
    private String doc_date;

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
     * @return the total_2
     */
    public String getTotal_2() {
        return total_2;
    }

    /**
     * @param total_2 the total_2 to set
     */
    public void setTotal_2(String total_2) {
        this.total_2 = total_2;
    }

    /**
     * @return the cod_in
     */
    public String getCod_in() {
        return cod_in;
    }

    /**
     * @param cod_in the cod_in to set
     */
    public void setCod_in(String cod_in) {
        this.cod_in = cod_in;
    }

    /**
     * @return the cod_out
     */
    public String getCod_out() {
        return cod_out;
    }

    /**
     * @param cod_out the cod_out to set
     */
    public void setCod_out(String cod_out) {
        this.cod_out = cod_out;
    }

    /**
     * @return the cassava_roots_qty
     */
    public String getCassava_roots_qty() {
        return cassava_roots_qty;
    }

    /**
     * @param cassava_roots_qty the cassava_roots_qty to set
     */
    public void setCassava_roots_qty(String cassava_roots_qty) {
        this.cassava_roots_qty = cassava_roots_qty;
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
}
