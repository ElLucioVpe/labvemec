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
import entities.VeMec;
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
        String consulta = "select * from vemecs";
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
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
        String consulta = "insert into vemecs(Marca, Modelo, Ubicacion) values(?,?,?)";
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion());
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping(value = "modificarVeMec.htm", method = RequestMethod.GET)
    public ModelAndView ModificarVeMec(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from vemecs where Id="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("modificarVeMec");
        return mav;
    }
    
    @RequestMapping(value = "modificarVeMec.htm", method = RequestMethod.POST)
    public ModelAndView ModificarVeMec(VeMec vem) {
        String consulta = "update vemecs set Marca=?,Modelo=?,Ubicacion=? where Id="+id;
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion());
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping("bajaVeMec.htm")
    public ModelAndView BajaVeMec(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from vemecs where Id="+id;
        this.template.update(consulta);
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping("datosVeMec.htm")
    public ModelAndView DatosActualesVeMec(VeMec vem) {
        //en ultima timestamp
        //con graficas presión de entrada y presión de salida
        String consulta = "select * from vemecs where Id_Vemec=?";
        datos = this.template.queryForList(consulta, vem.getId());
        mav.addObject("datos", datos);
        mav.setViewName("datosVeMec");
        return mav;
    }
    
    @RequestMapping("registrosVeMec.htm")
    public ModelAndView RegistrosVeMec(VeMec vem) {
        //paginado
        String consulta = "select * from vemecs_data where Id_Vemec=?";
        datos = this.template.queryForList(consulta, vem.getId());
        mav.addObject("lista", datos);
        mav.setViewName("registrosVeMec");
        return mav;
    }
}
