/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import entities.Vemec;
import entities.Vemec_Data;
import java.util.List;

/**
 *
 * @author Esteban
 */
public class DatosVeMec {
    private Vemec vemec;
    private List<Vemec_Data> registros;

    public DatosVeMec() {
    }

    public DatosVeMec(Vemec vemec, List<Vemec_Data> lista) {
        this.vemec = vemec;
        this.registros = lista;
    }
    
    public Vemec getVemec() {
        return vemec;
    }
    
    public Vemec_Data getUltimoDato() {
        if(registros != null) return registros.get(registros.size()-1);
        else return null;
    }
    
    public List<Vemec_Data> getRegistros() {
        return registros;
    }
    
    public void setVemec(Vemec vem) {
        this.vemec = vem;
    }
    
    public void setRegistros(List<Vemec_Data> lista) {
        this.registros = lista;
    }

}
