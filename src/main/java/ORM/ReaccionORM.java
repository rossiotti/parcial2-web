package ORM;

import clases.Post;
import clases.Reaccion;
import clases.Usuario;
import javafx.geometry.Pos;

import javax.persistence.*;
import java.util.List;

public class ReaccionORM {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("pUnit");
    EntityManager em = emf.createEntityManager();

    public void guardarLike(Reaccion r){
        em.getTransaction().begin();
        em.persist(r);
        em.getTransaction().commit();

    }


    public List<Reaccion> getReacciones(Post post){

        Query query = em.createQuery("select lr.reaccions from Post lr where lr.id = ?1")
                .setParameter(1,post.getId());
        return (List<Reaccion>)query.getResultList();
    }

    public void deleteLike(Reaccion r){
        em.getTransaction().begin();
        Reaccion re = em.find(Reaccion.class,r.getId());
        em.remove(re);
        em.getTransaction().commit();
    }

    public void updateLike(Reaccion r, boolean valor){
        em.getTransaction().begin();
        r.setReaccion(valor);
        em.merge(r);
        em.getTransaction().commit();
    }


}
