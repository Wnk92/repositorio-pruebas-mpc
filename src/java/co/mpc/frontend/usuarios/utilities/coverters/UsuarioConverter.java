/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
