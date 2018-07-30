package clases;

import javax.persistence.*;
import java.sql.Timestamp;

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

    @ManyToOne(fetch = FetchType.LAZY)
    private Post post;


    private Timestamp tiempo;

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

    public Timestamp getTiempo() {
        return tiempo;
    }

    public void setTiempo(Timestamp tiempo) {
        this.tiempo = tiempo;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
}
