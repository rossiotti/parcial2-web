package clases;

import javax.persistence.*;

@Entity
public class Reaccion {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "rea_generator")
    @SequenceGenerator(name="rea_generator", sequenceName = "rea_seq", allocationSize=1)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ID_Usuario")
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "ID_Post")
    private Post post;

    @ManyToOne
    @JoinColumn(name = "ID_Imagen")
    private Imagen imagen;

    @ManyToOne
    @JoinColumn(name = "ID_Album")
    private Album album;

    @ManyToOne
    @JoinColumn(name = "ID_Comentario")
    private Comentario comentario;

    private boolean reaccion;
}
