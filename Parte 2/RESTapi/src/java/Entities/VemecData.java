/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

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
 * @author cualit-mktg-dell-2
 */
@Entity
@Table(name = "vemecs_data")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VemecData.findAll", query = "SELECT v FROM VemecData v"),
    @NamedQuery(name = "VemecData.findByIdData", query = "SELECT v FROM VemecData v WHERE v.vemecsDataPK.idData = :idData"),
    @NamedQuery(name = "VemecData.findByIdVemec", query = "SELECT v FROM VemecData v WHERE v.vemecsDataPK.idVemec = :idVemec"),
    @NamedQuery(name = "VemecData.findByPresionMaxima", query = "SELECT v FROM VemecData v WHERE v.presionMaxima = :presionMaxima"),
    @NamedQuery(name = "VemecData.findByPresionMinima", query = "SELECT v FROM VemecData v WHERE v.presionMinima = :presionMinima"),
    @NamedQuery(name = "VemecData.findByGas", query = "SELECT v FROM VemecData v WHERE v.gas = :gas"),
    @NamedQuery(name = "VemecData.findByFrecuencia", query = "SELECT v FROM VemecData v WHERE v.frecuencia = :frecuencia"),
    @NamedQuery(name = "VemecData.findByMezcla", query = "SELECT v FROM VemecData v WHERE v.mezcla = :mezcla"),
    @NamedQuery(name = "VemecData.findByHumedad", query = "SELECT v FROM VemecData v WHERE v.humedad = :humedad"),
    @NamedQuery(name = "VemecData.findByTemperaturaEntrada", query = "SELECT v FROM VemecData v WHERE v.temperaturaEntrada = :temperaturaEntrada"),
    @NamedQuery(name = "VemecData.findByTemperaturaSalida", query = "SELECT v FROM VemecData v WHERE v.temperaturaSalida = :temperaturaSalida"),
    @NamedQuery(name = "VemecData.findByPresionEntrada", query = "SELECT v FROM VemecData v WHERE v.presionEntrada = :presionEntrada"),
    @NamedQuery(name = "VemecData.findByPresionSalida", query = "SELECT v FROM VemecData v WHERE v.presionSalida = :presionSalida"),
    @NamedQuery(name = "VemecData.findByTimestampData", query = "SELECT v FROM VemecData v WHERE v.timestampData = :timestampData")})
public class VemecData implements Serializable {

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
    @JoinColumn(name = "id_paciente", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Paciente idPaciente;

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected VemecDataPK vemecsDataPK;
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

    public VemecData() {
    }

    public VemecData(VemecDataPK vemecsDataPK) {
        this.vemecsDataPK = vemecsDataPK;
    }

    public VemecData(int idData, int idVemec) {
        this.vemecsDataPK = new VemecDataPK(idData, idVemec);
    }

    public VemecDataPK getVemecsDataPK() {
        return vemecsDataPK;
    }

    public void setVemecsDataPK(VemecDataPK vemecsDataPK) {
        this.vemecsDataPK = vemecsDataPK;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (vemecsDataPK != null ? vemecsDataPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof VemecData)) {
            return false;
        }
        VemecData other = (VemecData) object;
        if ((this.vemecsDataPK == null && other.vemecsDataPK != null) || (this.vemecsDataPK != null && !this.vemecsDataPK.equals(other.vemecsDataPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.VemecsData[ vemecsDataPK=" + vemecsDataPK + " ]";
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

    public Paciente getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Paciente idPaciente) {
        this.idPaciente = idPaciente;
    }

    public int getPulsaciones() {
        return pulsaciones;
    }

    public void setPulsaciones(int pulsaciones) {
        this.pulsaciones = pulsaciones;
    }
    
}
