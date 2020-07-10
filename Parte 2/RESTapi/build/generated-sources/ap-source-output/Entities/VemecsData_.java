package Entities;

import Entities.Pacientes;
import Entities.VemecsDataPK;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-10T15:24:13")
@StaticMetamodel(VemecsData.class)
public class VemecsData_ { 

    public static volatile SingularAttribute<VemecsData, Float> frecuencia;
    public static volatile SingularAttribute<VemecsData, Date> timestampData;
    public static volatile SingularAttribute<VemecsData, Integer> pulsaciones;
    public static volatile SingularAttribute<VemecsData, Float> presionEntrada;
    public static volatile SingularAttribute<VemecsData, VemecsDataPK> vemecsDataPK;
    public static volatile SingularAttribute<VemecsData, Integer> energia;
    public static volatile SingularAttribute<VemecsData, Float> presionMinima;
    public static volatile SingularAttribute<VemecsData, Float> presionMaxima;
    public static volatile SingularAttribute<VemecsData, Pacientes> idPaciente;
    public static volatile SingularAttribute<VemecsData, Float> temperaturaSalida;
    public static volatile SingularAttribute<VemecsData, Float> presionSalida;
    public static volatile SingularAttribute<VemecsData, Float> gas;
    public static volatile SingularAttribute<VemecsData, Float> humedad;
    public static volatile SingularAttribute<VemecsData, Boolean> conectadoCorriente;
    public static volatile SingularAttribute<VemecsData, Float> temperaturaEntrada;
    public static volatile SingularAttribute<VemecsData, Float> mezcla;

}