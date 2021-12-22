package idat.com.pe.servicio;


import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idat.com.pe.modelo.albergue;
import idat.com.pe.repository.albergueRepository;

@Service
@Transactional
public class albergueServicioImpl {

	@Autowired
	public albergueRepository repositorio;

	public albergueServicioImpl() {

	}

	public albergue crear(albergue Albergue) {
		return repositorio.save(Albergue);
	}

	public List<albergue> buscarTodo() {
		return (ArrayList<albergue>) repositorio.findAll();
	}

	public albergue actualizar(albergue AlbergueActualizar) {
		albergue albergueActual = repositorio.findById(AlbergueActualizar.getIdAlbergue()).get();
		albergueActual.setNombre(AlbergueActualizar.getNombre());
		albergueActual.setDireccion(AlbergueActualizar.getDireccion());
		albergueActual.setTelefono(AlbergueActualizar.getTelefono());
		albergue albergueActualizado = repositorio.save(albergueActual);
		return albergueActualizado;
	}

	public albergue buscarPorID(Long idAlbergue) {
		return repositorio.findById(idAlbergue).get();
	}

	public void borrarPorID(Long id) {
		repositorio.deleteById(id);
	}

	public void actualizar(Long id, albergue Albergue) {
		// TODO Auto-generated method stub
		albergue albergueActual = repositorio.findById(Albergue.getIdAlbergue()).get();
		albergueActual.setNombre(Albergue.getNombre());
		albergueActual.setDireccion(Albergue.getDireccion());
		albergueActual.setTelefono(Albergue.getTelefono());
		 repositorio.save(albergueActual);
		
	}
}
