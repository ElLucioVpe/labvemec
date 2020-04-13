/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import Entities.VemecsData;
import Entities.VemecsDataPK;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author cualit-mktg-dell-2
 */
@javax.ejb.Stateless
@javax.ws.rs.Path("entities.vemecsdata")
public class VemecsDataFacadeREST extends AbstractFacade<VemecsData> {

    @PersistenceContext(unitName = "RESTapiPU")
    private EntityManager em;

    private VemecsDataPK getPrimaryKey(javax.ws.rs.core.PathSegment pathSegment) {
        /*
         * pathSemgent represents a URI path segment and any associated matrix parameters.
         * URI path part is supposed to be in form of 'somePath;idData=idDataValue;idVemec=idVemecValue'.
         * Here 'somePath' is a result of getPath() method invocation and
         * it is ignored in the following code.
         * Matrix parameters are used as field names to build a primary key instance.
         */
        Entities.VemecsDataPK key = new Entities.VemecsDataPK();
        javax.ws.rs.core.MultivaluedMap<String, String> map = pathSegment.getMatrixParameters();
        java.util.List<String> idData = map.get("idData");
        if (idData != null && !idData.isEmpty()) {
            key.setIdData(new java.lang.Integer(idData.get(0)));
        }
        java.util.List<String> idVemec = map.get("idVemec");
        if (idVemec != null && !idVemec.isEmpty()) {
            key.setIdVemec(new java.lang.Integer(idVemec.get(0)));
        }
        return key;
    }

    public VemecsDataFacadeREST() {
        super(VemecsData.class);
    }

    @javax.ws.rs.POST
    @Override
    @javax.ws.rs.Consumes({javax.ws.rs.core.MediaType.APPLICATION_XML, javax.ws.rs.core.MediaType.APPLICATION_JSON})
    public void create(VemecsData entity) {
        super.create(entity);
    }

    @javax.ws.rs.PUT
    @javax.ws.rs.Path("{id}")
    @javax.ws.rs.Consumes({javax.ws.rs.core.MediaType.APPLICATION_XML, javax.ws.rs.core.MediaType.APPLICATION_JSON})
    public void edit(@javax.ws.rs.PathParam("id") javax.ws.rs.core.PathSegment id, VemecsData entity) {
        super.edit(entity);
    }

    @javax.ws.rs.DELETE
    @javax.ws.rs.Path("{id}")
    public void remove(@javax.ws.rs.PathParam("id") javax.ws.rs.core.PathSegment id) {
        Entities.VemecsDataPK key = getPrimaryKey(id);
        super.remove(super.find(key));
    }

    @javax.ws.rs.GET
    @javax.ws.rs.Path("{id}")
    @javax.ws.rs.Produces({javax.ws.rs.core.MediaType.APPLICATION_XML, javax.ws.rs.core.MediaType.APPLICATION_JSON})
    public VemecsData find(@javax.ws.rs.PathParam("id") javax.ws.rs.core.PathSegment id) {
        Entities.VemecsDataPK key = getPrimaryKey(id);
        return super.find(key);
    }

    @javax.ws.rs.GET
    @Override
    @javax.ws.rs.Produces({javax.ws.rs.core.MediaType.APPLICATION_XML, javax.ws.rs.core.MediaType.APPLICATION_JSON})
    public List<VemecsData> findAll() {
        return super.findAll();
    }

    @javax.ws.rs.GET
    @javax.ws.rs.Path("{from}/{to}")
    @javax.ws.rs.Produces({javax.ws.rs.core.MediaType.APPLICATION_XML, javax.ws.rs.core.MediaType.APPLICATION_JSON})
    public List<VemecsData> findRange(@javax.ws.rs.PathParam("from") Integer from, @javax.ws.rs.PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @javax.ws.rs.GET
    @javax.ws.rs.Path("count")
    @javax.ws.rs.Produces(javax.ws.rs.core.MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}
