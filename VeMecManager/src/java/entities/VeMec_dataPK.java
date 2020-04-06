/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author esteban
 */
@Embeddable
public class VeMec_dataPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "Id_Data")
    private int idData;
    @Basic(optional = false)
    @Column(name = "Id_Vemec")
    private int idVemec;

    public VeMec_dataPK() {
    }

    public VeMec_dataPK(int idData, int idVemec) {
        this.idData = idData;
        this.idVemec = idVemec;
    }

    public int getIdData() {
        return idData;
    }

    public void setIdData(int idData) {
        this.idData = idData;
    }

    public int getIdVemec() {
        return idVemec;
    }

    public void setIdVemec(int idVemec) {
        this.idVemec = idVemec;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idData;
        hash += (int) idVemec;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VeMec_dataPK)) {
            return false;
        }
        VeMec_dataPK other = (VeMec_dataPK) object;
        if (this.idData != other.idData) {
            return false;
        }
        if (this.idVemec != other.idVemec) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.VeMec_dataPK[ idData=" + idData + ", idVemec=" + idVemec + " ]";
    }
    
}
