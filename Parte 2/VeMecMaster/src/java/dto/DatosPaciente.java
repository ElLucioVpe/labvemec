/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.util.List;

/**
 *
 * @author Esteban
 */
public class DatosPaciente {
    
    private String ci;
    private String nombre;
    private String sexo;
    private int edad;
    private String nacionalidad;
    private String lugarResidencia;
    private String direccion;
    private String coordenadas;
    private String antecedentesClinicos;
    private String nivelRiesgo;
    private boolean defuncion;
    private Integer id;
    private Integer idVemec;
    private List<DatosContacto> contactos;

    public DatosPaciente() {
    }

    public DatosPaciente(Integer id, String ci, String nombre, String sexo, int edad, String nacionalidad, String lugarResidencia, String direccion, String coordenadas, String antecedentesClinicos, String nivelRiesgo, boolean defuncion) {
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

    public Integer getIdVemec() {
        return idVemec;
    }

    public void setIdVemec(Integer idVemec) {
        this.idVemec = idVemec;
    }
    
    public List<DatosContacto> getContactoCollection() {
        return contactos;
    }

    public void setContactoCollection(List<DatosContacto> contactos) {
        this.contactos = contactos;
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
    
}
