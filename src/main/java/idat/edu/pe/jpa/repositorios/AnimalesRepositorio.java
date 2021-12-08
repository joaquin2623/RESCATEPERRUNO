package idat.edu.pe.jpa.repositorios;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import idat.edu.pe.jpa.modelo.Animales;

public interface AnimalesRepositorio extends CrudRepository<Animales, Integer>{
	
	@Query(value = "SELECT a FROM Animales a WHERE a.nombre = ?1")
	public List<Animales> buscarAnimalesPorNombre(String nombre);
	
	
	@Query(value = "SELECT a FROM Animales a WHERE a.nombre like CONCAT(?1, '%')")
	public List<Animales> buscarAnimalesLikeNombre(String nombre);
}
