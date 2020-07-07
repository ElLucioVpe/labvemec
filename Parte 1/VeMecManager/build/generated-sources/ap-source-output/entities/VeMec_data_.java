package entities;

import entities.VeMec;
import entities.VeMec_dataPK;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-04-07T00:56:34")
@StaticMetamodel(VeMec_data.class)
public class VeMec_data_ { 

    public static volatile SingularAttribute<VeMec_data, VeMec_dataPK> veMec_dataPK;
    public static volatile SingularAttribute<VeMec_data, Float> frecuencia;
    public static volatile SingularAttribute<VeMec_data, Date> timestampData;
    public static volatile SingularAttribute<VeMec_data, Float> presionEntrada;
    public static volatile SingularAttribute<VeMec_data, Float> presionMinima;
    public static volatile SingularAttribute<VeMec_data, Float> presionMaxima;
    public static volatile SingularAttribute<VeMec_data, VeMec> veMec;
    public static volatile SingularAttribute<VeMec_data, Float> temperaturaSalida;
    public static volatile SingularAttribute<VeMec_data, Float> presionSalida;
    public static volatile SingularAttribute<VeMec_data, Float> gas;
    public static volatile SingularAttribute<VeMec_data, Float> humedad;
    public static volatile SingularAttribute<VeMec_data, Float> temperaturaEntrada;
    public static volatile SingularAttribute<VeMec_data, Float> mezcla;

}