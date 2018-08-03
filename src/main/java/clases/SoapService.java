package clases;

import ORM.PostORM;
import ORM.UsuarioORM;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.List;

@WebService
public class SoapService {

    UsuarioORM usuarioORM = new UsuarioORM();
    PostORM postORM = new PostORM();

    @WebMethod
    public List<Post> getPostsUsuario(String username){
        List<Post> filtrar = usuarioORM.getUsuarioUsername(username).getMuro();
        for(Post p : filtrar){
            if(p.getTexto().equalsIgnoreCase("n/a"))
                filtrar.remove(p);
        }
        return filtrar;
    }

    @WebMethod
    public String crearPost(String username, String pass,String texto, String imagen){
        Usuario u = usuarioORM.getUsuario(username,pass);
        if(u == null){
            return "Error, verificar datos";
        }else {
            Post post = new Post();
            post.setTexto(texto);
            post.setImagenPath("");
            post.setUsuario(u);
            postORM.guardarPost(post);
            usuarioORM.addPost(u,post);
            return "Post creado con exito";

        }

    }

}
