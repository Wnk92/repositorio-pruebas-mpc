package co.mpc.frontend.usuarios.beans;

import co.mpc.backend.bussiness.security.SessionBeanLogin;
import co.mpc.backend.model.persistence.entities.Usuario;
import co.mpc.backend.model.persistence.facades.UsuarioFacadeLocal;
import javax.inject.Named;
import javax.inject.Inject;
import javax.annotation.PostConstruct;
import co.mpc.frontend.logica.IManagedBean;
import java.util.List;
import java.io.Serializable;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.view.ViewScoped;

/**
 *
 * @author Andres
 */
@Named(value="usuarioManagedBean")
@ViewScoped
public class UsuarioManagedBean implements Serializable,IManagedBean<Usuario>{

    private Usuario usuario;
    private SessionBeanLogin sessionLogin;
    @Inject private UsuarioFacadeLocal uFL;
    /** Creates a new instance of UsuarioManagedBean */
    public UsuarioManagedBean() {
    }
    @PostConstruct
    public void init(){
        usuario = new Usuario();
    }

    @Override
    public Usuario getObjectByKey(Integer key){
        return uFL.find(key);
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    
    //CRUD
    public List<Usuario> listar(){
        return uFL.findAll();
    }
    
    public void registrar(){
        try{
            if(uFL.verificarUsuario(usuario)== null){
                uFL.create(usuario);
            } else {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("No se pude crear"));
            }
        }catch(Exception e){
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Ocurrio un error."));
        }
    }

    
    public void eliminar(Usuario u){
        uFL.remove(u);
    }
    
    //Logica de negocio
    public String iniciarSesion(){
        if(uFL.atenticarUsuario(usuario)!= null){
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("usuario", usuario);
            return "protegido/inicio?faces-redirect=true&includeviewparams=true";
        }
        FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Usuario o contraseña no válido."));
        return null;
    }
    public void actualizarUsuario(){
        uFL.edit(usuario);
    
    }  
}