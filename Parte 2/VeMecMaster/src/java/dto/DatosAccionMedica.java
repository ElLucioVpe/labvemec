/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.Date;

/**
 *
 * @author Esteban
 */
public class DatosAccionMedica {
    private int idPaciente;
    private String nivelRiesgo;
    private String medicacion;
    private String descripcion;
    private Integer idVemec;
    private String medicoTratante;
    private boolean alta;
    private boolean defuncion;
    
    public DatosAccionMedica() {
    }

    public DatosAccionMedica(String nivelRiesgo, String medicacion, String descripcion, String medicoTratante, int id_paciente, Integer id_vemec, boolean alta, boolean defuncion) {
        this.nivelRiesgo = nivelRiesgo;
        this.medicacion = medicacion;
        this.descripcion = descripcion;
        this.medicoTratante = medicoTratante;
        this.idPaciente = id_paciente;
        this.idVemec = id_vemec;
        this.alta = alta;
        this.defuncion = defuncion;
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

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public Integer getIdVemec() {
        return idVemec;
    }

    public void setIdVemec(Integer idVemec) {
        this.idVemec = idVemec;
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
    
    public boolean getAlta() {
        return alta;
    }

    public void setAlta(boolean alta) {
        this.alta = alta;
    }
    
    public boolean getDefuncion() {
        return defuncion;
    }

    public void setDefuncion(boolean defuncion) {
        this.defuncion = defuncion;
    }
}
