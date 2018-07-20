import ORM.UsuarioORM;
import clases.Usuario;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.jasypt.util.text.BasicTextEncryptor;

import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.get;
import static spark.Spark.post;
import static spark.Spark.staticFiles;

public class Main {

    public static void main(String[] args) {

        staticFiles.location("/templates");
        Configuration configuration = new Configuration(Configuration.VERSION_2_3_28);
        configuration.setClassForTemplateLoading(Main.class, "/");

        ORM.UsuarioORM usuarioORM = new UsuarioORM();

        if(usuarioORM.countUsuarios() == 0){
            Usuario admin = new Usuario();
            admin.setUsername("admin");
            admin.setPassword("admin");
            admin.setAdmin(true);
            usuarioORM.guardarUsuario(admin);
            System.out.println("Admin creado con exito.");
        }

        get("/", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            if(usuario == null && req.cookie("username") != null){
                BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
                textEncryptor.setPasswordCharArray("mangekyouSharingan42".toCharArray());
                req.session(true);
                req.session().attribute("usuario", usuarioORM.getUsuarioUsername(textEncryptor.decrypt(req.cookie("username"))));
                //res.redirect("/");
            }

            res.redirect("/inicio?pagina=1");
            return "";
        });


        get("/inicio", (req, res) -> {

            Usuario usuario = req.session(true).attribute("usuario");
            StringWriter writer = new StringWriter();
            Map<String, Object> atr = new HashMap<>();
            Template template = configuration.getTemplate("templates/home.ftl");


            atr.put("usuario",usuario);
            template.process(atr,writer);
            return writer;
        });
        post("/login", (req, res) -> {

            String username = req.queryParams("username");
            String password = req.queryParams("password");
            Usuario usuario = usuarioORM.getUsuario(username, password);
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
    }
}