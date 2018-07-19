package clases;

import javax.persistence.*;
import java.util.List;

@Entity
public class Muro {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "mur_generator")
    @SequenceGenerator(name="mur_generator", sequenceName = "mur_seq", allocationSize=1)
    private Long id;

    @OneToOne
    private Usuario usuario;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Muro_Post", joinColumns = { @JoinColumn(name = "Id_muro") }, inverseJoinColumns = { @JoinColumn(name = "LISTApost_ID_post") })
    private List<Post> listPost;

}
