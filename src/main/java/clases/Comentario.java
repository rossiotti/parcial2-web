package clases;

import javax.persistence.*;

@Entity
public class Comentario {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "com_generator")
    @SequenceGenerator(name="com_generator", sequenceName = "com_seq", allocationSize=1)
    private Long id;

    private String comentario;

    @ManyToOne(fetch = FetchType.LAZY)
    private Usuario autor;

    @ManyToOne(fetch = FetchType.LAZY)
    private Imagen imagen;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Usuario getAutor() {
        return autor;
    }

    public void setAutor(Usuario autor) {
        this.autor = autor;
    }

    public Imagen getImagen() {
        return imagen;
    }

    public void setImagen(Imagen imagen) {
        this.imagen = imagen;
    }
}
