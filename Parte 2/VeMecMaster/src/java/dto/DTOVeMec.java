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
public class DTOVeMec {
    private String marca;
    private String modelo;
    private String ubicacion;
    private Integer idPaciente;
    private Integer id;
    private Integer idSlave;

    public DTOVeMec() {
    }

    public DTOVeMec(Integer id, String marca, String modelo, String ubicacion) {
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

    public Integer getIdSlave() {
        return idSlave;
    }

    public void setIdSlave(Integer idSlave) {
        this.idSlave = idSlave;
    }
    
    public Integer getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(Integer id) {
        this.idPaciente = id;
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
}
