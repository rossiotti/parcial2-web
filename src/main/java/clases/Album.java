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

    @OneToOne
    private Usuario creador;

    private Timestamp tiempo;

    private String descripcion;


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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
