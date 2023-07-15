package com.alberca.DAO;

public class DatosProspecto {
	
	private int turno;
	private String nombre;
	private String paterno;
	private String materno;
	private String nivel;
	private String edad;
	private String horario;
	private String telefono;
	private String lugarNacimiento;
	private String direccion;
	private String color;
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getTurno() {
		return turno;
	}
	public void setTurno(int turno) {
		this.turno = turno;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPaterno() {
		return paterno;
	}
	public void setPaterno(String paterno) {
		this.paterno = paterno;
	}
	public String getMaterno() {
		return materno;
	}
	public void setMaterno(String materno) {
		this.materno = materno;
	}
	public String getNivel() {
		return nivel;
	}
	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	public String getEdad() {
		return edad;
	}
	public void setEdad(String edad) {
		this.edad = edad;
	}
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getLugarNacimiento() {
		return lugarNacimiento;
	}
	public void setLugarNacimiento(String lugarNacimiento) {
		this.lugarNacimiento = lugarNacimiento;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public DatosProspecto(int turno, String nombre, String paterno, String materno, String nivel, String edad,
			String horario, String telefono, String lugarNacimiento, String direccion,String color) {
		super();
		this.turno = turno;
		this.nombre = nombre;
		this.paterno = paterno;
		this.materno = materno;
		this.nivel = nivel;
		this.edad = edad;
		this.horario = horario;
		this.telefono = telefono;
		this.lugarNacimiento = lugarNacimiento;
		this.direccion = direccion;
		this.color = color;
	}
	
	
	
	
	
	

}
