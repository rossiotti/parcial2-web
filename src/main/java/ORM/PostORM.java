package ORM;

import clases.Comentario;
import clases.Post;
import clases.Reaccion;
import clases.Usuario;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class PostORM {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("pUnit");
    EntityManager em = emf.createEntityManager();

    public void guardarPost(Post p){
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();

    }
    public void addComentario(Post p){
        em.getTransaction().begin();
        Post po = em.find(Post.class,p.getId());
        em.merge(po);
        em.getTransaction().commit();
    }

    public void addLike(Post p){
        em.getTransaction().begin();
        Post po = em.find(Post.class,p.getId());
        em.merge(po);
        em.getTransaction().commit();
    }

    public List<Post> getMuro(Usuario usuario){

        Query query = em.createQuery("select p from Post p where p.usuario = ?1 order by p.tiempo desc")
                .setParameter(1,usuario);
        return (List<Post>)query.getResultList();
    }

    public Post getPost(Long id){
        Query query = em.createQuery("select p from Post p where p.id = :id")
                .setParameter("id", id);
        return (Post) query.getSingleResult();
    }




}
