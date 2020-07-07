/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conf;

/**
 *
 * @author esteban
 */

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;

@ApplicationPath("/VeMecSlave/")
public class VeMecSlaveApplication extends ResourceConfig {
    public VeMecSlaveApplication(){
        register(CORSFilter.class);
    }
}
