package com.alberca.servidores.pe;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alberca.DAO.DatosProspecto;
import com.alberca.controller.ProspectoPersistnece;
import com.alberca.datosJPA.Prospectos;

/**
 * Servlet implementation class prospectos
 */
@WebServlet("/prospectos")
public class prospectos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
	ArrayList<DatosProspecto> list = new ArrayList<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public prospectos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession sesion = request.getSession();
		String accion = "";
		String place = "";
		String direct = "";
		System.out.println(accion);
		
		if(request.getParameter("accion") != null) {
			accion = request.getParameter("accion");
			place = request.getParameter("nump");
			
			if(accion.equals("eliminarp")) {
				direct = request.getParameter("direc");
				list.remove(list.get(Integer.valueOf(place)));				
			}
			if(accion.equals("colorp")) {
				direct = request.getParameter("direc");
				DatosProspecto temp = list.get(Integer.valueOf(place));
				if(temp.getColor().equals("table-warning")) {
					list.set(Integer.valueOf(place), new DatosProspecto(temp.getTurno(), temp.getNombre(), temp.getPaterno(), temp.getMaterno(), temp.getNivel(), temp.getEdad(), temp.getHorario(), temp.getTelefono(), temp.getLugarNacimiento(), temp.getDireccion(), ""));
				}else {
					list.set(Integer.valueOf(place), new DatosProspecto(temp.getTurno(), temp.getNombre(), temp.getPaterno(), temp.getMaterno(), temp.getNivel(), temp.getEdad(), temp.getHorario(), temp.getTelefono(), temp.getLugarNacimiento(), temp.getDireccion(), "table-warning"));
				}
				
			}
			if(accion.equals("editar")) {
				DatosProspecto temp = list.get(Integer.valueOf(place));
				sesion.setAttribute("prospecto", temp);
			}
			
		}
		
		
		
		sesion.setAttribute("prospectos", list);
		
		int t = turno;
		if(direct.equals("prospectos") || accion.equals("guardarp") || accion.equals("grabar")) {
			response.sendRedirect("control.jsp");
		}else if(accion.equals("editar")) {			
			response.sendRedirect("editar.jsp");
		}else if(accion.equals("turno")) {
			sesion.setAttribute("turnoval", ++t);
			response.sendRedirect("turno.jsp");
		}else {
			response.sendRedirect("index.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		nombre = request.getParameter("fname");
		paterno = request.getParameter("lname");
		materno = request.getParameter("l2name");
		nivel = request.getParameter("nivel");
		edad = request.getParameter("eda");
		horario = request.getParameter("horario");
		telefono = request.getParameter("phone");
		lugarNacimiento = request.getParameter("city");
		direccion = request.getParameter("address");
		color = "";
		
		
		
		if(request.getParameter("accion")!= null) {
			
			if(request.getParameter("accion").equals("grabar")) {
							
				DatosProspecto dato = list.get(Integer.valueOf(request.getParameter("nump")));
				ProspectoPersistnece pp = new ProspectoPersistnece();
				Prospectos p = new Prospectos();
				p.setIdPk(dato.getTurno());
				p.setTurno(dato.getTurno());
				p.setNombre(dato.getNombre());
				p.setPaterno(dato.getPaterno());
				p.setMaterno(dato.getMaterno());
				p.setActividad(dato.getNivel());
				p.setEdad(Integer.valueOf(dato.getEdad()));
				p.setHorario(dato.getHorario());
				p.setTelefono(Long.valueOf(dato.getTelefono()));
				p.setLugaracimiento(dato.getLugarNacimiento());
				p.setDireccion(dato.getDireccion());
				
				pp.guardar(p);
				
				int place = Integer.valueOf(request.getParameter("nump"));
				list.remove(list.get(Integer.valueOf(place)));	
			}else if(request.getParameter("accion").equals("guardarp")){
				int place = Integer.valueOf(request.getParameter("nump"));
				list.set(place-1, new DatosProspecto(place, nombre, paterno, materno, nivel, edad, horario, telefono, lugarNacimiento, direccion, color));
			}else if(request.getParameter("accion").equals("turno")){
				turno++;
				list.add(new DatosProspecto(turno, nombre, paterno, materno, nivel, edad, horario, telefono, lugarNacimiento, direccion,color));				
			}
		}
		
		
	}

}
