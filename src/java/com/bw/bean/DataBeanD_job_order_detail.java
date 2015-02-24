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
public class DataBeanD_job_order_detail {
    private String by;
    private Timestamp date;
    private String doc_id;
    private String line_no;
    private String doc_date;
    private String param;
    private String spec_min;
    private String spec_max;
    private String unit;

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
     * @return the param
     */
    public String getParam() {
        return param;
    }

    /**
     * @param param the param to set
     */
    public void setParam(String param) {
        this.param = param;
    }

    /**
     * @return the spec
     */
    public String getSpec_min() {
        return spec_min;
    }

    /**
     * @param spec the spec to set
     */
    public void setSpec_min(String spec_min) {
        this.spec_min = spec_min;
    }

    /**
     * @return the unit
     */
    public String getUnit() {
        return unit;
    }

    /**
     * @param unit the unit to set
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     * @return the spec_max
     */
    public String getSpec_max() {
        return spec_max;
    }

    /**
     * @param spec_max the spec_max to set
     */
    public void setSpec_max(String spec_max) {
        this.spec_max = spec_max;
    }

}
