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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Usuario getPosteador() {
        return posteador;
    }

    public void setPosteador(Usuario posteador) {
        this.posteador = posteador;
    }

    public List<Usuario> getImagenTags() {
        return imagenTags;
    }

    public void setImagenTags(List<Usuario> imagenTags) {
        this.imagenTags = imagenTags;
    }
}
