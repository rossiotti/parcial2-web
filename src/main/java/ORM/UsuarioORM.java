package ORM;

import clases.Usuario;

import javax.persistence.*;
import java.util.List;

public class UsuarioORM {

    EntityManagerFactory emf = Persistence.createEntityManagerFactory("pUnit");
    EntityManager em = emf.createEntityManager();

    public void guardarUsuario(Usuario usuario){
        em.getTransaction().begin();
        em.persist(usuario);
        em.getTransaction().commit();

    }

    public Long countUsuarios(){
        Long count = ((Number)em.createNativeQuery("select count(Usuario.id) from USUARIO").getSingleResult()).longValue();
        return count;
    }

    public void editarUsuario(Usuario editar, String username, String password, boolean administrator){
        em.getTransaction().begin();
        Usuario u = em.find(Usuario.class,editar.getId());
        u.setUsername(username);
        u.setPassword(password);
        u.setAdmin(administrator);
        em.merge(u);
        em.getTransaction().commit();
        
    }

    public String dropUsuario(Long id){
        Usuario u = em.find(Usuario.class,id);
        if(u.getUsername().equalsIgnoreCase("admin") && u.isAdmin()){
            return "no";
        }else{
            em.getTransaction().begin();
            em.remove(u);
            em.getTransaction().commit();
            return "Usuario Borrado";
        }


        
    }



    public Usuario getUsuario(String nombre, String pass){

        try{
            Query query = em.createQuery("select u from Usuario u where u.username = :user AND u.password = :pass")
                    .setParameter("user", nombre)
                    .setParameter("pass", pass);
            return (Usuario)query.getSingleResult();
        } catch(NoResultException e){
            return null;
        }

    }

    public Usuario getUsuarioEmail(String email, String pass){

        try{
            Query query = em.createQuery("select u from Usuario u where u.email = :email AND u.password = :pass")
                    .setParameter("email", email)
                    .setParameter("pass", pass);
            return (Usuario)query.getSingleResult();
        } catch(NoResultException e){
            return null;
        }

    }

    public Usuario getUsuarioEmailVali(String email){

        try{
            Query query = em.createQuery("select u from Usuario u where u.email = :email")
                    .setParameter("email", email);
            return (Usuario)query.getSingleResult();
        } catch(NoResultException e){
            return null;
        }

    }

    public Usuario getUsuarioId(Long id){

        try{
            Query query = em.createQuery("select u from Usuario u where u.id = :id")
                    .setParameter("id", id);
            return (Usuario)query.getSingleResult();
        } catch(NoResultException e){
            return null;
        }

    }

    public List<Usuario> getUsuarioList(){

            List<Usuario> l = em.createQuery("select u from Usuario u")
            .getResultList();
            return l;


    }

    public Usuario getUsuarioUsername(String nombre){

        try{
            Query query = em.createQuery("select u from Usuario u where u.username = :user")
                    .setParameter("user", nombre);
            return (Usuario)query.getSingleResult();
        } catch(NoResultException e){
            return null;
        }

    }

}
