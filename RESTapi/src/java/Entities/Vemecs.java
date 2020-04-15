/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author cualit-mktg-dell-2
 */
@Entity
@Table(name = "vemecs")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Vemecs.findAll", query = "SELECT v FROM Vemecs v"),
    @NamedQuery(name = "Vemecs.findById", query = "SELECT v FROM Vemecs v WHERE v.id = :id"),
    @NamedQuery(name = "Vemecs.findByMarca", query = "SELECT v FROM Vemecs v WHERE v.marca = :marca"),
    @NamedQuery(name = "Vemecs.findByModelo", query = "SELECT v FROM Vemecs v WHERE v.modelo = :modelo"),
    @NamedQuery(name = "Vemecs.findByUbicacion", query = "SELECT v FROM Vemecs v WHERE v.ubicacion = :ubicacion")})
public class Vemecs implements Serializable {

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

    public Vemecs() {
    }

    public Vemecs(Integer id) {
        this.id = id;
    }

    public Vemecs(Integer id, String marca, String modelo, String ubicacion) {
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Vemecs)) {
            return false;
        }
        Vemecs other = (Vemecs) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entities.Vemecs[ id=" + id + " ]";
    }
    
}
