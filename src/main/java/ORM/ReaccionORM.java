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

    public List<Reaccion> getReacciones(){

        try{
            Query query = em.createQuery("select r from Reaccion r");
            return (List<Reaccion>)query.getResultList();

        }catch (NoResultException e){
            return null;
        }
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

    public Reaccion checkLike(Usuario Usuario, Post post){
        try{
            Query query = em.createQuery("select r from Reaccion r where r.post = ?1 AND r.usuario = ?2")
                    .setParameter(1, post)
                    .setParameter(2, Usuario);
            return (Reaccion)query.getSingleResult();
        } catch(NoResultException e){
            return null;
        }
    }


}
