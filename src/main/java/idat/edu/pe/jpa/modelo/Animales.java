package idat.edu.pe.jpa.modelo;
import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "Animales")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Animales.findAll", query = "SELECT a FROM Animales a")
    , @NamedQuery(name = "Animales.findById", query = "SELECT a FROM Animales a WHERE a.Id = :Id")
    , @NamedQuery(name = "Animales.findByNombre", query = "SELECT a FROM Animales a WHERE f.Nombre = :Nombre")
    , @NamedQuery(name = "Animales.findByEdad", query = "SELECT a FROM Animales a WHERE f.Edad = :Edad")
    , @NamedQuery(name = "Animales.findByRaza", query = "SELECT a FROM Animales a WHERE f.Raza = :Raza")})
public class Animales implements Serializable {


	private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id")
    private Integer Id;
    @Basic(optional = false)
    @Column(name = "Nombre")
    private String Nombre;
    @Basic(optional = false)
    @Column(name = "Edad")
    private String Edad;
    @Basic(optional = false)
    @Column(name = "Raza")
    private String Raza;
    @JoinColumn(name = "usuario", referencedColumnName = "Id")
    @ManyToOne(optional = false)
    private Usuario usuario;

    
    
    public Animales(Integer id, String nombre, String edad,String raza) {
  		this.Id = id;
  		this.Nombre = nombre;
  		this.Edad = edad;
  		this.Raza = raza;
  		
  	}
    public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		this.Nombre = nombre;
	}

	public String getEdad() {
		return Edad;
	}

	public void setEdad(String edad) {
		this.Edad = edad;
	}

	public String getRaza() {
		return Raza;
	}

	public void setRaza(String raza) {
		this.Raza = raza;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

  


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (Id != null ? Id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Animales)) {
            return false;
        }
        Animales other = (Animales) object;
        if ((this.Id == null && other.Id != null) || (this.Id != null && !this.Id.equals(other.Id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "idat.edu.pe.jpa.modelo.Animales[ Id=" + Id + " ]";
    }
    
}
	
	
	
