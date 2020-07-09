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
@Table(name = "pacientes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Paciente.findAll", query = "SELECT p FROM Paciente p"),
    @NamedQuery(name = "Paciente.findById", query = "SELECT p FROM Paciente p WHERE p.id = :id"),
    @NamedQuery(name = "Paciente.findByCi", query = "SELECT p FROM Paciente p WHERE p.ci = :ci"),
    @NamedQuery(name = "Paciente.findByNombre", query = "SELECT p FROM Paciente p WHERE p.nombre = :nombre"),
    @NamedQuery(name = "Paciente.findBySexo", query = "SELECT p FROM Paciente p WHERE p.sexo = :sexo"),
    @NamedQuery(name = "Paciente.findByEdad", query = "SELECT p FROM Paciente p WHERE p.edad = :edad"),
    @NamedQuery(name = "Paciente.findByNacionalidad", query = "SELECT p FROM Paciente p WHERE p.nacionalidad = :nacionalidad"),
    @NamedQuery(name = "Paciente.findByLugarResidencia", query = "SELECT p FROM Paciente p WHERE p.lugarResidencia = :lugarResidencia"),
    @NamedQuery(name = "Paciente.findByDireccion", query = "SELECT p FROM Paciente p WHERE p.direccion = :direccion"),
    @NamedQuery(name = "Paciente.findByCoordenadas", query = "SELECT p FROM Paciente p WHERE p.coordenadas = :coordenadas"),
    @NamedQuery(name = "Paciente.findByAntecedentesClinicos", query = "SELECT p FROM Paciente p WHERE p.antecedentesClinicos = :antecedentesClinicos"),
    @NamedQuery(name = "Paciente.findByNivelRiesgo", query = "SELECT p FROM Paciente p WHERE p.nivelRiesgo = :nivelRiesgo"),
    @NamedQuery(name = "Paciente.findByDefuncion", query = "SELECT p FROM Paciente p WHERE p.defuncion = :defuncion")})
public class Paciente implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 11)
    @Column(name = "CI")
    private String ci;
    @Basic(optional = false)
    @NotNull()
    @Size(min = 1, max = 60)
    @Column(name = "Nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "Sexo")
    private String sexo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Edad")
    private int edad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Nacionalidad")
    private String nacionalidad;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "Lugar_Residencia")
    private String lugarResidencia;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "Direccion")
    private String direccion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "Coordenadas")
    private String coordenadas;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Antecedentes_Clinicos")
    private String antecedentesClinicos;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "Nivel_Riesgo")
    private String nivelRiesgo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Defuncion")
    private boolean defuncion;
    @OneToMany(mappedBy = "idPaciente")
    private Collection<Vemec> vemecCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPaciente")
    private Collection<AccionMedica> accionMedicaCollection;
    @JoinColumn(name = "id_vemec", referencedColumnName = "Id")
    @ManyToOne
    private Vemec idVemec;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idPaciente")
    private Collection<Contacto> contactoCollection;

    public Paciente() {
    }

    public Paciente(Integer id) {
        this.id = id;
    }

    public Paciente(Integer id, String ci, String nombre, String sexo, int edad, String nacionalidad, String lugarResidencia, String direccion, String coordenadas, String antecedentesClinicos, String nivelRiesgo, boolean defuncion) {
        this.id = id;
        this.ci = ci;
        this.nombre = nombre;
        this.sexo = sexo;
        this.edad = edad;
        this.nacionalidad = nacionalidad;
        this.lugarResidencia = lugarResidencia;
        this.direccion = direccion;
        this.coordenadas = coordenadas;
        this.antecedentesClinicos = antecedentesClinicos;
        this.nivelRiesgo = nivelRiesgo;
        this.defuncion = defuncion;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getLugarResidencia() {
        return lugarResidencia;
    }

    public void setLugarResidencia(String lugarResidencia) {
        this.lugarResidencia = lugarResidencia;
    }


    public String getAntecedentesClinicos() {
        return antecedentesClinicos;
    }

    public void setAntecedentesClinicos(String antecedentesClinicos) {
        this.antecedentesClinicos = antecedentesClinicos;
    }

    public String getNivelRiesgo() {
        return nivelRiesgo;
    }

    public void setNivelRiesgo(String nivelRiesgo) {
        this.nivelRiesgo = nivelRiesgo;
    }


    @XmlTransient
    public Collection<AccionMedica> getAccionMedicaCollection() {
        return accionMedicaCollection;
    }

    public void setAccionMedicaCollection(Collection<AccionMedica> accionMedicaCollection) {
        this.accionMedicaCollection = accionMedicaCollection;
    }

    public Vemec getIdVemec() {
        return idVemec;
    }

    public void setIdVemec(Vemec idVemec) {
        this.idVemec = idVemec;
    }

    @XmlTransient
    public Collection<Contacto> getContactoCollection() {
        return contactoCollection;
    }

    public void setContactoCollection(Collection<Contacto> contactoCollection) {
        this.contactoCollection = contactoCollection;
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
        if (!(object instanceof Paciente)) {
            return false;
        }
        Paciente other = (Paciente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Paciente[ id=" + id + " ]";
    }

    public String getCi() {
        return ci;
    }

    public void setCi(String ci) {
        this.ci = ci;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }
    
    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCoordenadas() {
        return coordenadas;
    }

    public void setCoordenadas(String coordenadas) {
        this.coordenadas = coordenadas;
    }

    public boolean getDefuncion() {
        return defuncion;
    }

    public void setDefuncion(boolean defuncion) {
        this.defuncion = defuncion;
    }

    @XmlTransient
    public Collection<Vemec> getVemecCollection() {
        return vemecCollection;
    }

    public void setVemecCollection(Collection<Vemec> vemecCollection) {
        this.vemecCollection = vemecCollection;
    }
    
}
