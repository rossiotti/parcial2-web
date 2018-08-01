package ORM;

import clases.Album;

import javax.persistence.*;
import java.util.List;

public class AlbumORM {

    public EntityManagerFactory emf = Persistence.createEntityManagerFactory("pUnit");
    EntityManager em = emf.createEntityManager();


    public void guardarAlbum(Album p){
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();

    }

    public List<Album> getAlbums(){

        try{
            Query query = em.createQuery("select a from Album a");
            return (List<Album>)query.getResultList();

        }catch (NoResultException e){
            return null;
        }
    }
}
