/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.Set;

/**
 *
 * @author cualit-mktg-dell-2
 */
@javax.ws.rs.ApplicationPath("webresources")
public class ApplicationConfig extends javax.ws.rs.core.Application {

    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> resources = new java.util.HashSet<>();
        addRestResourceClasses(resources);
        return resources;
    }

    /**
     * Do not modify addRestResourceClasses() method.
     * It is automatically populated with
     * all resources defined in the project.
     * If required, comment out calling this method in getClasses().
     */
    private void addRestResourceClasses(Set<Class<?>> resources) {
        resources.add(service.AccionesMedicasFacadeREST.class);
        resources.add(service.ContactosFacadeREST.class);
        resources.add(service.PacientesFacadeREST.class);
        resources.add(service.SlavesFacadeREST.class);
        resources.add(service.VemecsDataFacadeREST.class);
        resources.add(service.VemecsFacadeREST.class);
    }
    
}
