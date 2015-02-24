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
public class DataBeanM_supply_type {
    private String by;
    private Timestamp date;
    private String supply_type_id;
    private String name_t;
    private String remark;

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
     * @return the supply_type_id
     */
    public String getSupply_type_id() {
        return supply_type_id;
    }

    /**
     * @param supply_type_id the supply_type_id to set
     */
    public void setSupply_type_id(String supply_type_id) {
        this.supply_type_id = supply_type_id;
    }

    /**
     * @return the name_t
     */
    public String getName_t() {
        return name_t;
    }

    /**
     * @param name_t the name_t to set
     */
    public void setName_t(String name_t) {
        this.name_t = name_t;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

}
