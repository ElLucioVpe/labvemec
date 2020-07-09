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
import dto.DatosVeMec;
import entities.Paciente;
import entities.Slave;
import entities.Vemec;
import entities.Vemec_Data;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
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
    
    @RequestMapping("index.htm")
    public ModelAndView getIndex() {
        mav.setViewName("index");
        return mav;
    }
    
    //Secciones
    @RequestMapping("secciones.htm")
    public ModelAndView ListarSecciones() {
        String consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("secciones");
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
        if(request.getParameter("id") == null) return new ModelAndView("redirect:index.htm");
        
        id = Integer.parseInt(request.getParameter("id"));
        //Obtengo Slave
        String consulta = "select * from slaves where id="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("slave", datos.get(0));
        //Obtengo VeMecs
        datos = new ArrayList<>();
        consulta = "select * from vemecs where id_slave="+id;
        List<Vemec> vemecs = this.template.query(consulta, new BeanPropertyRowMapper<>(Vemec.class));
        
        vemecs.forEach((vem) -> {
            //Obtengo el nombre del paciente
            Paciente pac = vem.getIdPaciente();
            String pac_nombre = "";
            if(pac != null) pac_nombre = pac.getNombre();
            //Obtengo el ultimo dato
            String query = "select * from vemecs_data where Id_Vemec="+vem.getId()+" order by Timestamp_Data";
            List<Vemec_Data> vemecs_data = this.template.query(query, new BeanPropertyRowMapper<>(Vemec_Data.class));
            DatosVeMec data = new DatosVeMec(vem, null, pac_nombre);
            if(!vemecs_data.isEmpty()) data.setUltimoDato(vemecs_data.get(vemecs_data.size()-1));
           //System.out.print(vem);
            datos.add(data);
        });
       
        mav.addObject("datos_vemecs", datos);
        mav.setViewName("seccion");
        return mav;
    }
    
    //Pacientes
    @RequestMapping(value = "agregarPaciente.htm", method = RequestMethod.GET)
    public ModelAndView AltaPaciente() {
        //Secciones/Slaves para seleccionar
        String consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        //
        //Vemecs para seleccionar
        consulta = "select * from vemecs where id_paciente=NULL";
        datos = this.template.queryForList(consulta);
        mav.addObject("vemecs_libres", datos);
        //
        mav.addObject(new Paciente());
        mav.setViewName("agregarPaciente");
        return mav;
    }
    
    @RequestMapping(value = "agregarPaciente.htm", method = RequestMethod.POST)
    public ModelAndView AltaPaciente(Paciente pac) {
        String consulta = "insert into pacientes(CI, Nombre, Sexo, Edad, Nacionalidad,"
                + " Lugar_Residencia, Direccion, Coordenadas, Antecedentes_Clinicos, Nivel_Riesgo,"
                + "Defuncion, id_vemec) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        this.template.update(consulta, pac.getCi(), pac.getNombre(), pac.getSexo(), pac.getEdad(), 
                pac.getNacionalidad(), pac.getLugarResidencia(), pac.getDireccion(), pac.getCoordenadas(),
                pac.getAntecedentesClinicos(), pac.getNivelRiesgo(), false, pac.getIdVemec());
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping(value = "modificarPaciente.htm", method = RequestMethod.GET)
    public ModelAndView ModificarPaciente(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from pacientes where id="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        //Secciones/Slaves para seleccionar
        consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        //
        //Vemecs para seleccionar
        consulta = "select * from vemecs where id_paciente=NULL";
        datos = this.template.queryForList(consulta);
        mav.addObject("vemecs_libres", datos);
        //
        mav.setViewName("modificarPaciente");
        return mav;
    }
    
    @RequestMapping(value = "modificarSeccion.htm", method = RequestMethod.POST)
    public ModelAndView ModificarPaciente(Paciente pac) {
        String consulta = "update pacientes set CI=?, Nombre=?, Sexo=?, Edad=?, Nacionalidad=?,"
                + " Lugar_Residencia=?, Direccion=?, Coordenadas=?, Antecedentes_Clinicos=?, Nivel_Riesgo=?,"
                + "Defuncion=?, id_vemec=? where id="+id;
        this.template.update(consulta, pac.getCi(), pac.getNombre(), pac.getSexo(), pac.getEdad(), 
                pac.getNacionalidad(), pac.getLugarResidencia(), pac.getDireccion(), pac.getCoordenadas(),
                pac.getAntecedentesClinicos(), pac.getNivelRiesgo(), pac.getDefuncion(), pac.getIdVemec());
        return new ModelAndView("redirect:/index.htm");
    }
    
    @RequestMapping("bajaPaciente.htm")
    public ModelAndView BajaPaciente(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from contactos where id_paciente="+id;
        this.template.update(consulta);
        consulta = "delete from pacientes where id="+id;
        this.template.update(consulta);
        return new ModelAndView("redirect:/index.htm");
    }
    //
    
    //AccionesMedicas
    @RequestMapping(value = "accionesMedicas.htm", method = RequestMethod.GET)
    public ModelAndView ListarAccionesMedicas(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from acciones_medicas where id_paciente="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("accionesMedicas");
        return mav;
    }
    
    @RequestMapping("bajaAccionMedica.htm")
    public ModelAndView BajaAccionMedica(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from acciones_medicas where id="+id;
        this.template.update(consulta);
        return new ModelAndView("redirect:/accionesMedicas.htm");
    }
    //VeMecs
    //Este codigo sera editado en el siguiente capitulo
    @RequestMapping("vemecs.htm")
    public ModelAndView ListarVeMecs() {
        String consulta = "select * from vemecs";
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("vemecs");
        return mav;
    }
    
    @RequestMapping(value = "altaVeMec.htm", method = RequestMethod.GET)
    public ModelAndView AltaVeMec() {
        mav.addObject(new Vemec());
        mav.setViewName("altaVeMec");
        return mav;
    }
    
    @RequestMapping(value = "altaVeMec.htm", method = RequestMethod.POST)
    public ModelAndView AltaVeMec(Vemec vem) {
        String consulta = "insert into vemecs(Marca, Modelo, Ubicacion) values(?,?,?)";
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion());
        return new ModelAndView("redirect:/vemecs.htm");
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
    public ModelAndView ModificarVeMec(Vemec vem) {
        String consulta = "update vemecs set Marca=?,Modelo=?,Ubicacion=? where Id="+id;
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion());
        return new ModelAndView("redirect:/vemecs.htm");
    }
    
    @RequestMapping("bajaVeMec.htm")
    public ModelAndView BajaVeMec(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from vemecs_data where Id_VeMec="+id;
        this.template.update(consulta);
        consulta = "delete from vemecs where Id="+id;
        this.template.update(consulta);
        return new ModelAndView("redirect:/vemecs.htm");
    }
    
    @RequestMapping("datosVeMec.htm")
    public ModelAndView DatosActualesVeMec(HttpServletRequest request) {
        //en ultima timestamp
        //con graficas presión de entrada y presión de salida
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from vemecs_data where Id_Vemec="+id+" order by Timestamp_Data";
        datos = this.template.queryForList(consulta);
        
        mav.addObject("datos", datos);
        mav.addObject("id", id);
        if(!datos.isEmpty()) {
            mav.addObject("ultimo_dato", datos.get(datos.size()-1));
        } else {
            mav.addObject("ultimo_dato", null);
        }
        mav.setViewName("datosVeMec");
        return mav;
    }
    
    @RequestMapping("registrosVeMec.htm")
    public ModelAndView RegistrosVeMec(HttpServletRequest request) {
        //paginado
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from vemecs_data where Id_Vemec="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("registrosVeMec");
        return mav;
    }
}
