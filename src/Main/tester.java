package Main;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import com.alberca.DAO.DatosDiciplinas;
import com.alberca.DAO.DatosProspecto;
import com.alberca.datosJPA.Prospectos;


public class tester {

	public static void main(String[] args) {
		
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPAprospectos");
		
		EntityManager manager = factory.createEntityManager();
		
		Prospectos p = new Prospectos();
		//1, 1, , , , "Natacion", 10, 4, 1968999, "Chihuahua", "Tascate"
		//p.setIdPk(2);
		p.setTurno(1);
		p.setNombre("Alejandra");
		p.setPaterno("Carmona");
		p.setMaterno("Carlos");
		p.setActividad("Natacion");
		p.setEdad(10);
		p.setHorario("4");
		p.setTelefono(1968999);
		p.setLugaracimiento("Parral");
		p.setDireccion("Tascate");
		
		
		
		
		manager.getTransaction().begin();
		manager.persist(p);
		manager.getTransaction().commit();
		
		manager.close();
		
		/*TypedQuery<Prospectos> list = manager.createQuery("SELECT c FROM Prospectos c", Prospectos.class);

		for(Prospectos p: list.getResultList()) {
			System.out.println(p.getNombre());
		}
		*/
		

	}

}
