import ORM.ComentarioORM;
import ORM.PostORM;
import ORM.UsuarioORM;
import clases.Comentario;
import clases.Post;
import clases.Usuario;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.jasypt.util.text.BasicTextEncryptor;
import spark.Session;

import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.*;

public class Main {

    public static void main(String[] args) {

        staticFiles.location("/templates");
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_28);
        configuration.setClassForTemplateLoading(Main.class, "/");

        ORM.UsuarioORM usuarioORM = new UsuarioORM();
        ORM.PostORM postORM = new PostORM();
        ORM.ComentarioORM comentarioORM = new ComentarioORM();

        if(usuarioORM.countUsuarios() == 0){
            Usuario admin = new Usuario();
            admin.setUsername("admin");
            admin.setPassword("admin");
            admin.setAdmin(true);
            admin.setMuro(new ArrayList<>());
            admin.setNombre("admin");
            admin.setApellidos("admin");
            usuarioORM.guardarUsuario(admin);
            System.out.println("Admin creado con exito.");
        }

        before("/home", (request, response) -> {
            Usuario usuario = request.session(true).attribute("usuario");
            if (usuario == null) {
                response.redirect("/");
            }
        });

        get("/", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            if(usuario == null && req.cookie("username") != null){
                BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
                textEncryptor.setPasswordCharArray("mangekyouSharingan42".toCharArray());
                req.session(true);
                req.session().attribute("usuario", usuarioORM.getUsuarioUsername(textEncryptor.decrypt(req.cookie("username"))));
            }
            res.redirect("/inicio");

            return "";
        });


        get("/inicio", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            if(usuario!=null){
                res.redirect("/home");
            }
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/home.ftl");

            if(req.queryParams("invalid")!=null)
                atr.put("invalid",Integer.parseInt(req.queryParams("invalid")));

            atr.put("usuario",usuario);
            template.process(atr,writer);
            return writer;
        });

        get("/home", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/muro.ftl");

            atr.put("usuario",usuario);
            template.process(atr,writer);
            return writer;
        });
        post("/login", (req, res) -> {
            String username = req.queryParams("username");
            String password = req.queryParams("password");


            Usuario  usuario = usuarioORM.getUsuario(username, password);


            String isRecordado = req.queryParams("keepLog");
            if (usuario != null) {
                req.session(true);
                req.session().attribute("usuario", usuario);
                if(isRecordado!=null){
                    BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
                    textEncryptor.setPasswordCharArray("mangekyouSharingan42".toCharArray());
                    res.cookie("/", "username",
                            textEncryptor.encrypt(username), (60*60*24*7), false, true);
                }
                res.redirect("/");
            } else {
                res.redirect("/login");
            }
            return "";

        });

        get("/logout", (req, res) -> {
            StringWriter writer = new StringWriter();

            Session ses = req.session(true);
            ses.invalidate();
            res.removeCookie("username");
            res.redirect("/");
            return writer;
        });


        post("/registrar", (req, res) -> {
            String username = req.queryParams("username");
            String password = req.queryParams("password");
            String nombre = req.queryParams("nombre");
            String apellidos = req.queryParams("apellidos");
            String email = req.queryParams("email");
            String fechaNacimiento = req.queryParams("fechaNacimiento");

            if(usuarioORM.getUsuarioUsername(username)!=null){
                System.out.println(usuarioORM.getUsuarioUsername(username).getUsername());
                res.redirect("/inicio?invalid=1");
            }else if(usuarioORM.getUsuarioEmailVali(email) != null){
                res.redirect("/inicio?invalid=2");
            }else{
                Usuario usuario = new Usuario();
                usuario.setNombre(nombre);
                usuario.setUsername(username);
                usuario.setPassword(password);
                usuario.setNacimientoFecha(fechaNacimiento);
                usuario.setEmail(email);
                usuario.setApellidos(apellidos);
                usuario.setMuro(new ArrayList<>());

                usuarioORM.guardarUsuario(usuario);
                req.session(true);
                req.session().attribute("usuario", usuario);
                res.redirect("/home");
                return "";
            }


            return "";
        });

        post("/crearPost", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            String texto = req.queryParams("texto");
            Post post = new Post();
            post.setTexto(texto);
            post.setUsuario(usuario);
            postORM.guardarPost(post);
            usuarioORM.addPost(usuario,post);
            res.redirect("/home");
            return "";

        });

        post("/:id/comentar", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            Long idPost = Long.parseLong(req.params("id"));
            String comentario = req.queryParams("comentario");

            Comentario c = new Comentario();
            c.setAutor(usuario);
            c.setComentario(comentario);
            comentarioORM.guardarComentario(c);
            postORM.addComentario(postORM.getPost(idPost),c);
            res.redirect("/home");
            return null;
        });

        post("/updateInfo", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            String lugarNacimiento = req.queryParams("lugarNacimiento");
            String lugarResidencia = req.queryParams("lugarResidencia");
            String lugarTrabajo = req.queryParams("lugarTrabajo");
            String lugarEstudio = req.queryParams("lugarEstudio");

            usuario.setLugarEstudio(lugarEstudio);
            usuario.setLugarNacimiento(lugarNacimiento);
            usuario.setLugarResidencia(lugarResidencia);
            usuario.setLugarTrabajo(lugarTrabajo);
            usuarioORM.editarUsuario(usuario);
            res.redirect("/home");
            return null;
        });
    }
}