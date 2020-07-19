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
import dto.DTOAccionMedica;
import dto.DTOContacto;
import dto.DTOPaciente;
import dto.DTOVeMec;
import dto.DatosVeMec;
import entities.AccionMedica;
import entities.Paciente;
import entities.Slave;
import entities.Vemec;
import entities.Vemec_Data;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpringController {
    
    Connection con = new Connection();
    JdbcTemplate template = new JdbcTemplate(con.getConnection());
    ModelAndView mav = new ModelAndView();
    int id;
    List datos;
    
    @RequestMapping("/")
    public ModelAndView getIndex() {
        mav.setViewName("index");
        return mav;
    }
    
    //Secciones
    @RequestMapping("/secciones")
    public ModelAndView ListarSecciones() {
        String consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("secciones");
        return mav;
    }
    
    @RequestMapping(value = "/altaSeccion", method = RequestMethod.GET)
    public ModelAndView AltaSeccion() {
        mav.addObject(new Slave());
        mav.setViewName("altaSeccion");
        return mav;
    }
    
    @RequestMapping(value = "/altaSeccion", method = RequestMethod.POST)
    public ModelAndView AltaSeccion(Slave slv) {
        String consulta = "insert into slaves(Nombre, Intervalo_Envio, Intervalo_Emergencia) values(?,?,?)";
        this.template.update(consulta, slv.getNombre(), slv.getIntervaloEnvio(), slv.getIntervaloEmergencia());
        return new ModelAndView("forward:/");
    }
    
    @RequestMapping(value = "/modificarSeccion", method = RequestMethod.GET)
    public ModelAndView ModificarSeccion(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from slaves where id="+id;
        datos = this.template.queryForList(consulta);
        if(datos.isEmpty()) return new ModelAndView("forward:/");
        mav.addObject("lista", datos);
        mav.setViewName("modificarSeccion");
        return mav;
    }
    
    @RequestMapping(value = "/modificarSeccion", method = RequestMethod.POST)
    public ModelAndView ModificarSeccion(Slave slv) {
        String consulta = "update slaves set Nombre=?,Intervalo_Envio=?,Intervalo_Emergencia=? where id="+id;
        this.template.update(consulta, slv.getNombre(), slv.getIntervaloEnvio(), slv.getIntervaloEmergencia());
        return new ModelAndView("forward:/secciones");
    }
    
    @RequestMapping(value="/bajaSeccion", method = RequestMethod.GET)
    public ModelAndView BajaSeccion(int id) {
        //String consulta = "update vemecs set id_slave=? where id_slave="+id;
        //this.template.update(consulta);
        //consulta = "delete from vemecs where Id="+id;
        String consulta = "select * from vemecs where id_slave="+id;
        datos = this.template.queryForList(consulta);
        if(datos.isEmpty()){
            consulta = "delete from slaves where Id="+id;
            this.template.update(consulta);
        }
        
        return new ModelAndView("forward:/secciones");
    }
    
    @RequestMapping(value="/seccionVacia", method = RequestMethod.POST)
    public @ResponseBody boolean seccionVacia(Integer id) {
        String consulta = "select * from vemecs where id_slave="+id;
        datos = this.template.queryForList(consulta);
        return datos.isEmpty();
    }
    
    @RequestMapping("/seccion")
    public ModelAndView DatosSeccion(HttpServletRequest request) {
        if(request.getParameter("id") == null) return new ModelAndView("forward:/");
        
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
            DatosVeMec data = new DatosVeMec();
            //Obtengo el paciente
            String query = "select * from pacientes where id_vemec="+vem.getId();
            List<Paciente> pacientes = this.template.query(query, new BeanPropertyRowMapper<>(Paciente.class));
            //Si el paciente existe, lo agrego al vemec y busco sus datos
            if(!pacientes.isEmpty()) {
                Paciente pac = pacientes.get(0);
                vem.setIdPaciente(pac); //Al traerlo del query no trae bien la entidad por eso lo obtenemos asi
                //Obtengo los registros del paciente
                query = "select * from vemecs_data where Id_Vemec="+vem.getId()+" and id_paciente="+pac.getId()+" order by Timestamp_Data";
                List<Vemec_Data> vemecs_data = this.template.query(query, new BeanPropertyRowMapper<>(Vemec_Data.class));
                data.setRegistros(vemecs_data);
            }
            data.setVemec(vem);
            datos.add(data);
        });
        mav.addObject("datos_vemecs", datos);
        
        //Secciones/Slaves para seleccionar
        consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        //
        //Vemecs para seleccionar
        consulta = "select * from vemecs where id_paciente IS NULL";
        datos = this.template.queryForList(consulta);
        mav.addObject("vemecs_libres", datos);
        //
        
        mav.setViewName("seccion");
        return mav;
    }
    
    //Pacientes
    @RequestMapping("/pacientes")
    public ModelAndView DatosPacientes(HttpServletRequest request) {
        String consulta = "select * from pacientes";
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        //Secciones/Slaves para seleccionar
        consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        //
        //Vemecs para seleccionar
        consulta = "select * from vemecs where id_paciente IS NULL";
        datos = this.template.queryForList(consulta);
        mav.addObject("vemecs_libres", datos);
        //
        mav.setViewName("pacientes");
        return mav;
    }
    
    @RequestMapping(value = "/agregarPaciente", method = RequestMethod.GET)
    public ModelAndView AltaPaciente() {
        //Secciones/Slaves para seleccionar
        String consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        //
        //Vemecs para seleccionar
        consulta = "select * from vemecs where id_paciente IS NULL";
        datos = this.template.queryForList(consulta);
        mav.addObject("vemecs_libres", datos);
        //
        mav.addObject(new DTOPaciente());
        mav.setViewName("agregarPaciente");
        return mav;
    }
    
    @RequestMapping(value = "/agregarPaciente", method = RequestMethod.POST)
    public ModelAndView AltaPaciente(@Valid DTOPaciente pac, BindingResult result) {
        String consulta = "insert into pacientes(CI, Nombre, Sexo, Edad, Nacionalidad,"
                + " Lugar_Residencia, Direccion, Coordenadas, Antecedentes_Clinicos, Nivel_Riesgo,"
                + "Defuncion, id_vemec) values(?,?,?,?,?,?,?,?,?,?,?,?)";
        this.template.update(consulta, pac.getCi(), pac.getNombre(), pac.getSexo(), pac.getEdad(), 
                pac.getNacionalidad(), pac.getLugarResidencia(), pac.getDireccion(), pac.getCoordenadas(),
                pac.getAntecedentesClinicos(), pac.getNivelRiesgo(), false, pac.getIdVemec());
        
        if(pac.getIdVemec() != null) {
            consulta = "select * from pacientes where id_vemec="+pac.getIdVemec();
            List<Paciente> data = this.template.query(consulta, new BeanPropertyRowMapper<>(Paciente.class));
            if(!data.isEmpty()) { 
                consulta = "update vemecs set id_paciente=? where Id="+pac.getIdVemec();
                this.template.update(consulta, data.get(0).getId());
            }
        }
        if(pac.getContactos() != null) {
            consulta = "select * from pacientes where CI='"+pac.getCi()+"'";
            List<Paciente> data = this.template.query(consulta, new BeanPropertyRowMapper<>(Paciente.class));
            if(!data.isEmpty()) { 
                pac.getContactos().forEach(contacto -> {
                    System.out.print("holaa--"+contacto.getInfocontacto()+contacto.getNombre());
                    String cons = "insert into contactos(id_paciente, Nombre, Info_contacto, esPaciente) values(?,?,?,?)";
                    this.template.update(cons, data.get(0).getId(), contacto.getNombre(), contacto.getInfocontacto(), contacto.getEsPaciente());
                });
            }
        }
        return new ModelAndView("forward:/");
    }
    
    @RequestMapping(value = "/modificarPaciente", method = RequestMethod.GET)
    public ModelAndView ModificarPaciente(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from pacientes where id="+id;
        datos = this.template.queryForList(consulta);
        if(datos.isEmpty()) return new ModelAndView("forward:/");
        mav.addObject("paciente", datos.get(0));
        //Secciones/Slaves para seleccionar
        consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        //
        //Vemecs para seleccionar
        consulta = "select * from vemecs where id_paciente IS NULL";
        datos = this.template.queryForList(consulta);
        mav.addObject("vemecs_libres", datos);
        //
        mav.setViewName("modificarPaciente");
        return mav;
    }
    
    @RequestMapping(value = "/modificarPaciente", method = RequestMethod.POST)
    public ModelAndView ModificarPaciente(DTOPaciente pac) {
        String consulta = "update pacientes set CI=?, Nombre=?, Sexo=?, Edad=?, Nacionalidad=?,"
                + " Lugar_Residencia=?, Direccion=?, Coordenadas=?, Antecedentes_Clinicos=?, Nivel_Riesgo=?,"
                + "Defuncion=?, id_vemec=? where id="+id;
        this.template.update(consulta, pac.getCi(), pac.getNombre(), pac.getSexo(), pac.getEdad(), 
                pac.getNacionalidad(), pac.getLugarResidencia(), pac.getDireccion(), pac.getCoordenadas(),
                pac.getAntecedentesClinicos(), pac.getNivelRiesgo(), pac.getDefuncion(), pac.getIdVemec());
        
        if(pac.getIdVemec()!= null){
            consulta = "update vemecs set id_paciente=? where Id="+pac.getIdVemec();
            this.template.update(consulta, pac.getId());
        }
        
        //Elimino los contactos y luego agrego los que dejo el usuario
        consulta = "delete from contactos where id_paciente="+pac.getId();
        this.template.update(consulta);
        if(pac.getContactos() != null) {
            pac.getContactos().forEach(contacto -> {
                String cons = "insert into contactos(id_paciente, Nombre, Info_contacto, esPaciente) values(?,?,?,?)";
                this.template.update(cons, pac.getId(), contacto.getNombre(), contacto.getInfocontacto(), contacto.getEsPaciente());
            });
        }
        
        return new ModelAndView("forward:/");
    }
    
    @RequestMapping("/bajaPaciente")
    public ModelAndView BajaPaciente(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from contactos where id_paciente="+id;
        this.template.update(consulta);
        consulta = "delete from vemecs_data where id_paciente="+id;
        this.template.update(consulta);
        consulta = "update vemecs set id_paciente=NULL where id_paciente="+id;
        this.template.update(consulta);
        consulta = "delete from pacientes where id="+id;
        this.template.update(consulta);
        return new ModelAndView("forward:/");
    }
    
    @RequestMapping(value="/getPaciente", method = RequestMethod.POST)
    public @ResponseBody Paciente GetPaciente(Integer id) {
        String consulta = "select * from pacientes where id="+id;
        List<Paciente> data = this.template.query(consulta, new BeanPropertyRowMapper<>(Paciente.class));
        if(!data.isEmpty()) {
            Paciente pac = data.get(0);
            consulta = "select * from contactos where id_paciente="+id;
            List contactos = this.template.queryForList(consulta);
            pac.setContactoCollection(contactos);
            return pac;
        }
        else return null;
    }
    
    @RequestMapping(value="/getContactosPaciente", method = RequestMethod.POST)
    public @ResponseBody List getContactosPaciente(Integer id) {
        String consulta = "select * from contactos where id_paciente="+id;
        datos = this.template.queryForList(consulta);
        return datos;
    }
    
    @RequestMapping(value="/existeCI", method = RequestMethod.POST)
    public @ResponseBody boolean existeCI(String ci) {
        String consulta = "select * from pacientes where CI='"+ci+"'";
        datos = this.template.queryForList(consulta);
        return !datos.isEmpty();
    }
    //
    
    //AccionesMedicas
    @RequestMapping(value = "/accionesMedicas", method = RequestMethod.GET)
    public ModelAndView ListarAccionesMedicas(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from acciones_medicas where id_paciente="+id;
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("accionesMedicas");
        return mav;
    }
    
    @RequestMapping(value="/getHistorialMedico", method = RequestMethod.POST)
    public @ResponseBody List<AccionMedica> GetHistorialMedico(Integer id) {
        String consulta = "select * from acciones_medicas where id_paciente="+id;
        List<AccionMedica> data = this.template.query(consulta, new BeanPropertyRowMapper<>(AccionMedica.class));
        
        //Encuentro data vemec en el caso de que tenga
        data.forEach((accion) -> {
            if(accion.getIdVemec() != null) {
                String cons = "select * from vemecs where Id="+accion.getIdVemec().getId();
                accion.setIdVemec(this.template.query(consulta, new BeanPropertyRowMapper<>(Vemec.class)).get(0));
            }
        });
        
        return data;
    }
    
    @RequestMapping(value="/getRegistrosGrafica", method = RequestMethod.POST)
    public @ResponseBody List<Vemec_Data> getRegistrosGrafica(Integer id) {
        String consulta = "select * from vemecs_data where id_paciente="+id;
        List<Vemec_Data> data = this.template.query(consulta, new BeanPropertyRowMapper<>(Vemec_Data.class));
        
        //Cada 1 hora
        datos = new ArrayList<>();
        if(!data.isEmpty()) {
            Vemec_Data anterior = data.get(0);
            datos.add(anterior);
            for(int i = 0; i < data.size(); i++) {
                Vemec_Data dato = data.get(i);
                //System.out.print(i+"--"+dato.getTimestampData());
                long diff = dato.getTimestampData().getTime() - anterior.getTimestampData().getTime();
                diff = diff / (60 * 60 * 1000);
                if(diff >= 1) {
                    anterior = dato;
                    datos.add(dato);
                }
            }
        }
        return datos;
    }
    
    
    @RequestMapping(value = "/altaAccionMedica", method = RequestMethod.POST)
    public @ResponseBody DTOAccionMedica AltaAccionMedica(@RequestBody DTOAccionMedica amed) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        if(amed.getAlta() || amed.getDefuncion()) {
            String cons = "update vemecs set id_paciente=NULL where id_paciente="+amed.getIdPaciente();
            this.template.update(cons);
            if(amed.getDefuncion()){
                cons = "update pacientes set Defuncion=1 where id="+amed.getIdPaciente();
                this.template.update(cons);
            }
            cons = "update pacientes set id_vemec=NULL where id="+amed.getIdPaciente();
            this.template.update(cons);
        }
        
        String consulta = "insert into acciones_medicas(id_paciente, fecha_hora, nivel_riesgo,"
                + "medicacion, descripcion, id_vemec, medico_tratante) values(?,?,?,?,?,?,?)";
        this.template.update(consulta, amed.getIdPaciente(), formatter.format(new Date()), amed.getNivelRiesgo(),
                amed.getMedicacion(), amed.getDescripcion(), amed.getIdVemec(), amed.getMedicoTratante());
        
        return amed;
    }
    
    @RequestMapping("/bajaAccionMedica")
    public ModelAndView BajaAccionMedica(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from acciones_medicas where id="+id;
        this.template.update(consulta);
        return new ModelAndView("forward:/");
    }
    //VeMecs
    //Este codigo sera editado en el siguiente capitulo
    @RequestMapping("/vemecs")
    public ModelAndView ListarVeMecs() {
        String consulta = "select * from vemecs";
        datos = this.template.queryForList(consulta);
        mav.addObject("lista", datos);
        mav.setViewName("vemecs");
        return mav;
    }
    
    @RequestMapping(value = "/altaVeMec", method = RequestMethod.GET)
    public ModelAndView AltaVeMec() {
        String consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        mav.addObject(new DatosVeMec());
        mav.setViewName("altaVeMec");
        return mav;
    }
    
    @RequestMapping(value = "/altaVeMec", method = RequestMethod.POST)
    public ModelAndView AltaVeMec(DTOVeMec vem) {
        String consulta = "insert into vemecs(Marca, Modelo, Ubicacion, id_slave) values(?,?,?,?)";
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion(), vem.getIdSlave());
        return new ModelAndView("forward:/vemecs");
    }
    
    @RequestMapping(value = "/modificarVeMec", method = RequestMethod.GET)
    public ModelAndView ModificarVeMec(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "select * from vemecs where Id="+id;
        datos = this.template.queryForList(consulta);
        if(datos.isEmpty()) return new ModelAndView("forward:/index");
        mav.addObject("lista", datos);
        
        consulta = "select * from slaves";
        datos = this.template.queryForList(consulta);
        mav.addObject("slaves", datos);
        mav.setViewName("modificarVeMec");
        return mav;
    }
    
    @RequestMapping(value = "/modificarVeMec", method = RequestMethod.POST)
    public ModelAndView ModificarVeMec(DTOVeMec vem) {
        String consulta = "update vemecs set Marca=?,Modelo=?,Ubicacion=?,id_slave=? where Id="+id;
        this.template.update(consulta, vem.getMarca(), vem.getModelo(), vem.getUbicacion(), vem.getIdSlave());
        return new ModelAndView("forward:/vemecs");
    }
    
    @RequestMapping("/bajaVeMec")
    public ModelAndView BajaVeMec(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String consulta = "delete from vemecs_data where Id_VeMec="+id;
        this.template.update(consulta);
        consulta = "update pacientes set id_vemec=NULL where id_vemec="+id;
        this.template.update(consulta);
        consulta = "delete from vemecs where Id="+id;
        this.template.update(consulta);
        return new ModelAndView("forward:/vemecs");
    }
    
    @RequestMapping("/datosVeMec")
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
    
    @RequestMapping("/registrosVeMec")
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
