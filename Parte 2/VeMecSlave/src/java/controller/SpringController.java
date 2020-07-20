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
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpringController {
    ModelAndView mav = new ModelAndView();
    
    //Este codigo sera editado en el siguiente capitulo
    @RequestMapping("index.htm")
    public ModelAndView ListarTabla() {
        mav.setViewName("index");
        return mav;
    }
    
    @RequestMapping("datosVeMec.htm")
    public ModelAndView DatosActualesVeMec(HttpServletRequest request) {
        mav.setViewName("datosVeMec");
        return mav;
    }
}
