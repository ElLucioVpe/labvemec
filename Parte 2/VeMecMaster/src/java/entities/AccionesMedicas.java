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
    @NamedQuery(name = "AccionesMedicas.findAll", query = "SELECT a FROM AccionesMedicas a"),
    @NamedQuery(name = "AccionesMedicas.findById", query = "SELECT a FROM AccionesMedicas a WHERE a.id = :id"),
    @NamedQuery(name = "AccionesMedicas.findByFechaHora", query = "SELECT a FROM AccionesMedicas a WHERE a.fechaHora = :fechaHora"),
    @NamedQuery(name = "AccionesMedicas.findByNivelRiesgo", query = "SELECT a FROM AccionesMedicas a WHERE a.nivelRiesgo = :nivelRiesgo"),
    @NamedQuery(name = "AccionesMedicas.findByMedicacion", query = "SELECT a FROM AccionesMedicas a WHERE a.medicacion = :medicacion"),
    @NamedQuery(name = "AccionesMedicas.findByDescripcion", query = "SELECT a FROM AccionesMedicas a WHERE a.descripcion = :descripcion"),
    @NamedQuery(name = "AccionesMedicas.findByMedicoTratante", query = "SELECT a FROM AccionesMedicas a WHERE a.medicoTratante = :medicoTratante")})
public class AccionesMedicas implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
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
    @JoinColumn(name = "id_paciente", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Pacientes idPaciente;
    @JoinColumn(name = "id_vemec", referencedColumnName = "Id")
    @ManyToOne
    private VeMec idVemec;

    public AccionesMedicas() {
    }

    public AccionesMedicas(Integer id) {
        this.id = id;
    }

    public AccionesMedicas(Integer id, Date fechaHora, String nivelRiesgo, String descripcion, String medicoTratante) {
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

    public String getMedicoTratante() {
        return medicoTratante;
    }

    public void setMedicoTratante(String medicoTratante) {
        this.medicoTratante = medicoTratante;
    }

    public Pacientes getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Pacientes idPaciente) {
        this.idPaciente = idPaciente;
    }

    public VeMec getIdVemec() {
        return idVemec;
    }

    public void setIdVemec(VeMec idVemec) {
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
        if (!(object instanceof AccionesMedicas)) {
            return false;
        }
        AccionesMedicas other = (AccionesMedicas) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.AccionesMedicas[ id=" + id + " ]";
    }
    
}
