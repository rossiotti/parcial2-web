package clases;

import javax.persistence.*;
import java.util.List;

@Entity
public class Imagen {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "img_generator")
    @SequenceGenerator(name="img_generator", sequenceName = "img_seq", allocationSize=1)
    private Long id;

    private String titulo;
    private String descripcion;

    @OneToOne
    private Usuario posteador;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Usuario_Imagen", joinColumns = { @JoinColumn(name = "Id_Imagen") }, inverseJoinColumns = { @JoinColumn(name = "LISTAusuario_ID_usuario") })
    private List<Usuario> imagenTags;

}
