package idat.com.pe.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;
import idat.com.pe.modelo.albergue;

@Repository
public interface albergueRepository extends JpaRepository<albergue,Long> {

}
