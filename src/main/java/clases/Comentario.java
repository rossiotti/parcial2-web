package clases;

import javax.persistence.*;

@Entity
public class Comentario {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "com_generator")
    @SequenceGenerator(name="com_generator", sequenceName = "com_seq", allocationSize=1)
    private Long id;

    private String comentario;

    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario autor;

    @ManyToOne(fetch = FetchType.EAGER)
    private Post post;

    @ManyToOne(fetch = FetchType.EAGER)
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

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Imagen getImagen() {
        return imagen;
    }

    public void setImagen(Imagen imagen) {
        this.imagen = imagen;
    }
}
