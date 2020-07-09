/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import entities.Vemec;
import entities.Vemec_Data;

/**
 *
 * @author Esteban
 */
public class DatosVeMec {
    private Vemec vemec;
    private Vemec_Data ultimo_dato;
    private String paciente;

    public DatosVeMec() {
    }

    public DatosVeMec(Vemec vemec, Vemec_Data dato, String pac) {
        this.vemec = vemec;
        this.ultimo_dato = dato;
        this.paciente = pac;
    }
    
    public Vemec getVemec() {
        return vemec;
    }
    
    public Vemec_Data getUltimoDato() {
        return ultimo_dato;
    }
    
    public void setVemec(Vemec vem) {
        this.vemec = vem;
    }
    
    public void setUltimoDato(Vemec_Data dato) {
        this.ultimo_dato = dato;
    }
    
    public String getNombrePaciente() {
        return paciente;
    }
    
    public void setNombrePaciente(String pac) {
        this.paciente = pac;
    }
}
