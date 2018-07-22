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

    @OneToMany(fetch = FetchType.EAGER)
    private List<Comentario> comentario;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "Usuario_Post", joinColumns = { @JoinColumn(name = "Id_post") }, inverseJoinColumns = { @JoinColumn(name = "LISTAusuario_ID_usuario") })
    private List<Usuario> tagUsuarios;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public List<Usuario> getTagUsuarios() {
        return tagUsuarios;
    }

    public void setTagUsuarios(List<Usuario> tagUsuarios) {
        this.tagUsuarios = tagUsuarios;
    }

    public List<Comentario> getComentario() {
        return comentario;
    }

    public void setComentario(List<Comentario> comentario) {
        this.comentario = comentario;
    }
}
