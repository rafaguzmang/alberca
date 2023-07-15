package com.alberca.datosJPA;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name="prospectos")
@NamedQuery(name="Prospectos.findAll", query="SELECT p FROM Prospectos p")
public class Prospectos implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@Column(name="id_pk")
	private int idPk;
	
	private int turno;
	
	private String nombre;
	
	private String paterno;
	
	private String materno;
	
	private String actividad;
	
	private int edad;
	
	private String horario;
	
	private long telefono;
	
	private String lugaracimiento;
	
	private String direccion;
	
	
	
	
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
	public String getActividad() {
		return actividad;
	}
	public void setActividad(String actividad) {
		this.actividad = actividad;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public String getHorario() {
		return horario;
	}
	public void setHorario(String horario) {
		this.horario = horario;
	}
	public long getTelefono() {
		return telefono;
	}
	public void setTelefono(long telefono) {
		this.telefono = telefono;
	}
	public String getLugaracimiento() {
		return lugaracimiento;
	}
	public void setLugaracimiento(String lugaracimiento) {
		this.lugaracimiento = lugaracimiento;
	}
	
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	
	public int getIdPk() {
		return idPk;
	}
	public void setIdPk(int idPk) {
		this.idPk = idPk;
	}
	
	@Override
	public String toString() {
		return "Prospectos [idPk=" + idPk + ", turno=" + turno + ", nombre=" + nombre + ", paterno=" + paterno
				+ ", materno=" + materno + ", actividad=" + actividad + ", edad=" + edad + ", horario=" + horario
				+ ", telefono=" + telefono + ", lugaracimiento=" + lugaracimiento + ", direccion=" + direccion + "]";
	}
	
	

}
