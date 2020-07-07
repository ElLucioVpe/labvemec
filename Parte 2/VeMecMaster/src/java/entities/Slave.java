/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Esteban
 */
@Entity
@Table(name = "slaves")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Slave.findAll", query = "SELECT s FROM Slave s"),
    @NamedQuery(name = "Slave.findById", query = "SELECT s FROM Slave s WHERE s.id = :id"),
    @NamedQuery(name = "Slave.findByNombre", query = "SELECT s FROM Slave s WHERE s.nombre = :nombre"),
    @NamedQuery(name = "Slave.findByIntervaloEnvio", query = "SELECT s FROM Slave s WHERE s.intervaloEnvio = :intervaloEnvio"),
    @NamedQuery(name = "Slave.findByIntervaloEmergencia", query = "SELECT s FROM Slave s WHERE s.intervaloEmergencia = :intervaloEmergencia")})
public class Slave implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Intervalo_Envio")
    private int intervaloEnvio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Intervalo_Emergencia")
    private int intervaloEmergencia;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idSlave")
    private Collection<Vemec> vemecCollection;

    public Slave() {
    }

    public Slave(Integer id) {
        this.id = id;
    }

    public Slave(Integer id, String nombre, int intervaloEnvio, int intervaloEmergencia) {
        this.id = id;
        this.nombre = nombre;
        this.intervaloEnvio = intervaloEnvio;
        this.intervaloEmergencia = intervaloEmergencia;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIntervaloEnvio() {
        return intervaloEnvio;
    }

    public void setIntervaloEnvio(int intervaloEnvio) {
        this.intervaloEnvio = intervaloEnvio;
    }

    public int getIntervaloEmergencia() {
        return intervaloEmergencia;
    }

    public void setIntervaloEmergencia(int intervaloEmergencia) {
        this.intervaloEmergencia = intervaloEmergencia;
    }

    @XmlTransient
    public Collection<Vemec> getVemecCollection() {
        return vemecCollection;
    }

    public void setVemecCollection(Collection<Vemec> vemecCollection) {
        this.vemecCollection = vemecCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Slave)) {
            return false;
        }
        Slave other = (Slave) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Slave[ id=" + id + " ]";
    }
    
}
