<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.alberca.DAO.DatosDiciplinas" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Alberca UACH</title>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
   <body>
    
    <%	
    	ArrayList<DatosDiciplinas> list = new ArrayList<>();
    	if((ArrayList)request.getSession().getAttribute("datos")!= null){
    		list = (ArrayList)request.getSession().getAttribute("datos");
    	}
    	
    	int turno1 = (int)request.getSession().getAttribute("turno1");
		int turno2 = (int)request.getSession().getAttribute("turno2");
		int turno3 = (int)request.getSession().getAttribute("turno3");
    
    %>
       
        <div class="container-fluid main ">
            <header class="row py-3 justify-content-between align-content-center">
                <div class="col-6 avisos">
                
                	<div id="demo" class="carousel slide" data-bs-ride="carousel" >
                        <div class="carousel-inner p-1 d-flex align-items-center" style="height: 540px;">

                            <div class="carousel-item active">
                              <img src="assets/1.jpg" alt="1" class="img-fluid">
                            </div>
                            <div class="carousel-item">
                              <img src="assets/2.jpg" alt="2" class="img-fluid">
                            </div>
                            <div class="carousel-item">
                              <img src="assets/3.jpg" alt="3" class="img-fluid">
                            </div>
                            
                        </div>
                    </div>
                
                
                
                </div>
                <div class="col-5 datos py-4 d-flex">
                    <table class="table  ">
                        <thead>
                          <tr class="table-success">
                            <th>Diciplina</th>
                            <th>Horario</th>
                            <th>Nivel</th>
                            <th>Cupo</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        <%for(DatosDiciplinas i:list){ %>
                        
                          <tr class="table-<%=i.getColor() %> celda">
                            <td><%=i.getDiciplina() %></td>
                            <td><%=i.getHorario() %></td>
                            <td><%=i.getNivel() %></td>
                            <td><%=i.getCupo() %></td>
                          </tr>
                        <%} %>  
                        </tbody>
                      </table>

                </div>

            </header>
            <section class="row justify-content-between align-content-center">
                <div class="col-6 cajas d-flex justify-content-between">
                    <div class="container">
                        <div class="row m-2">
                            <div class="col-2 ventana text-center">
                                <div class="container ">
                                    <div class="row">
                                        <H1>Caja 1</H1>
                                    </div>
                                    <div class="row text-danger" style="height: 189px; background: #000; size: 80%;">
                                        <h1 style="font-size: 950%;"><%=turno1 %></h1>
                                    </div>
                                    <div class="row" >
                                        <h2>Turno</h2>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="col-2 ventana text-center"><div class="container ">
                                <div class="row">
                                    <H1>Caja 2</H1>
                                </div>
                                <div class="row text-danger" style="height: 189px; background: #000; size: 80%;">
                                    <h1 style="font-size: 950%;"><%=turno2 %></h1>
                                </div>
                                <div class="row" >
                                    <h2>Turno</h2>
                                </div>
                            </div></div>
                            <div class="col-2 ventana text-center"><div class="container ">
                                <div class="row">
                                    <H1>Caja 3</H1>
                                </div>
                                <div class="row text-danger" style="height: 189px; background: #000; size: 80%;">
                                    <h1 style="font-size: 950%;"><%=turno3 %></h1>
                                </div>
                                <div class="row" >
                                    <h2>Turno</h2>
                                </div>
                            </div></div>
                        </div>
                    </div>
                </div>
                <div class="col-6 otros">
                	<img src="assets/pasos.jpg " class="img-thumbnail img-fluid" alt="" style="height: 100%; width: 100%;">
                </div>
            </section>
        </div>
       
       
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
