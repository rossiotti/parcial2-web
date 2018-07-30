package ORM;

import clases.Post;
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

    public List<Usuario> listarUsuarios(int pagina,String text,Long id){

        try{
            Query query = em.createQuery("select u from Usuario u where u.username like ?1 or u.nombre like ?1 or u.apellidos like ?1 or u.lugarEstudio like ?1" +
                    " or u.lugarNacimiento like ?1 or u.lugarResidencia like ?1 or u.lugarTrabajo like ?1 and u.id != ?2")
                    .setParameter(1,"%"+text+"%")
                    .setParameter(2,id)
                    .setFirstResult(5*(pagina-1))
                    .setMaxResults(5);

            return (List<Usuario>)query.getResultList();
        }catch (NoResultException e){
            return null;
        }

    }

    public List<Usuario> sugerirAmigos(Usuario usuario){
        try{
            Query query = em.createQuery("select u from Usuario u where u.lugarEstudio = ?1" +
                    " or u.lugarNacimiento = ?2 or u.lugarResidencia = ?3 or u.lugarTrabajo = ?4 and u.id != ?5")
                    .setParameter(1,usuario.getLugarEstudio())
                    .setParameter(2,usuario.getLugarNacimiento())
                    .setParameter(3,usuario.getLugarResidencia())
                    .setParameter(4,usuario.getLugarTrabajo())
                    .setParameter(5,usuario.getId());

            return (List<Usuario>)query.getResultList();
        }catch (NoResultException e){
            return null;
        }

    }

    public List<Usuario> listarAmigos(int pagina){

        Query query = em.createQuery("select u from Usuario u")
                .setFirstResult(5*(pagina-1))
                .setMaxResults(5);
        return (List<Usuario>)query.getResultList();
    }

    public Long countUsuarios(){
        Long count = ((Number)em.createNativeQuery("select count(Usuario.id) from USUARIO").getSingleResult()).longValue();
        return count;
    }

    public void editarUsuario(Usuario editar){
        em.getTransaction().begin();
        Usuario u = em.find(Usuario.class,editar.getId());
        u = editar;
        em.merge(u);
        em.getTransaction().commit();
        
    }

    public void agregarAmigo(Usuario usuario,Usuario amigo){
        em.getTransaction().begin();
        Usuario u = em.find(Usuario.class,usuario.getId());
        u.getAmigos().add(amigo);
        Usuario a = em.find(Usuario.class,amigo.getId());
        a.getAmigos().add(usuario);
        em.merge(u);
        em.merge(a);
        em.getTransaction().commit();

    }

    public void addPost(Usuario editar, Post post){
        em.getTransaction().begin();
        Usuario u = em.find(Usuario.class,editar.getId());
        u.getMuro().add(post);
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
