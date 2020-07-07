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
 * @author esteban
 */
@Entity
@Table(name = "vemecs")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "VeMec_1.findAll", query = "SELECT v FROM VeMec_1 v"),
    @NamedQuery(name = "VeMec_1.findById", query = "SELECT v FROM VeMec_1 v WHERE v.id = :id"),
    @NamedQuery(name = "VeMec_1.findByMarca", query = "SELECT v FROM VeMec_1 v WHERE v.marca = :marca"),
    @NamedQuery(name = "VeMec_1.findByModelo", query = "SELECT v FROM VeMec_1 v WHERE v.modelo = :modelo"),
    @NamedQuery(name = "VeMec_1.findByUbicacion", query = "SELECT v FROM VeMec_1 v WHERE v.ubicacion = :ubicacion")})
public class VeMec implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id")
    private Integer id;
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
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "veMec")
    private Collection<VeMec_data> veMecdataCollection;

    public VeMec() {
    }

    public VeMec(Integer id) {
        this.id = id;
    }

    public VeMec(Integer id, String marca, String modelo, String ubicacion) {
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

    @XmlTransient
    public Collection<VeMec_data> getVeMecdataCollection() {
        return veMecdataCollection;
    }

    public void setVeMecdataCollection(Collection<VeMec_data> veMecdataCollection) {
        this.veMecdataCollection = veMecdataCollection;
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
        if (!(object instanceof VeMec)) {
            return false;
        }
        VeMec other = (VeMec) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.VeMec_1[ id=" + id + " ]";
    }
    
}
