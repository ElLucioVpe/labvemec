/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
/**
 *
 * @author esteban
 */
import conf.Connection;
import entities.Slave;
//import entities.VeMec_data;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpringController {
    
    Connection con = new Connection();
    JdbcTemplate template = new JdbcTemplate(con.getConnection());
    ModelAndView mav = new ModelAndView();
    int id;
    List datos;
    
    //Este codigo sera editado en el siguiente capitulo
    @RequestMapping("index.htm")
    public ModelAndView ListarTabla() {
        String consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("index");
        return mav;
    }
    
    @RequestMapping(value = "altaSeccion.htm", method = RequestMethod.GET)
    public ModelAndView AltaSeccion() {
        mav.addObject(new Slave());
        mav.setViewName("altaSeccion");
        return mav;
    }
    
    @RequestMapping(value = "altaSeccion.htm", method = RequestMethod.POST)
    public ModelAndView AltaSeccion(Slave slv) {
        String consulta = "insert into slaves(Nombre, Intervalo_Envio, Intervalo_Emergencia) values(?,?,?)";
        this.template.update(consulta, slv.getNombre(), slv.getIntervaloEnvio(), slv.getIntervaloEmergencia());
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping(value = "modificarSeccion.htm", method = RequestMethod.GET)
    public ModelAndView ModificarSeccion(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from slaves where id="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("modificarSeccion");
        return mav;
    }
    
    @RequestMapping(value = "modificarSeccion.htm", method = RequestMethod.POST)
    public ModelAndView ModificarSeccion(Slave slv) {
        String consulta = "update slaves set Nombre=?,Intervalo_Envio=?,Intervalo_Emergencia=? where id="+id;
        this.template.update(consulta, slv.getNombre(), slv.getIntervaloEnvio(), slv.getIntervaloEmergencia());
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping("bajaSeccion.htm")
    public ModelAndView BajaSeccion(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        //String consulta = "delete from vemecs_data where Id_VeMec="+id;
        //this.template.update(consulta);
        //consulta = "delete from vemecs where Id="+id;
        String consulta = "delete from slaves where Id="+id;
        this.template.update(consulta);
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping("seccion.htm")
    public ModelAndView DatosSeccion(HttpServletRequest request) {
        /*id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from vemecs where id_slave="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);*/
        mav.setViewName("seccion");
        return mav;
    }
}
