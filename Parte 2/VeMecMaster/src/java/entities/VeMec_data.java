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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Esteban
 */
@Entity
@Table(name = "vemecs_data")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vemec_Data.findAll", query = "SELECT v FROM Vemec_Data v"),
    @NamedQuery(name = "Vemec_Data.findByIdData", query = "SELECT v FROM Vemec_Data v WHERE v.vemec_DataPK.idData = :idData"),
    @NamedQuery(name = "Vemec_Data.findByIdVemec", query = "SELECT v FROM Vemec_Data v WHERE v.vemec_DataPK.idVemec = :idVemec"),
    @NamedQuery(name = "Vemec_Data.findByPresionMaxima", query = "SELECT v FROM Vemec_Data v WHERE v.presionMaxima = :presionMaxima"),
    @NamedQuery(name = "Vemec_Data.findByPresionMinima", query = "SELECT v FROM Vemec_Data v WHERE v.presionMinima = :presionMinima"),
    @NamedQuery(name = "Vemec_Data.findByGas", query = "SELECT v FROM Vemec_Data v WHERE v.gas = :gas"),
    @NamedQuery(name = "Vemec_Data.findByFrecuencia", query = "SELECT v FROM Vemec_Data v WHERE v.frecuencia = :frecuencia"),
    @NamedQuery(name = "Vemec_Data.findByMezcla", query = "SELECT v FROM Vemec_Data v WHERE v.mezcla = :mezcla"),
    @NamedQuery(name = "Vemec_Data.findByHumedad", query = "SELECT v FROM Vemec_Data v WHERE v.humedad = :humedad"),
    @NamedQuery(name = "Vemec_Data.findByTemperaturaEntrada", query = "SELECT v FROM Vemec_Data v WHERE v.temperaturaEntrada = :temperaturaEntrada"),
    @NamedQuery(name = "Vemec_Data.findByTemperaturaSalida", query = "SELECT v FROM Vemec_Data v WHERE v.temperaturaSalida = :temperaturaSalida"),
    @NamedQuery(name = "Vemec_Data.findByPresionEntrada", query = "SELECT v FROM Vemec_Data v WHERE v.presionEntrada = :presionEntrada"),
    @NamedQuery(name = "Vemec_Data.findByPresionSalida", query = "SELECT v FROM Vemec_Data v WHERE v.presionSalida = :presionSalida"),
    @NamedQuery(name = "Vemec_Data.findByPulsaciones", query = "SELECT v FROM Vemec_Data v WHERE v.pulsaciones = :pulsaciones"),
    @NamedQuery(name = "Vemec_Data.findByConectadoCorriente", query = "SELECT v FROM Vemec_Data v WHERE v.conectadoCorriente = :conectadoCorriente"),
    @NamedQuery(name = "Vemec_Data.findByEnergia", query = "SELECT v FROM Vemec_Data v WHERE v.energia = :energia"),
    @NamedQuery(name = "Vemec_Data.findByTimestampData", query = "SELECT v FROM Vemec_Data v WHERE v.timestampData = :timestampData")})
public class Vemec_Data implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected Vemec_DataPK vemec_DataPK;
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
    @Basic(optional = false)
    @NotNull
    @Column(name = "Timestamp_Data")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestampData;

    public Vemec_Data() {
    }

    public Vemec_Data(Vemec_DataPK vemec_DataPK) {
        this.vemec_DataPK = vemec_DataPK;
    }

    public Vemec_Data(Vemec_DataPK vemec_DataPK, int pulsaciones, boolean conectadoCorriente, Date timestampData) {
        this.vemec_DataPK = vemec_DataPK;
        this.pulsaciones = pulsaciones;
        this.conectadoCorriente = conectadoCorriente;
        this.timestampData = timestampData;
    }

    public Vemec_Data(int idData, int idVemec) {
        this.vemec_DataPK = new Vemec_DataPK(idData, idVemec);
    }

    public Vemec_DataPK getVemec_DataPK() {
        return vemec_DataPK;
    }

    public void setVemec_DataPK(Vemec_DataPK vemec_DataPK) {
        this.vemec_DataPK = vemec_DataPK;
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

    public Date getTimestampData() {
        return timestampData;
    }

    public void setTimestampData(Date timestampData) {
        this.timestampData = timestampData;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vemec_DataPK != null ? vemec_DataPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vemec_Data)) {
            return false;
        }
        Vemec_Data other = (Vemec_Data) object;
        if ((this.vemec_DataPK == null && other.vemec_DataPK != null) || (this.vemec_DataPK != null && !this.vemec_DataPK.equals(other.vemec_DataPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Vemec_Data[ vemec_DataPK=" + vemec_DataPK + " ]";
    }
    
}
