package idat.com.pe.modelo;

import java.io.Serializable;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;



@Entity
@Table(name="albergue")

public class albergue implements Serializable {

	private static final long serialVersionUID = 8259927787854315665L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idAlbergue;
	
	@Column(length =50)
	private String Nombre;
	
	@Column(length =50)
	private String Direccion;
	
	@Column(length =10)
	private Integer telefono;

	public long getIdAlbergue() {
		return idAlbergue;
	}

	public void setIdAlbergue(long idAlbergue) {
		this.idAlbergue = idAlbergue;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String nombre) {
		Nombre = nombre;
	}

	public String getDireccion() {
		return Direccion;
	}

	public void setDireccion(String direccion) {
		Direccion = direccion;
	}

	public Integer getTelefono() {
		return telefono;
	}

	public void setTelefono(Integer telefono) {
		this.telefono = telefono;
	}
	
	
	

}
