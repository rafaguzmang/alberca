package com.alberca.controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.alberca.datosJPA.Prospectos;

public class ProspectoPersistnece {
	
	
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("JPAprospectos");
	
	EntityManager manager = factory.createEntityManager();
	
	
	
	public void guardar(Prospectos p) {
		
		
				
		manager.getTransaction().begin();
		manager.persist(p);
		manager.getTransaction().commit();
		
		manager.close();
		
		
	}
	
	
	
	
	

}
