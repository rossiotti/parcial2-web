import ORM.ComentarioORM;
import ORM.PostORM;
import ORM.ReaccionORM;
import ORM.UsuarioORM;
import clases.Comentario;
import clases.Post;
import clases.Reaccion;
import clases.Usuario;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.jasypt.util.text.BasicTextEncryptor;
import spark.Session;

import java.io.StringWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

import static spark.Spark.*;

public class Main {

    public static void main(String[] args) throws SQLException {

        //org.h2.tools.Server.createTcpServer().start();
        staticFiles.location("/templates");
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_28);
        configuration.setClassForTemplateLoading(Main.class, "/");

        ORM.UsuarioORM usuarioORM = new UsuarioORM();
        ORM.PostORM postORM = new PostORM();
        ORM.ComentarioORM comentarioORM = new ComentarioORM();
        ORM.ReaccionORM reaccionORM = new ReaccionORM();

        if(usuarioORM.countUsuarios() == 0){
            Usuario admin = new Usuario();
            admin.setUsername("admin");
            admin.setPassword("admin");
            admin.setAdmin(true);
            admin.setMuro(new ArrayList<>());
            admin.setNombre("admin");
            admin.setApellidos("admin");
            admin.setEmail("hokage@admin.com");
            admin.setNacimientoFecha("10/10/1996");
            admin.setAmigos(new ArrayList<>());
            admin.setLugarTrabajo("Como admin en Bingobook");
            admin.setLugarResidencia("Konoha");
            admin.setLugarEstudio("La academina ninja");
            admin.setLugarNacimiento("Konoha");
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


            if(usuario.getAmigos() != null){
                for(int i = 0; i < usuario.getAmigos().size(); i++)
                smartCombine(usuario.getMuro(),usuario.getAmigos().get(i).getMuro());

            }
            List<Post> muro = usuario.getMuro();
            Collections.reverse(usuario.getMuro());

            atr.put("usuario",usuario);
            atr.put("muro",muro);
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
            }else {
                res.redirect("/inicio?invalid=3");
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
                usuario.setAmigos(new ArrayList<>());
                usuario.setAdmin(false);

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
            post.setReaccions(new ArrayList<>());
            post.setTiempo(getFechaActual());
            post.setReaccions(new ArrayList<>());
            postORM.guardarPost(post);
            usuarioORM.addPost(usuario,post);
            System.out.println(usuario.getMuro());
            res.redirect("/home");
            return "";

        });

        post("/post/:id/like", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            Long idPost = Long.parseLong(req.params("id"));

            Reaccion reaccion = new Reaccion();
            reaccion.setUsuario(usuario);
            reaccion.setReaccion(true);
            reaccion.setTiempo(getFechaActual());
            Post post = postORM.getPost(idPost);
            for(int i = 0; i<usuario.getMuro().size(); i++){
                if(idPost == usuario.getMuro().get(i).getId()){
                    if( usuario.getMuro().get(i).getReaccions().size() == 0){
                        usuario.getMuro().get(i).getReaccions().add(reaccion);
                        reaccionORM.guardarLike(reaccion);
                        postORM.addLike(post,reaccion);
                    }else{
                        for(int j = 0; j < post.getReaccions().size(); j ++){
                            if(post.getReaccions().get(j).getUsuario().getId() != usuario.getId()){
                                usuario.getMuro().get(i).getReaccions().add(reaccion);
                                reaccionORM.guardarLike(reaccion);
                                postORM.addLike(post,reaccion);
                            }else{
                                postORM.updateLike(post,post.getReaccions().get(j));
                                usuario.getMuro().get(i).getReaccions().remove(j);
                            }
                        }
                    }
                }
            }
            res.redirect("/home");
            return "";
            });

        post("/post/:id/dislike", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            Long idPost = Long.parseLong(req.params("id"));

            Reaccion reaccion = new Reaccion();
            reaccion.setUsuario(usuario);
            reaccion.setReaccion(false);
            reaccion.setTiempo(getFechaActual());
            Post post = postORM.getPost(idPost);
            for(int i = 0; i<usuario.getMuro().size(); i++){
                if(idPost == usuario.getMuro().get(i).getId()){
                    if( usuario.getMuro().get(i).getReaccions().size() == 0){
                        usuario.getMuro().get(i).getReaccions().add(reaccion);
                        reaccionORM.guardarLike(reaccion);
                        postORM.addLike(post,reaccion);
                    }else{
                        for(int j = 0; j < post.getReaccions().size(); j ++){
                            if(post.getReaccions().get(j).getUsuario().getId() != usuario.getId()){
                                usuario.getMuro().get(i).getReaccions().add(reaccion);
                                reaccionORM.guardarLike(reaccion);
                                postORM.addLike(post,reaccion);
                            }else{
                                postORM.updateLike(post,post.getReaccions().get(j));
                                usuario.getMuro().get(i).getReaccions().remove(j);

                            }
                        }
                    }
                }
            }
            res.redirect("/home");
            return "";
        });

        get("/buscarPersonas", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/friendListRes.ftl");
            int pagina = Integer.parseInt(req.queryParams("pagina"));
            System.out.println((req).   queryParams("q"));
            List<Usuario> filtrados = usuarioORM.listarUsuarios(pagina,req.queryParams("q"));
            int maxPagina = (int) Math.ceil(filtrados.size() / 5);
            atr.put("pagina", pagina);

            if(pagina >= maxPagina){
                atr.put("valorSiguiente", 0);
            }else{
                atr.put("valorSiguiente", 1);
            }

            if(pagina <= 1){
                atr.put("valorAnterior", 0);
                System.out.println(pagina);
            }else{
                atr.put("valorAnterior", 1);
            }

            atr.put("anterior", (pagina - 1));
            atr.put("siguiente", (pagina + 1));
            atr.put("resultados",filtrados);
            atr.put("usuario",usuario);
            atr.put("listaAmigos",usuario.getAmigos());
            template.process(atr,writer);
            return writer;
        });



        get("/perfil", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/perfil.ftl");
            String username = req.queryParams("user");
            Usuario uNuevo = usuarioORM.getUsuarioUsername(username);
            List<Post> uMuro = uNuevo.getMuro();
            Collections.reverse(uMuro);
            atr.put("usuarioP",uNuevo);
            atr.put("muroP",uMuro);
            atr.put("usuario",usuario);
            template.process(atr,writer);
            return writer;
        });

        get("/timeline", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/timeline.ftl");
            template.process(atr,writer);
            return writer;
        });


        get("/listaAmigos", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/friendList.ftl");
            int pagina = Integer.parseInt(req.queryParams("pagina"));
            int maxPagina = (int) Math.ceil(usuario.getAmigos().size() / 5);
            atr.put("pagina", pagina);

            if(pagina >= maxPagina){
                atr.put("valorSiguiente", 0);
            }else{
                atr.put("valorSiguiente", 1);
            }

            if(pagina <= 1){
                atr.put("valorAnterior", 0);
                System.out.println(pagina);
            }else{
                atr.put("valorAnterior", 1);
            }

            atr.put("anterior", (pagina - 1));
            atr.put("siguiente", (pagina + 1));
            atr.put("usuario",usuario);
            atr.put("listaAmigos",usuario.getAmigos());
            template.process(atr,writer);
            return writer;
        });

        post("/:id/comentar", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            Long idPost = Long.parseLong(req.params("id"));
            String comentario = req.queryParams("comentario");

            Comentario c = new Comentario();
            c.setAutor(usuario);
            c.setComentario(comentario);
            c.setTiempo(getFechaActual());
            for(int i = 0; i<usuario.getMuro().size(); i++){
                if(idPost == usuario.getMuro().get(i).getId())
                    usuario.getMuro().get(i).getComentario().add(c);
            }

            comentarioORM.guardarComentario(c);
            postORM.addComentario(postORM.getPost(idPost),c);
            System.out.println(postORM.getPost(idPost).getComentario());
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

        post("/agregarAmigo", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            String texto = req.queryParams("id");
            Usuario amigo = usuarioORM.getUsuarioId(Long.parseLong(texto));
            if(usuario.getAmigos().size()==0)
                usuarioORM.agregarAmigo(usuario,amigo);
            for(int i = 0; i<usuario.getAmigos().size(); i++){
                if(!usuario.getAmigos().get(i).getId().equals(amigo.getId())){
                        usuarioORM.agregarAmigo(usuario,amigo);

                }
            }

            res.redirect("/home");
            return "";

        });
    }

    public static void smartCombine(List<Post> first, List<Post> second) {
        for(Post num : second) {
            if(!first.contains(num)) {
                first.add(num);
            }
        }
    }

    public static Timestamp getFechaActual(){
        Date date= new Date();

        long time = date.getTime();
         return new Timestamp(time);
    }
}