/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "vemecs")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vemec.findAll", query = "SELECT v FROM Vemec v"),
    @NamedQuery(name = "Vemec.findById", query = "SELECT v FROM Vemec v WHERE v.id = :id"),
    @NamedQuery(name = "Vemec.findByMarca", query = "SELECT v FROM Vemec v WHERE v.marca = :marca"),
    @NamedQuery(name = "Vemec.findByModelo", query = "SELECT v FROM Vemec v WHERE v.modelo = :modelo"),
    @NamedQuery(name = "Vemec.findByUbicacion", query = "SELECT v FROM Vemec v WHERE v.ubicacion = :ubicacion")})
public class Vemec implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "Marca")
    private String marca;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "Modelo")
    private String modelo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "Ubicacion")
    private String ubicacion;
    @JoinColumn(name = "id_paciente", referencedColumnName = "id")
    @ManyToOne
    private Paciente idPaciente;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id")
    private Integer id;
    @OneToMany(mappedBy = "idVemec")
    private Collection<AccionMedica> accionMedicaCollection;
    @OneToMany(mappedBy = "idVemec")
    private Collection<Paciente> pacienteCollection;
    @JoinColumn(name = "id_slave", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Slave idSlave;

    public Vemec() {
    }

    public Vemec(Integer id) {
        this.id = id;
    }

    public Vemec(Integer id, String marca, String modelo, String ubicacion) {
        this.id = id;
        this.marca = marca;
        this.modelo = modelo;
        this.ubicacion = ubicacion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    @XmlTransient
    public Collection<AccionMedica> getAccionMedicaCollection() {
        return accionMedicaCollection;
    }

    public void setAccionMedicaCollection(Collection<AccionMedica> accionMedicaCollection) {
        this.accionMedicaCollection = accionMedicaCollection;
    }

    @XmlTransient
    public Collection<Paciente> getPacienteCollection() {
        return pacienteCollection;
    }

    public void setPacienteCollection(Collection<Paciente> pacienteCollection) {
        this.pacienteCollection = pacienteCollection;
    }

    public Slave getIdSlave() {
        return idSlave;
    }

    public void setIdSlave(Slave idSlave) {
        this.idSlave = idSlave;
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
        if (!(object instanceof Vemec)) {
            return false;
        }
        Vemec other = (Vemec) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Vemec[ id=" + id + " ]";
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Paciente getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Paciente idPaciente) {
        this.idPaciente = idPaciente;
    }
    
}
