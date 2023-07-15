package com.alberca.DAO;

public class DatosDiciplinas {
	
	private String diciplina;
	private String horario;
	private String nivel;
	private String cupo;
	private String color;
	
	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getDiciplina() {
		return diciplina;
	}


	public void setDiciplina(String diciplina) {
		this.diciplina = diciplina;
	}


	public String getHorario() {
		return horario;
	}


	public void setHorario(String horario) {
		this.horario = horario;
	}


	public String getNivel() {
		return nivel;
	}


	public void setNivel(String nivel) {
		this.nivel = nivel;
	}


	public String getCupo() {
		return cupo;
	}


	public void setCupo(String cupo) {
		this.cupo = cupo;
	}


	public DatosDiciplinas(String diciplina, String horario, String nivel, String cupo, String color) {
		super();
		this.diciplina = diciplina;
		this.horario = horario;
		this.nivel = nivel;
		this.cupo = cupo;
		this.color = color;
	}
	

	public DatosDiciplinas() {
		super();
		
	}
	
	

}
