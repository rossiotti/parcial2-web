package clases;

import javax.persistence.*;
import java.util.List;

@Entity
public class Album {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "alb_generator")
    @SequenceGenerator(name="alb_generator", sequenceName = "alb_seq", allocationSize=1)
    private Long id;

    private String titulo;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "IMAGEN_ALBUM", joinColumns = { @JoinColumn(name = "ID_Album") }, inverseJoinColumns = { @JoinColumn(name = "Listaimagen_Id_Imagen") })
    private List<Imagen> imagenList;
}
