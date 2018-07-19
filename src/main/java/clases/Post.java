package clases;

import javax.persistence.*;
import java.util.List;

@Entity
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pos_generator")
    @SequenceGenerator(name="pos_generator", sequenceName = "pos_seq", allocationSize=1)
    private Long id;

    @OneToOne
    private Usuario usuario;

    private String texto;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Usuario_Post", joinColumns = { @JoinColumn(name = "Id_post") }, inverseJoinColumns = { @JoinColumn(name = "LISTAusuario_ID_usuario") })
    private List<Usuario> tagUsuarios;

}
