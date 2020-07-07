/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author esteban
 */
@Entity
@Table(name = "vemecs_data")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VeMec_data.findAll", query = "SELECT v FROM VeMec_data v"),
    @NamedQuery(name = "VeMec_data.findByIdData", query = "SELECT v FROM VeMec_data v WHERE v.veMec_dataPK.idData = :idData"),
    @NamedQuery(name = "VeMec_data.findByIdVemec", query = "SELECT v FROM VeMec_data v WHERE v.veMec_dataPK.idVemec = :idVemec"),
    @NamedQuery(name = "VeMec_data.findByPresionMaxima", query = "SELECT v FROM VeMec_data v WHERE v.presionMaxima = :presionMaxima"),
    @NamedQuery(name = "VeMec_data.findByPresionMinima", query = "SELECT v FROM VeMec_data v WHERE v.presionMinima = :presionMinima"),
    @NamedQuery(name = "VeMec_data.findByGas", query = "SELECT v FROM VeMec_data v WHERE v.gas = :gas"),
    @NamedQuery(name = "VeMec_data.findByFrecuencia", query = "SELECT v FROM VeMec_data v WHERE v.frecuencia = :frecuencia"),
    @NamedQuery(name = "VeMec_data.findByMezcla", query = "SELECT v FROM VeMec_data v WHERE v.mezcla = :mezcla"),
    @NamedQuery(name = "VeMec_data.findByHumedad", query = "SELECT v FROM VeMec_data v WHERE v.humedad = :humedad"),
    @NamedQuery(name = "VeMec_data.findByTemperaturaEntrada", query = "SELECT v FROM VeMec_data v WHERE v.temperaturaEntrada = :temperaturaEntrada"),
    @NamedQuery(name = "VeMec_data.findByTemperaturaSalida", query = "SELECT v FROM VeMec_data v WHERE v.temperaturaSalida = :temperaturaSalida"),
    @NamedQuery(name = "VeMec_data.findByPresionEntrada", query = "SELECT v FROM VeMec_data v WHERE v.presionEntrada = :presionEntrada"),
    @NamedQuery(name = "VeMec_data.findByPresionSalida", query = "SELECT v FROM VeMec_data v WHERE v.presionSalida = :presionSalida"),
    @NamedQuery(name = "VeMec_data.findByTimestampData", query = "SELECT v FROM VeMec_data v WHERE v.timestampData = :timestampData")})
public class VeMec_data implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "Pulsaciones")
    private int pulsaciones;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Conectado_Corriente")
    private boolean conectadoCorriente;
    @Column(name = "Energia")
    private Integer energia;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected VeMec_dataPK veMec_dataPK;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "Presion_Maxima")
    private Float presionMaxima;
    @Column(name = "Presion_Minima")
    private Float presionMinima;
    @Column(name = "Gas")
    private Float gas;
    @Column(name = "Frecuencia")
    private Float frecuencia;
    @Column(name = "Mezcla")
    private Float mezcla;
    @Column(name = "Humedad")
    private Float humedad;
    @Column(name = "Temperatura_Entrada")
    private Float temperaturaEntrada;
    @Column(name = "Temperatura_Salida")
    private Float temperaturaSalida;
    @Column(name = "Presion_Entrada")
    private Float presionEntrada;
    @Column(name = "Presion_Salida")
    private Float presionSalida;
    @Column(name = "Timestamp_Data")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestampData;
    @JoinColumn(name = "Id_Vemec", referencedColumnName = "Id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private VeMec veMec;

    public VeMec_data() {
    }

    public VeMec_data(VeMec_dataPK veMec_dataPK) {
        this.veMec_dataPK = veMec_dataPK;
    }

    public VeMec_data(int idData, int idVemec) {
        this.veMec_dataPK = new VeMec_dataPK(idData, idVemec);
    }

    public VeMec_dataPK getVeMec_dataPK() {
        return veMec_dataPK;
    }

    public void setVeMec_dataPK(VeMec_dataPK veMec_dataPK) {
        this.veMec_dataPK = veMec_dataPK;
    }

    public Float getPresionMaxima() {
        return presionMaxima;
    }

    public void setPresionMaxima(Float presionMaxima) {
        this.presionMaxima = presionMaxima;
    }

    public Float getPresionMinima() {
        return presionMinima;
    }

    public void setPresionMinima(Float presionMinima) {
        this.presionMinima = presionMinima;
    }

    public Float getGas() {
        return gas;
    }

    public void setGas(Float gas) {
        this.gas = gas;
    }

    public Float getFrecuencia() {
        return frecuencia;
    }

    public void setFrecuencia(Float frecuencia) {
        this.frecuencia = frecuencia;
    }

    public Float getMezcla() {
        return mezcla;
    }

    public void setMezcla(Float mezcla) {
        this.mezcla = mezcla;
    }

    public Float getHumedad() {
        return humedad;
    }

    public void setHumedad(Float humedad) {
        this.humedad = humedad;
    }

    public Float getTemperaturaEntrada() {
        return temperaturaEntrada;
    }

    public void setTemperaturaEntrada(Float temperaturaEntrada) {
        this.temperaturaEntrada = temperaturaEntrada;
    }

    public Float getTemperaturaSalida() {
        return temperaturaSalida;
    }

    public void setTemperaturaSalida(Float temperaturaSalida) {
        this.temperaturaSalida = temperaturaSalida;
    }

    public Float getPresionEntrada() {
        return presionEntrada;
    }

    public void setPresionEntrada(Float presionEntrada) {
        this.presionEntrada = presionEntrada;
    }

    public Float getPresionSalida() {
        return presionSalida;
    }

    public void setPresionSalida(Float presionSalida) {
        this.presionSalida = presionSalida;
    }

    public Date getTimestampData() {
        return timestampData;
    }

    public void setTimestampData(Date timestampData) {
        this.timestampData = timestampData;
    }

    public VeMec getVeMec() {
        return veMec;
    }

    public void setVeMec(VeMec veMec) {
        this.veMec = veMec;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (veMec_dataPK != null ? veMec_dataPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VeMec_data)) {
            return false;
        }
        VeMec_data other = (VeMec_data) object;
        if ((this.veMec_dataPK == null && other.veMec_dataPK != null) || (this.veMec_dataPK != null && !this.veMec_dataPK.equals(other.veMec_dataPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.VeMec_data[ veMec_dataPK=" + veMec_dataPK + " ]";
    }

    public int getPulsaciones() {
        return pulsaciones;
    }

    public void setPulsaciones(int pulsaciones) {
        this.pulsaciones = pulsaciones;
    }

    public boolean getConectadoCorriente() {
        return conectadoCorriente;
    }

    public void setConectadoCorriente(boolean conectadoCorriente) {
        this.conectadoCorriente = conectadoCorriente;
    }

    public Integer getEnergia() {
        return energia;
    }

    public void setEnergia(Integer energia) {
        this.energia = energia;
    }
    
}
