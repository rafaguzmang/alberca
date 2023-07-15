package com.alberca.servidores.pe;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alberca.DAO.DatosDiciplinas;

/**
 * Servlet implementation class tablahorarios
 */
@WebServlet("/tablahorarios")
public class tablahorarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ArrayList<DatosDiciplinas> list = new ArrayList<>();
    private DatosDiciplinas datos; 
    private String diciplina,horario,nivel,cupo,color;
    private int turno1,turno2,turno3 = 0;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tablahorarios() {
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
		String place = "";
		String accion = "";
		if(request.getParameter("accion")!= null) {
			place = request.getParameter("no");
			accion = request.getParameter("accion");
			
			if(accion.equals("borrarTabla")) {
				list.clear();
			}else if(accion.equals("turnomas1")) {
				turno1++;
			}else if(accion.equals("turnomenos1")) {
				turno1--;
				if(turno1<=0)turno1=0;
			}else if(accion.equals("turnomas2")) {
				turno2++;
			}else if(accion.equals("turnomenos2")) {
				turno2--;
				if(turno2<=0)turno2=0;
			}else if(accion.equals("turnomas3")) {
				turno3++;
			}else if(accion.equals("turnomenos3")) {
				turno3--;
				if(turno3<=0)turno3=0;
			}else {
				accionesTabla(place,accion);
			}
		}
		sesion.setAttribute("turno1", turno1);
		sesion.setAttribute("turno2", turno2);
		sesion.setAttribute("turno3", turno3);
		sesion.setAttribute("datos", list);
		//list.clear();
		response.sendRedirect("control.jsp");
	}

	private void accionesTabla(String place, String accion) {
		
				
		diciplina = list.get(Integer.valueOf(place)).getDiciplina();
		horario = list.get(Integer.valueOf(place)).getHorario();
		nivel = list.get(Integer.valueOf(place)).getNivel();
		cupo = list.get(Integer.valueOf(place)).getCupo();
		
		if(accion.equals("primary")){
			list.set(Integer.valueOf(place), new DatosDiciplinas(diciplina, horario, nivel, cupo, "danger"));
		}else if(accion.equals("danger")){
			list.set(Integer.valueOf(place), new DatosDiciplinas(diciplina, horario, nivel, cupo, "primary"));
		}else if(accion.equals("restar")) {
			int restar= Integer.valueOf(cupo);
			restar--;
			if(restar<=0) {
				restar=0;
			}
			list.set(Integer.valueOf(place), new DatosDiciplinas(diciplina, horario, nivel, String.valueOf(restar), "primary"));
		}else if(accion.equals("sumar")) {
			int sumar = Integer.valueOf(cupo);
			sumar++;
			list.set(Integer.valueOf(place), new DatosDiciplinas(diciplina, horario, nivel, String.valueOf(sumar), "primary"));
			
		}else if(accion.equals("borrar")){				
			list.remove(list.get(Integer.valueOf(place)));
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		diciplina = request.getParameter("diciplina");
		horario = request.getParameter("horario");
		nivel = request.getParameter("nivel");
		cupo = request.getParameter("cupo");
		color = "primary";
		
		
		list.add(new DatosDiciplinas(diciplina, horario, nivel, cupo, color));
		
		
		//response.sendRedirect("control.jsp");
	}

}
