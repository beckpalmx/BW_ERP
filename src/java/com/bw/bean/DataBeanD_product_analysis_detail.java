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
public class DataBeanD_product_analysis_detail {
    private String by;
    private Timestamp date;
    private String doc_id;
    private String line_no;
    private String spec;
    private String value;
    private String unit;
    private String check_value;
    private String spec_min;
    private String spec_max;

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
     * @return the spec
     */
    public String getSpec() {
        return spec;
    }

    /**
     * @param spec the spec to set
     */
    public void setSpec(String spec) {
        this.spec = spec;
    }

    /**
     * @return the value
     */
    public String getValue() {
        return value;
    }

    /**
     * @param value the value to set
     */
    public void setValue(String value) {
        this.value = value;
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
     * @return the check_value
     */
    public String getCheck_value() {
        return check_value;
    }

    /**
     * @param check_value the check_value to set
     */
    public void setCheck_value(String check_value) {
        this.check_value = check_value;
    }

    /**
     * @return the spec_min
     */
    public String getSpec_min() {
        return spec_min;
    }

    /**
     * @param spec_min the spec_min to set
     */
    public void setSpec_min(String spec_min) {
        this.spec_min = spec_min;
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
