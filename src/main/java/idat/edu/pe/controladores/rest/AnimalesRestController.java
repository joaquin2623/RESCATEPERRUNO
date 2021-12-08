package idat.edu.pe.controladores.rest;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import idat.edu.pe.jpa.modelo.Animales;
import idat.edu.pe.jpa.servicios.AnimalesServicio;


@RestController
@RequestMapping("/rest/animales")
public class AnimalesRestController {

	@Autowired
	private AnimalesServicio servicio;
	
	
	@GetMapping
	public ResponseEntity<Object> buscarTodo(){
		List<Animales> listaFunciones = servicio.buscarTodo();
		return new ResponseEntity<>(listaFunciones, HttpStatus.OK);
	}
	
	@GetMapping(value = "/{id}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public ResponseEntity<Object> buscarPorId(@PathVariable("id") int id) {
		Animales Animal = servicio.buscarPorID(id);
		if (Animal == null)

			throw new ResponseStatusException(HttpStatus.NOT_FOUND,
					"Funcion no encontrada,id porporcionado no es correcto");
		return new ResponseEntity<Object>(Animal, HttpStatus.OK);

	}

	@PostMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, consumes = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Object> crear(@RequestBody Animales Animal) {
		servicio.crear(Animal);
		return new ResponseEntity<Object>("Funcion creada correctamente", HttpStatus.OK);
	}

	@PutMapping(value = "/{id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, consumes = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Object> actualizar(@PathVariable("id") int id, @RequestBody Animales Animal) {
		servicio.actualizar(Animal);
		return new ResponseEntity<Object>("Animal actualizada correctamente", HttpStatus.OK);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Object> borrar(@PathVariable("id") int id) {
		servicio.borrarPorID(id);
		return new ResponseEntity<Object>("Animal eliminada correctamente", HttpStatus.OK);

	}
	
	
}

