package clases;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
public class Album {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "alb_generator")
    @SequenceGenerator(name="alb_generator", sequenceName = "alb_seq", allocationSize=1)
    private Long id;

    private String titulo;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "IMAGEN_ALBUM", joinColumns = { @JoinColumn(name = "ID_Album") }, inverseJoinColumns = { @JoinColumn(name = "Listaimagen_Id_Imagen") })
    private List<Imagen> imagenList;

    @OneToOne
    private Usuario creador;

    private Timestamp tiempo;


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

    public List<Imagen> getImagenList() {
        return imagenList;
    }

    public void setImagenList(List<Imagen> imagenList) {
        this.imagenList = imagenList;
    }

    public Usuario getCreador() {
        return creador;
    }

    public void setCreador(Usuario creador) {
        this.creador = creador;
    }

    public Timestamp getTiempo() {
        return tiempo;
    }

    public void setTiempo(Timestamp tiempo) {
        this.tiempo = tiempo;
    }
}
