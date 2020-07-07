package entities;

import entities.VeMec_data;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-04-07T00:56:34")
@StaticMetamodel(VeMec.class)
public class VeMec_ { 

    public static volatile SingularAttribute<VeMec, String> marca;
    public static volatile SingularAttribute<VeMec, String> ubicacion;
    public static volatile CollectionAttribute<VeMec, VeMec_data> veMecdataCollection;
    public static volatile SingularAttribute<VeMec, Integer> id;
    public static volatile SingularAttribute<VeMec, String> modelo;

}