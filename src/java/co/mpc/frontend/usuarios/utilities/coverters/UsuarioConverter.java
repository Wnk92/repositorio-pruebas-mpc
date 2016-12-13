package co.mpc.frontend.usuarios.utilities.coverters;

import co.mpc.backend.model.persistence.entities.Usuario;
import co.mpc.frontend.logica.AbstractConverter;
import javax.faces.convert.FacesConverter;
/**
 *
 * @author Juank
 */
@FacesConverter(forClass = Usuario.class)
public class UsuarioConverter extends AbstractConverter {

    public UsuarioConverter() {
        this.namedManagedBean = "usuarioManagedBean";
    }
}
