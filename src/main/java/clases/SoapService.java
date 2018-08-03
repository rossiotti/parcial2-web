package clases;

import ORM.PostORM;
import ORM.UsuarioORM;

import javax.jws.WebMethod;
import javax.jws.WebService;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebService
public class SoapService {

    UsuarioORM usuarioORM = new UsuarioORM();
    PostORM postORM = new PostORM();

    @WebMethod
    public List<Post> getPostsUsuario(String username){
        List<Post> filtrar = usuarioORM.getUsuarioUsername(username).getMuro();
        if(filtrar==null){
            return null;
        }else{
            ArrayList<Post> ps = new ArrayList<>();
            for(Post p : filtrar){
                if(!p.getTexto().equalsIgnoreCase("n/a")){
                    Post post = new Post();
                    post.setId(p.getId());
                    post.setTexto(p.getTexto());
                    post.setTiempo(p.getTiempo());
                    ps.add(post);
                }

            }
            return ps;
        }

    }

    @WebMethod
    public String crearPost(String username, String pass,String texto, String imagen){
        Usuario u = usuarioORM.getUsuario(username,pass);
        if(u == null){
            return "Error, verificar datos. Usuario no encontrado";
        }else {
            Post post = new Post();
            post.setTexto(texto);
            post.setImagenPath("");
            post.setUsuario(u);
            post.setTiempo(getFechaActual());
            postORM.guardarPost(post);
            usuarioORM.addPost(u,post);
            return "Post creado con exito";

        }

    }
    public Timestamp getFechaActual(){
        Date date= new Date();

        long time = date.getTime();
        return new Timestamp(time);
    }

}
