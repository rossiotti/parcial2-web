package ORM;

import clases.Album;
import clases.Post;
import clases.Usuario;

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

    public List<Album> getAlbums(Usuario usuario){

        try{
            Query query = em.createQuery("select a from Album a where a.creador = ?1 order by a.tiempo desc")
                    .setParameter(1,usuario);
            return (List<Album>)query.getResultList();

        }catch (NoResultException e){
            return null;
        }
    }

    public List<Post> getAlbumsPosts(){

        try{
            Query query = em.createQuery("select p from Post p where p.album != null order by p.tiempo desc");
            return (List<Post>)query.getResultList();

        }catch (NoResultException e){
            return null;
        }
    }
}
