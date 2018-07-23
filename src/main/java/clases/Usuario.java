package clases;

import javax.persistence.*;
import java.util.List;

@Entity
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "usu_generator")
    @SequenceGenerator(name="usu_generator", sequenceName = "usu_seq", allocationSize=1)
    private Long id;

    private String username;
    private String nombre;
    private String apellidos;
    private String email;
    private String password;
    private String nacimientoFecha;
    private String lugarNacimiento;
    private String lugarResidencia;
    private String lugarEstudio;
    private String lugarTrabajo;
    private boolean visible;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "Muro_Post", joinColumns = { @JoinColumn(name = "Id_usuarioMuro") }, inverseJoinColumns = { @JoinColumn(name = "Muro_ID_post") })
    private List<Post> muro;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "Usuario_Amigos", joinColumns = { @JoinColumn(name = "Id_usuario") }, inverseJoinColumns = { @JoinColumn(name = "LISTAusuarioAmigo_ID_usuarioAmigo") })
    private List<Usuario> amigos;
    private boolean admin;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNacimientoFecha() {
        return nacimientoFecha;
    }

    public void setNacimientoFecha(String nacimientoFecha) {
        this.nacimientoFecha = nacimientoFecha;
    }

    public String getLugarNacimiento() {
        return lugarNacimiento;
    }

    public void setLugarNacimiento(String lugarNacimiento) {
        this.lugarNacimiento = lugarNacimiento;
    }

    public String getLugarResidencia() {
        return lugarResidencia;
    }

    public void setLugarResidencia(String lugarResidencia) {
        this.lugarResidencia = lugarResidencia;
    }

    public String getLugarEstudio() {
        return lugarEstudio;
    }

    public void setLugarEstudio(String lugarEstudio) {
        this.lugarEstudio = lugarEstudio;
    }

    public String getLugarTrabajo() {
        return lugarTrabajo;
    }

    public void setLugarTrabajo(String lugarTrabajo) {
        this.lugarTrabajo = lugarTrabajo;
    }

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public List<Usuario> getAmigos() {
        return amigos;
    }

    public void setAmigos(List<Usuario> amigos) {
        this.amigos = amigos;
    }

    public List<Post> getMuro() {
        return muro;
    }

    public void setMuro(List<Post> muro) {
        this.muro = muro;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }
}
