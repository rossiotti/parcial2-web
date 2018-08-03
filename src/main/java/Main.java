import ORM.*;
import clases.*;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.jasypt.util.text.BasicTextEncryptor;
import spark.Session;
import spark.utils.IOUtils;

import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import java.io.*;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

import static spark.Spark.*;

public class Main {

    public static void main(String[] args) throws SQLException {

        //org.h2.tools.Server.createTcpServer().start();
        staticFiles.externalLocation("src/main/resources/templates");
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_28);
        configuration.setClassForTemplateLoading(Main.class, "/");
        class Coordenadas{
            private String latitud;
            private String longitud;

            public String getLatitud() {
                return latitud;
            }

            public void setLatitud(String latitud) {
                this.latitud = latitud;
            }

            public String getLongitud() {
                return longitud;
            }

            public void setLongitud(String longitud) {
                this.longitud = longitud;
            }
        }

        ArrayList<Coordenadas> coordenadas = new ArrayList<>();
        UsuarioORM usuarioORM = new UsuarioORM();
        PostORM postORM = new PostORM();
        ComentarioORM comentarioORM = new ComentarioORM();
        ReaccionORM reaccionORM = new ReaccionORM();
        AlbumORM albumORM = new AlbumORM();


        if(usuarioORM.countUsuarios() == 0){
            Usuario admin = new Usuario();
            admin.setUsername("admin");
            admin.setPassword("admin");
            admin.setAdmin(true);
            admin.setMuro(new ArrayList<>());
            admin.setNombre("Admin");
            admin.setApellidos("Istrador");
            admin.setEmail("hokage@admin.com");
            admin.setNacimientoFecha("10/10/1996");
            admin.setAmigos(new ArrayList<>());
            admin.setAlbumes(new ArrayList<>());
            admin.setLugarTrabajo("Como admin en SocialBuddy");
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
                for(int i = 0; i < usuario.getAmigos().size(); i++){
                    smartCombine(usuario.getMuro(),usuario.getAmigos().get(i).getMuro());
                    smartCombineAlbum(usuario.getAlbumes(),usuario.getAmigos().get(i).getAlbumes());
                }


            }
         //   List<Post> muro = postORM.getMuro(usuario);
            List<Post> muro = usuario.getMuro();
            Collections.sort(muro, (o1, o2) -> o2.getTiempo().compareTo(o1.getTiempo()));
            List<Album> albumes = usuario.getAlbumes();
            Collections.sort(albumes,(o1, o2) -> o2.getTiempo().compareTo(o1.getTiempo()));

            if(req.queryParams("view") != null){
                atr.put("singleImage",postORM.getPost(Long.parseLong(req.queryParams("single"))));
                atr.put("view",1);
            }

            List<Comentario> comentarios = comentarioORM.getComments();
            List<Reaccion> reaccions = reaccionORM.getReacciones();
            List<Post> albumPosts = albumORM.getAlbumsPosts();
            atr.put("usuario",usuario);
            atr.put("muro",muro);
            atr.put("albumPosts",albumPosts);
            atr.put("albumes",albumes);
            atr.put("comentarios",comentarios);
            atr.put("reacciones",reaccions);
            template.process(atr,writer);
            return writer;
        });

        get("/posts/:user", (req, res) -> {

            String usuarioP = req.params("user");


            List<Post> muro = postORM.getMuro(usuarioORM.getUsuarioUsername(usuarioP));
            List<JsonObject> jsonObjectList = new ArrayList<>();
            if(muro != null){
                for(int i = 0; i < muro.size(); i++){
                    if(!muro.get(i).getTexto().equalsIgnoreCase("n/a")){
                        JsonObject value = Json.createObjectBuilder()
                                .add("id",muro.get(i).getId())
                                .add("texto",muro.get(i).getTexto())
                                .add("tiempo",muro.get(i).getTiempo().toString())
                                .build();

                        jsonObjectList.add(value);
                    }

                }
                return jsonObjectList;
            }else{
                return 0;
            }

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
                return "Logeado";
            }else {
                res.redirect("/inicio?invalid=3");
                return "Error, revisar datos";
            }

        });

        post("/autenticar", (req, res) -> {
            String username = req.queryParams("username");
            String password = req.queryParams("password");


            Usuario  usuario = usuarioORM.getUsuario(username, password);

            if (usuario != null) {
                return "Logeado";
            }else {
                return "Error, revisar datos";
            }

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
                usuario.setAlbumes(new ArrayList<>());
                usuario.setAdmin(false);

                usuarioORM.guardarUsuario(usuario);
                req.session(true);
                req.session().attribute("usuario", usuario);
                res.redirect("/home");
                return "";
            }


            return "";
        });

        post("crear/:user",(req, res) ->{

            req.attribute("org.eclipse.jetty.multipartConfig", new MultipartConfigElement("src/main/resources/templates/subidas/"));
            Part filePart = req.raw().getPart("imagen");

            try (InputStream inputStream = filePart.getInputStream()) {

                OutputStream outputStream = new FileOutputStream("src/main/resources/templates/subidas/" + filePart.getSubmittedFileName());
                IOUtils.copy(inputStream, outputStream);
                outputStream.close();
            } catch (FileNotFoundException e) {
                String texto = req.queryParams("texto");
                String usuario = req.params("user");
                Usuario u = usuarioORM.getUsuarioUsername(usuario);
                Post post = new Post();
                post.setTexto(texto);
                post.setUsuario(u);
                post.setImagenPath("");
                post.setTiempo(getFechaActual());
                postORM.guardarPost(post);

            }
            String texto = req.queryParams("texto");
            String usuario = req.params("user");
            Usuario u = usuarioORM.getUsuarioUsername(usuario);
            Post post = new Post();
            post.setTexto(texto);
            post.setUsuario(u);
            post.setImagenPath(filePart.getSubmittedFileName());
            post.setTiempo(getFechaActual());
            postORM.guardarPost(post);
            usuarioORM.addPost(u,post);

            return "Post creado con exito";

            });

        post("/crearPost/:user", (req, res) -> {


            req.attribute("org.eclipse.jetty.multipartConfig", new MultipartConfigElement("src/main/resources/templates/subidas/"));
            Part filePart = req.raw().getPart("imagen");

            try (InputStream inputStream = filePart.getInputStream()) {

                OutputStream outputStream = new FileOutputStream("src/main/resources/templates/subidas/" + filePart.getSubmittedFileName());
                IOUtils.copy(inputStream, outputStream);
                outputStream.close();
            } catch (FileNotFoundException e) {
                Usuario usuario = req.session(true).attribute("usuario");
                String texto = req.queryParams("texto");
                String usuarioP = req.params("user");
                Post post = new Post();
                post.setTexto(texto);
                post.setUsuario(usuario);
                post.setImagenPath("");
                post.setTiempo(getFechaActual());
                postORM.guardarPost(post);


                if(usuarioP.equalsIgnoreCase("muro")){
                    usuarioORM.addPost(usuario,post);
                    res.redirect("/home");

                }else{
                    usuarioORM.addPost(usuarioORM.getUsuarioUsername(usuarioP),post);
                    res.redirect("/perfil?user="+usuarioP);
                }

                return "";

            }

            Usuario usuario = req.session(true).attribute("usuario");
            String texto = req.queryParams("texto");
            String usuarioP = req.params("user");
            Post post = new Post();
            post.setTexto(texto);
            post.setUsuario(usuario);
            post.setImagenPath(filePart.getSubmittedFileName());
            post.setTiempo(getFechaActual());
            postORM.guardarPost(post);

            if(usuarioP.equalsIgnoreCase("muro")){
                usuarioORM.addPost(usuario,post);
                res.redirect("/home");

            }else{
                usuarioORM.addPost(usuarioORM.getUsuarioUsername(usuarioP),post);
                res.redirect("/perfil?user="+usuarioP);
            }

            return"";

        });


        post("/crearAlbum/:user", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            req.attribute("org.eclipse.jetty.multipartConfig", new MultipartConfigElement("src/main/resources/templates/subidas/"));
            Collection<Part> parts = null;

            String descripcion = req.queryParams("descripcion");
            Album album = new Album();
            album.setCreador(usuario);
            album.setTiempo(getFechaActual());
            album.setDescripcion(descripcion);
            albumORM.guardarAlbum(album);
            try {
                parts = req.raw().getParts();
            } catch (IOException | ServletException e2) {
                // TODO Auto-generated catch block
                e2.printStackTrace();
            }
            for (Part part : parts) {
                if(part.getName().equals("imagen")){
                    try (InputStream inputStream = part.getInputStream()) {
                        OutputStream outputStream = new FileOutputStream("src/main/resources/templates/subidas/" + part.getSubmittedFileName());
                        IOUtils.copy(inputStream, outputStream);
                        outputStream.close();

                        Post post = new Post();
                        post.setTexto("n/a");
                        post.setUsuario(usuario);
                        System.out.println(part.getSubmittedFileName());
                        post.setImagenPath(part.getSubmittedFileName());
                        post.setTiempo(getFechaActual());
                        post.setAlbum(album);
                        postORM.guardarPost(post);

                    }
                }


            }
            String usuarioP = req.params("user");
            if(usuarioP.equalsIgnoreCase("muro")){
                usuarioORM.addAlbum(usuario,album);
                res.redirect("/home");

            }else{
                usuarioORM.addAlbum(usuarioORM.getUsuarioUsername(usuarioP),album);
                res.redirect("/perfil?user="+usuarioP);
            }
            return"";

        });

        post("/post/:id/like", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            Long idPost = Long.parseLong(req.params("id"));
            Reaccion reaccion = new Reaccion();
            reaccion.setUsuario(usuario);
            reaccion.setReaccion(true);
            reaccion.setTiempo(getFechaActual());
            Post post = postORM.getPost(idPost);
            reaccion.setPost(post);
            Reaccion re = reaccionORM.checkLikePost(usuario,post);

            if(re == null){
                reaccionORM.guardarLike(reaccion);
                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    if(req.queryParams("index") != null){
                        res.redirect("/home#post"+req.queryParams("index"));
                    }

                }

            }else{
                reaccionORM.deleteLike(re);

                if(!re.isReaccion())
                    reaccionORM.updateLike(re,true);

                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    if(req.queryParams("index") != null){
                        res.redirect("/home#post"+req.queryParams("index"));
                    }
                }
            }

            return "";
            });

        post("/comentario/:id/like", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            Long idComentario = Long.parseLong(req.params("id"));
            Reaccion reaccion = new Reaccion();
            reaccion.setUsuario(usuario);
            reaccion.setReaccion(true);
            reaccion.setTiempo(getFechaActual());
            Comentario comentario = comentarioORM.getComentario(idComentario);
            reaccion.setComentario(comentario);
            Reaccion re = reaccionORM.checkLikeComentario(usuario,comentario);

            if(re == null){
                reaccionORM.guardarLike(reaccion);
                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    res.redirect("/home");
                }
            }else{
                reaccionORM.deleteLike(re);

                if(!re.isReaccion())
                    reaccionORM.updateLike(re,true);

                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    if(req.queryParams("index") != null){
                        res.redirect("/home#post"+req.queryParams("index"));
                    }
                }
            }

            return "";
        });

        post("/comentario/:id/dislike", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            Long idComentario = Long.parseLong(req.params("id"));
            Reaccion reaccion = new Reaccion();
            reaccion.setUsuario(usuario);
            reaccion.setReaccion(false);
            reaccion.setTiempo(getFechaActual());
            Comentario comentario = comentarioORM.getComentario(idComentario);
            reaccion.setComentario(comentario);
            Reaccion re = reaccionORM.checkLikeComentario(usuario,comentario);
            if(re == null){
                reaccionORM.guardarLike(reaccion);
                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    if(req.queryParams("index") != null){
                        res.redirect("/home#post"+req.queryParams("index"));
                    }
                }
            }else{
                reaccionORM.deleteLike(re);

                if(re.isReaccion())
                    reaccionORM.updateLike(re,false);

                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    if(req.queryParams("index") != null){
                        res.redirect("/home#post"+req.queryParams("index"));
                    }
                }
            }

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
            reaccion.setPost(post);
            Reaccion re = reaccionORM.checkLikePost(usuario,post);
            if(re == null){
                reaccionORM.guardarLike(reaccion);
                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    if(req.queryParams("index") != null){
                        res.redirect("/home#post"+req.queryParams("index"));
                    }
                }
            }else{
                reaccionORM.deleteLike(re);

                if(re.isReaccion())
                    reaccionORM.updateLike(re,false);

                if(req.queryParams("view") != null){
                    res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
                }else{
                    if(req.queryParams("index") != null){
                        res.redirect("/home#post"+req.queryParams("index"));
                    }
                }
            }

            return "";
        });

        get("/buscarPersonas", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/friendListRes.ftl");
            int pagina = Integer.parseInt(req.queryParams("pagina"));
            List<Usuario> listado = usuarioORM.listarUsuarios(pagina,req.queryParams("q"));
            ArrayList<Usuario> filtrados =  new ArrayList<>();

            for(int i = 0; i< listado.size(); i++){
                if(listado.get(i).getId()!=usuario.getId())
                    filtrados.add(listado.get(i));
            }

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

        get("/sugerirAmigos", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/friendListRes.ftl");
            int pagina = Integer.parseInt(req.queryParams("pagina"));
            List<Usuario> filtrados = usuarioORM.sugerirAmigos(usuario);
            List<Usuario> sinUser = new ArrayList<>();
            for(Usuario u: filtrados){
                if(u.getId() != usuario.getId()){
                    sinUser.add(u);
                }
            }


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
            atr.put("resultados",sinUser);
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

            Collections.sort(uMuro, (o1, o2) -> o2.getTiempo().compareTo(o1.getTiempo()));

            List<Comentario> comentarios = comentarioORM.getComments();
            List<Reaccion> reaccions = reaccionORM.getReacciones();
            atr.put("comentarios",comentarios);
            atr.put("reacciones",reaccions);
            atr.put("usuarioP",uNuevo);
            atr.put("muroP",uMuro);
            atr.put("usuario",usuario);
            template.process(atr,writer);
            return writer;
        });

        get("/geo", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/geo.ftl");
            atr.put("location",coordenadas);
            template.process(atr,writer);
            return writer;
        });

        post("/geoPost", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/geo.ftl");
            String lat = req.queryParams("latitud");
            String lon = req.queryParams("longitud");
            Coordenadas coor = new Coordenadas();
            coor.setLongitud(lon);
            coor.setLatitud(lat);
            coordenadas.add(coor);
            res.redirect("/geo");
            return writer;
        });

        get("/timeline", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/timeline.ftl");


            if(usuario.getAmigos() != null){
                for(int i = 0; i < usuario.getAmigos().size(); i++){
                    smartCombine(usuario.getMuro(),usuario.getAmigos().get(i).getMuro());
                    smartCombineAlbum(usuario.getAlbumes(),usuario.getAmigos().get(i).getAlbumes());
                }
            }
            List<Post> muro = usuario.getMuro();
            Collections.sort(muro,(o1, o2) -> o2.getTiempo().compareTo(o1.getTiempo()));
            List<Album> albumes = usuario.getAlbumes();
            Collections.sort(albumes,(o1, o2) -> o2.getTiempo().compareTo(o1.getTiempo()));
            List<Post> albumPosts = albumORM.getAlbumsPosts();
            List<Comentario> comentarios = comentarioORM.getComments();
            List<Reaccion> reaccions = reaccionORM.getReacciones();
            atr.put("usuario",usuario);
            atr.put("muro",muro);
            atr.put("albumPosts",albumPosts);
            atr.put("albumes",albumes);
            atr.put("comentarios",comentarios);
            atr.put("reacciones",reaccions);
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
            c.setPost(postORM.getPost(idPost));
            comentarioORM.guardarComentario(c);
            if(req.queryParams("view") != null){
                res.redirect("/home?single="+req.queryParams("single")+"&view="+req.queryParams("view"));
            }else{
                if(req.queryParams("index") != null){
                    res.redirect("/home#post"+req.queryParams("index"));
                }
            }
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

        get("/gestionUsuario", (req, res) -> {
            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/friendList.ftl");
            int pagina = Integer.parseInt(req.queryParams("pagina"));
            int maxPagina = (int) Math.ceil(usuarioORM.countUsuarios() / 5);
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
            atr.put("listaUsuarios",usuarioORM.listarUsuariosTotales(pagina));
            atr.put("gestion",1);
            template.process(atr,writer);
            return writer;
        });
    }

    public static void smartCombine(List<Post> first, List<Post> second) {
        for(Post num : second) {
            if(!first.contains(num)) {
                first.add(num);
            }
        }
    }

    public static void smartCombineAlbum(List<Album> first, List<Album> second) {
        for(Album num : second) {
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