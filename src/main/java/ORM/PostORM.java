package ORM;

import clases.Comentario;
import clases.Post;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import java.util.ArrayList;

public class PostORM {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("pUnit");
    EntityManager em = emf.createEntityManager();

    public void guardarPost(Post p){
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();

    }
    public void addComentario(Post p, Comentario comentario){
        em.getTransaction().begin();
        Post po = em.find(Post.class,p.getId());
        System.out.println(po.getTexto());

        if(po.getComentario()==null)
            po.setComentario(new ArrayList<>());

        po.getComentario().add(comentario);
        em.merge(po);
        em.getTransaction().commit();
    }

    public Post getPost(Long id){
        Query query = em.createQuery("select p from Post p where p.id = :id")
                .setParameter("id", id);
        return (Post) query.getSingleResult();
    }
}
