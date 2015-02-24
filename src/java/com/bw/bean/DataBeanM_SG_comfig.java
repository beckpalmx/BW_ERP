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
public class DataBeanM_SG_comfig {
    private String be;
    private String sg;
    private String remark;
    private String by;
    private Timestamp date;

    /**
     * @return the be
     */
    public String getBe() {
        return be;
    }

    /**
     * @param be the be to set
     */
    public void setBe(String be) {
        this.be = be;
    }

    /**
     * @return the sg
     */
    public String getSg() {
        return sg;
    }

    /**
     * @param sg the sg to set
     */
    public void setSg(String sg) {
        this.sg = sg;
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
}
