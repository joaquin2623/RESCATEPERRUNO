package idat.com.pe.controller;


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

import idat.com.pe.modelo.albergue;
import idat.com.pe.servicio.albergueServicioImpl;



@RestController
@RequestMapping("api/albergue")
public class albergueController {
	
	@Autowired
	private albergueServicioImpl servicio;
	
	
	@GetMapping
	public ResponseEntity<Object> buscarTodo(){
		List<albergue> listaalbergue = servicio.buscarTodo();
		return new ResponseEntity<>(listaalbergue, HttpStatus.OK);
	}
	
	@GetMapping(value = "/{id}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public ResponseEntity<Object> buscarPorId(@PathVariable("id") long id) {
		albergue Albergue = servicio.buscarPorID(id);
		if (Albergue == null)

			throw new ResponseStatusException(HttpStatus.NOT_FOUND,
					"Funcion no encontrada,id porporcionado no es correcto");
		return new ResponseEntity<Object>(Albergue, HttpStatus.OK);

	}

	@PostMapping(produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, consumes = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Object> crear(@RequestBody albergue Albergue) {
		servicio.crear(Albergue);
		return new ResponseEntity<Object>("Albergue creada correctamente", HttpStatus.OK);
	}

	@PutMapping(value = "/{id}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE }, consumes = { MediaType.APPLICATION_JSON_VALUE,
					MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<Object> actualizar(@PathVariable("id") long id, @RequestBody albergue Albergue) {
		servicio.actualizar(Albergue);
		return new ResponseEntity<Object>("Albergue actualizada correctamente", HttpStatus.OK);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Object> borrar(@PathVariable("id") long id) {
		servicio.borrarPorID(id);
		return new ResponseEntity<Object>("Albergue eliminada correctamente", HttpStatus.OK);

	}
	
	

}
