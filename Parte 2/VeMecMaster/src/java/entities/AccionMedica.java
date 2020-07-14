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
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Esteban
 */
@Entity
@Table(name = "acciones_medicas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AccionMedica.findAll", query = "SELECT a FROM AccionMedica a"),
    @NamedQuery(name = "AccionMedica.findById", query = "SELECT a FROM AccionMedica a WHERE a.id = :id"),
    @NamedQuery(name = "AccionMedica.findByFechaHora", query = "SELECT a FROM AccionMedica a WHERE a.fechaHora = :fechaHora"),
    @NamedQuery(name = "AccionMedica.findByNivelRiesgo", query = "SELECT a FROM AccionMedica a WHERE a.nivelRiesgo = :nivelRiesgo"),
    @NamedQuery(name = "AccionMedica.findByMedicacion", query = "SELECT a FROM AccionMedica a WHERE a.medicacion = :medicacion"),
    @NamedQuery(name = "AccionMedica.findByDescripcion", query = "SELECT a FROM AccionMedica a WHERE a.descripcion = :descripcion"),
    @NamedQuery(name = "AccionMedica.findByMedicoTratante", query = "SELECT a FROM AccionMedica a WHERE a.medicoTratante = :medicoTratante")})
public class AccionMedica implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "fecha_hora")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaHora;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "nivel_riesgo")
    private String nivelRiesgo;
    @Size(max = 200)
    @Column(name = "medicacion")
    private String medicacion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 60)
    @Column(name = "medico_tratante")
    private String medicoTratante;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumn(name = "id_paciente", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Paciente idPaciente;
    @JoinColumn(name = "id_vemec", referencedColumnName = "Id")
    @ManyToOne
    private Vemec idVemec;

    public AccionMedica() {
    }

    public AccionMedica(Integer id) {
        this.id = id;
    }

    public AccionMedica(Integer id, Date fechaHora, String nivelRiesgo, String descripcion, String medicoTratante) {
        this.id = id;
        this.fechaHora = fechaHora;
        this.nivelRiesgo = nivelRiesgo;
        this.descripcion = descripcion;
        this.medicoTratante = medicoTratante;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(Date fechaHora) {
        this.fechaHora = fechaHora;
    }

    public String getNivelRiesgo() {
        return nivelRiesgo;
    }

    public void setNivelRiesgo(String nivelRiesgo) {
        this.nivelRiesgo = nivelRiesgo;
    }


    public String getMedicoTratante() {
        return medicoTratante;
    }

    public void setMedicoTratante(String medicoTratante) {
        this.medicoTratante = medicoTratante;
    }

    public Paciente getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Paciente idPaciente) {
        this.idPaciente = idPaciente;
    }

    public Vemec getIdVemec() {
        return idVemec;
    }

    public void setIdVemec(Vemec idVemec) {
        this.idVemec = idVemec;
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
        if (!(object instanceof AccionMedica)) {
            return false;
        }
        AccionMedica other = (AccionMedica) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.AccionMedica[ id=" + id + " ]";
    }

    public String getMedicacion() {
        return medicacion;
    }

    public void setMedicacion(String medicacion) {
        this.medicacion = medicacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
