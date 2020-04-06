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
import entitites.VeMec;
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
    List datosTabla;
    
    //Este codigo sera editado en el siguiente capitulo
    @RequestMapping("index.htm")
    public ModelAndView ListarTabla() {
        String consulta = "select * from VeMecs";
        datosTabla = this.template.queryForList(consulta);
        mav.addObject("lista", datosTabla);
        mav.setViewName("index");
        return mav;
    }
    
    @RequestMapping(value = "altaVeMec.htm", method = RequestMethod.GET)
    public ModelAndView AltaVeMec() {
        mav.addObject(new VeMec());
        mav.setViewName("altaVeMec");
        return mav;
    }
    
    @RequestMapping(value = "altaVeMec.htm", method = RequestMethod.POST)
    public ModelAndView AltaVeMec(VeMec vem) {
        String consulta = "insert into VeMecs(Marca, Modelo, Ubicacion) values(?,?,?)";
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion);
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping(value = "modificarVeMec.htm", method = RequestMethod.GET)
    public ModelAndView ModificarVeMec(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from VeMecs where ID="+id;
        datosTabla = this.template.queryForList(consulta);
        mav.addObject("lista", datosTabla);
        mav.setViewName("modificarVeMec");
        return mav;
    }
    
    @RequestMapping(value = "modificarVeMec.htm", method = RequestMethod.POST)
    public ModelAndView ModificarVeMec(VeMec vem) {
        String consulta = "update VeMecs set Marca=?,Modelo=?,Ubicacion=? where ID="+id;
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion);
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping("bajaVeMec.htm")
    public ModelAndView BajaVeMec(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from VeMecs where id="+id;
        this.template.update(consulta);
        return new ModelAndView("redirect:/index.htm");
    }
}
