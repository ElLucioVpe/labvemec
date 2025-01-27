/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Esteban
 */
public class DTOContacto {
    private String nombre;
    private String infocontacto;
    private boolean esPaciente;
    private Integer id;
    private Integer idPaciente;

    public DTOContacto() {
    }

    public DTOContacto(Integer id, String nombre, String infocontacto, boolean esPaciente) {
        this.id = id;
        this.nombre = nombre;
        this.infocontacto = infocontacto;
        this.esPaciente = esPaciente;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getInfocontacto() {
        return infocontacto;
    }

    public void setInfocontacto(String infocontacto) {
        this.infocontacto = infocontacto;
    }


    public Integer getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Integer idPaciente) {
        this.idPaciente = idPaciente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean getEsPaciente() {
        return esPaciente;
    }

    public void setEsPaciente(boolean esPaciente) {
        this.esPaciente = esPaciente;
    }
}
