<%@page import="com.alberca.DAO.DatosProspecto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.alberca.DAO.DatosDiciplinas" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-icons-1.9.0/bootstrap-icons.css">
    <title>Control</title>
</head>

<style>

    .main{
       
        height: 500px;
        border-radius: 10px;

    }

    form{
        margin: 20px;
        padding: 20px;
    }

    .formulario > div {
        margin: 5px;
    }
    
    .ventana{
        background: #f4f1f1;
        width: 33.33%;
        padding-inline-start: 5px;
        border: 1px solid #000;
    }


</style>


<body>

	<%		
		ArrayList<DatosDiciplinas> list = new ArrayList<>();
		ArrayList<DatosProspecto> prospectos = new ArrayList<>();
		if(request.getSession().getAttribute("datos") != null){
			list = (ArrayList)request.getSession().getAttribute("datos");
			//request.getSession().removeAttribute("datos");
		}
		
		if(request.getSession().getAttribute("prospectos") != null){
			prospectos = (ArrayList)request.getSession().getAttribute("prospectos");
			//request.getSession().removeAttribute("datos");
		}
		
		int turno1 = (int)request.getSession().getAttribute("turno1");
		int turno2 = (int)request.getSession().getAttribute("turno2");
		int turno3 = (int)request.getSession().getAttribute("turno3");
		
	%>

    <div class="container-fluid bg-primary main ">
	<!-- Tabla de Prospectos-->	
        <div class="row " style="height: 100%">
            <div class="col-12 p-0">
            	<table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Turno</th>
                        <th>Nombre</th>
                        <th>Paterno</th>
                        <th>Materno</th>
                        <th>Nivel</th>
                        <th>Edad</th>
                        <th>Horario</th>
                        <th>Telefono</th>
                        <th>L.Nacimiento</th>
                        <th>Direccion</th>
                        <th>Controles</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    	<% 
                    	
                    	int pros = 0;
                    	for(DatosProspecto p: prospectos){ %>
                        <form action="prospectos?accion=grabar&nump=<%=pros %>" method="post">
                            <tr class="<%=p.getColor()%>">
                                <td><%=p.getTurno() %></td>
                                <td><%=p.getNombre() %>
                                <td><%=p.getPaterno() %></td>
                                <td><%=p.getMaterno() %></td>
                                <td><%=p.getNivel() %></td>
                                <td><%=p.getEdad() %></td>
                                <td><%=p.getHorario() %></td>
                                <td><%=p.getTelefono() %></td>
                                <td><%=p.getLugarNacimiento() %></td>
                                <td><%=p.getDireccion() %></td>
                                <td>
                                    <a href="prospectos?accion=editar&nump=<%=pros%>"><button type="button" class="btn btn-primary">Editar</button></a>
                                    <button type="submit" class="btn btn-success">Inscribir</button>
                                    <a href="prospectos?accion=colorp&color=<%=p.getColor()%>&nump=<%=pros%>&direc=prospectos"><button type="button" class="btn btn-warning">Pausar</button></a>
                                    <a href="prospectos?accion=eliminarp&nump=<%=pros++%>&direc=prospectos"><button type="button" class="btn btn-danger">Eliminar</button></a> 
                                </td>
                            </tr>

                        </form>
                        <%} %>
                    </tbody>
                  </table>
            </div>
    	</div>
	<!-- Tabla de horarios y Cajas-->
	    
	        <div class="row ">
	            <div class="col-6 ">
	            	<div class="container">
	            		<div class="row">
	            			<div class="col-12"style="height: 320px">
	            				<table class="table  ">
				                    <thead>
				                      <tr class="table-success">
				                        <th>Diciplina</th>
				                        <th>Horario</th>
				                        <th>Nivel</th>
				                        <th>Cupo</th>
				                        <th>Controladores</th>
				                      </tr>
				                    </thead>
				                    <tbody>
	                    
				                    <%
				                    	int cont=0;
				                    	String cu="";                    	
				                    	for(DatosDiciplinas l: list){ 
				                    		cu = l.getCupo();
				                    		if(l.getCupo()==null){
				                    			cu ="0";	
				                    		}
				                    	
				                   	%>
	                    	
	                    		
				                      <tr class="table-primary celda">
				                        <td><%= l.getDiciplina() %></td>
				                        <td><%= l.getHorario() %></td>
				                        <td><%= l.getNivel() %></td>
				                        <td>
			                        		<a href="tablahorarios?accion=restar&no=<%=cont%>"><button type="button" class="btn bi-caret-down-fill" ></button></a>
			                        		<%= cu %>
			                           		<a href="tablahorarios?accion=sumar&no=<%=cont%>"><button type="button" class="btn bi-caret-up-fill" ></button></a>
				                        
				                        </td>
				                       	<td>	                            
				                            <a href="tablahorarios?accion=<%=l.getColor() %>&no=<%=cont%>"><button type="button" class="btn btn-<%=l.getColor()%>" >Rojo</button></a>
				                            <a href="tablahorarios?accion=borrar&no=<%=cont++%>"><button type="button" class="btn btn-secondary" >Eliminar</button></a>
				                        </td>
				                      </tr>
				                      
				                      <%} %>
	                    			</tbody>
	                			</table>
	            
	            			
	            			</div>
	            			<div class="col-12 d-flex align-items-center">
	            				<a href="tablahorarios?accion=borrarTabla"><button type="button" class="btn btn-primary" >Borrar Tabla</button></a>
            				 	<form action="tablahorarios" method="post" class="d-flex formulario">                	
				                    <div >
				                        <select class="form-select" id="dici" name="diciplina">
				                            <option>Natacion</option>
				                            <option>Karate</option>
				                            <option>Gimnacia</option>
				                            <option>Campamento</option>
				                          </select>
				                    </div>
				                    <div >
				                        <select class="form-select" id="hora" name="horario">
				                            <option>3 - 4</option>
				                            <option>4 - 5</option>
				                            <option>5 - 6</option>
				                            <option>6 - 7</option>
				                          </select>
				                    </div>
				                    <div >
				                        <select class="form-select" id="niv" name="nivel">
				                            <option>Principiantes</option>
				                            <option>Intermedios</option>
				                            <option>Avanzados</option>                            
				                          </select>
				                    </div>                   
				                    <div  style="width: 50px;">
				                        <input type="text" class="form-control" id="cupo" value="0" name="cupo">
				                    </div>
				                    <button type="submit" class="btn btn-primary">Agregar</button>
	                 			</form>
	            
	            			
	            			</div>
	            		
	            		</div>
	            		
	            	</div>
	               </div>
	
				<!-- Cajas -->	
				<div class="col-6">
							<div class="container">
								<div class="row">
									<div class="col bg-secondary ">
										
										<div class="container">
											<div class="row m-2">
												<div class="col-2 ventana text-center">
													<div class="container ">
														<div class="row">
															<H1>Caja 1</H1>
														</div>
														<div class="row text-danger"
															style="height: 189px; background: #000; size: 80%;">
															<h1 style="font-size: 950%;"><%=turno1 %></h1>
														</div>
														<div class="row">
															<h2>Turno</h2>
														</div>
													</div>
												</div>
												<div class="col-2 ventana text-center">
													<div class="container ">
														<div class="row">
															<H1>Caja 2</H1>
														</div>
														<div class="row text-danger"
															style="height: 189px; background: #000; size: 80%;">
															<h1 style="font-size: 950%;"><%=turno2 %></h1>
														</div>
														<div class="row">
															<h2>Turno</h2>
														</div>
													</div>
												</div>
												<div class="col-2 ventana text-center">
													<div class="container ">
														<div class="row">
															<H1>Caja 3</H1>
														</div>
														<div class="row text-danger"
															style="height: 189px; background: #000; size: 80%;">
															<h1 style="font-size: 950%;"><%=turno3 %></h1>
														</div>
														<div class="row">
															<h2>Turno</h2>
														</div>
													</div>
												</div>
											</div>
										</div>
	
	
	
									</div>
								</div>
								<div class="row">
									<div class="col bg-secondary ">
										<div class="container">
											<!-- Controladores de las cajas -->
											<div class="row m-2">
												<div class="col-2 ventana text-center p-1">
													<div class="container p-0">
														<!-- Btn Caja 1 -->
														<div class="row"
															style="border-bottom: 1px solid; margin: 0;">
															<a href="tablahorarios?accion=turnomas1"><H1
																	class="btn bi-caret-up-fill"></H1></a>
														</div>
														<div class="row">
															<a href="tablahorarios?accion=turnomenos1"><H1
																	class="btn bi-caret-down-fill"></H1></a>
														</div>
													</div>
												</div>
												<div class="col-2 ventana text-center p-1">
													<div class="container p-0">
														<!-- Btn Caja 2 -->
														<div class="row"
															style="border-bottom: 1px solid; margin: 0;">
															<a href="tablahorarios?accion=turnomas2"><H1
																	class="btn bi-caret-up-fill"></H1></a>
														</div>
														<div class="row">
															<a href="tablahorarios?accion=turnomenos2"><H1
																	class="btn bi-caret-down-fill"></H1></a>
														</div>
													</div>
												</div>
												<div class="col-2 ventana text-center p-1">
													<div class="container p-0">
														<!-- Btn Caja 3 -->
														<div class="row"
															style="border-bottom: 1px solid; margin: 0;">
															<a href="tablahorarios?accion=turnomas3"><H1
																	class="btn bi-caret-up-fill"></H1></a>
														</div>
														<div class="row">
															<a href="tablahorarios?accion=turnomenos3"><H1
																	class="btn bi-caret-down-fill"></H1></a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
	
	
				</div>
	           	
	            
	      
    </div>




    <script src="js/bootstrap.min.js"></script>
</body>
</html>