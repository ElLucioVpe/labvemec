package Entities;

import Entities.AccionesMedicas;
import Entities.Pacientes;
import Entities.Slaves;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-07-10T15:24:13")
@StaticMetamodel(Vemecs.class)
public class Vemecs_ { 

    public static volatile SingularAttribute<Vemecs, Pacientes> idPaciente;
    public static volatile SingularAttribute<Vemecs, String> marca;
    public static volatile SingularAttribute<Vemecs, String> ubicacion;
    public static volatile SingularAttribute<Vemecs, Slaves> idSlave;
    public static volatile SingularAttribute<Vemecs, Integer> id;
    public static volatile CollectionAttribute<Vemecs, AccionesMedicas> accionesMedicasCollection;
    public static volatile CollectionAttribute<Vemecs, Pacientes> pacientesCollection;
    public static volatile SingularAttribute<Vemecs, String> modelo;

}