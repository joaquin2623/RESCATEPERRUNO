package idat.edu.pe.jpa.modelo;
import java.util.List;
import java.io.Serializable;


import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;


import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findById", query = "SELECT u FROM Usuario u WHERE u.IdUsuario = :Id")
    , @NamedQuery(name = "Usuario.findByNombre", query = "SELECT u FROM Usuario u WHERE u.nombre = :nombre")
    , @NamedQuery(name = "Usuario.findByApellido", query = "SELECT u FROM Usuario u WHERE u.apellido = :apellido")
    , @NamedQuery(name = "Usuario.findByDni", query = "SELECT u FROM Usuario p WHERE p.dni = :dni")
    , @NamedQuery(name = "Usuario.findByCorreo", query = "SELECT u FROM Usuario u WHERE p.correo = :correo")
    , @NamedQuery(name = "Usuario.findByContraseña", query = "SELECT u FROM Usuario u WHERE u.contraseña = :contraseña")
    , @NamedQuery(name = "Usuario.findByRol", query = "SELECT u FROM Usuario u WHERE u.rol = :rol")
})


public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @Basic(optional = false)
	 @Column(name = "Id")
	 private Integer Id;
	 @Basic(optional = false)
	 @Column(name = "nombre")
	 private String nombre;
	 @Column(name = "apellido")
	 private String apellido;
	 @Column(name = "dni")
	 private String dni;
	 @Column(name = "correo")
	 private String correo;
	 @Column(name = "contraseña")
	 private String contraseña;
	 @Column(name = "rol")
	 private String rol;

	

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "usuario",fetch=FetchType.LAZY)
	 @JsonBackReference(value="usuario_fun")
	 private List<Usuario> usuarioList;
	
	 public Usuario(Integer id, String nombre, String apellido, String dni, String correo, String contraseña, String rol) {
			
			Id = id;
			this.nombre = nombre;
			this.apellido = apellido;
			this.dni = dni;
			this.correo = correo;
			this.contraseña = contraseña;
			this.rol = rol;
		}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public List<Usuario> getUsuarioList() {
		return usuarioList;
	}

	public void setUsuarioList(List<Usuario> usuarioList) {
		this.usuarioList = usuarioList;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.Id == null && other.Id != null) || (this.Id != null && !this.Id.equals(other.Id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "idat.edu.pe.jpa.modelo.Usuario[ idPelicula=" + Id + " ]";
    }

	public Usuario buscarPorID(int i) {
		// TODO Auto-generated method stub
		return null;
	}
	 
}
