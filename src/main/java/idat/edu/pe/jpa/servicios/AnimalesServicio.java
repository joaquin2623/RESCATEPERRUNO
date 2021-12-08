package idat.edu.pe.jpa.servicios;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idat.edu.pe.jpa.modelo.Animales;
import idat.edu.pe.jpa.repositorios.AnimalesRepositorio;

@Service
@Transactional
public class AnimalesServicio {

	@Autowired
	public AnimalesRepositorio repositorio;

	public AnimalesServicio() {

	}

	public Animales crear(Animales animales) {
		return repositorio.save(animales);
	}

	public List<Animales> buscarTodo() {
		return (ArrayList<Animales>) repositorio.findAll();
	}

	public Animales actualizar(Animales AnimalesActualizar) {
		Animales AnimalesActual = repositorio.findById(AnimalesActualizar.getId()).get();
		AnimalesActual.setNombre(AnimalesActualizar.getNombre());
		AnimalesActual.setEdad(AnimalesActualizar.getEdad());
		;
		AnimalesActual.setRaza(AnimalesActualizar.getRaza());
		;
		Animales AnimalesActualizado = repositorio.save(AnimalesActual);
		return AnimalesActualizado;
	}

	public Animales buscarPorID(Integer id) {
		return repositorio.findById(id).get();
	}

	public void borrarPorID(Integer id) {
		repositorio.deleteById(id);
	}

	public void actualizar(int id, Animales animales) {
		// TODO Auto-generated method stub
		Animales animalesActual = repositorio.findById(id).get();
		animalesActual.setNombre(animales.getNombre());
		animalesActual.setEdad(animales.getEdad());
		animalesActual.setRaza(animales.getRaza());
		animalesActual.setUsuario(animales.getUsuario());
		 repositorio.save(animalesActual);
		
	}
}
