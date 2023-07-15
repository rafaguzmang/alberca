<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css"> 
    <link rel="stylesheet" href="css/dataStyle.css">   
    <title>Datos de Prospecto</title>
</head>


<body>

    <div class="wrap">
        <form action="prospectos?accion=turno" method="post">
            <div class="form-header">
                <h2>Registro</h2>
            </div>
            <div class="form-body">
            <fieldset>
                <legend><i class="fa fa-user"></i> Información</legend>
                <div class="container p-0">
                    <div class="row">
                        <div class="col-4">
                            <label for="fname">Nombre</label>
                            <input type="text" id="fname" name="fname" value="" required>
                        </div>
                        <div class="col-4">
                            <label for="lname">Apellido Paterno</label>
                            <input type="text" id="lname" name="lname" value="">
                        </div>
                        <div class="col-4">
                            <label for="l2name">Apellido Materno</label>
                            <input type="text" id="l2name" name="l2name" value="">
                        </div>
                    </div>
                   
                   
                </div>
                
                
                <label for="address">Direccion</label>
                <input type="text" id="address" name="address" value="" required>
                <label for="city">Lugar de nacimiento</label>
                <input type="text" id="city" name="city" value="" required>

                <div class="container p-0">
                    <div class="row">
                        <div class="col-3">
                            <label for="horario">Horario</label>
                                <select id="horario" name="horario" required>   
                                	<option value=""></option>                                 
                                    <option value="3:00 - 4:00">3:00 - 4:00</option>
                                    <option value="4:00 - 5:00">4:00 - 5:00</option>
                                    <option value="5:00 - 6:00">5:00 - 6:00</option>
                                    <option value="6:00 - 7:00">6:00 - 7:00</option>
                                </select>
                        </div>

                        <div class="col-4">
                            <label for="nivel">Nivel</label>
                                <select id="nivel" name="nivel" required>
                                    <option value=""></option>
                                    <option value="Principiantes">Principiantes</option>
                                    <option value="Intermedio">Intermedio</option>
                                    <option value="Avanzado">Avanzado</option>
                                </select>
                        </div>
                        
                        <div class="col-2">
                            <label for="eda">Edad</label>
                             <input type="number" id="eda" name="eda" value="" required>
                        </div>
                        <div class="col-3">
                            <label for="phone">Telefono</label>
                             <input type="number" id="phone" name="phone" min="1000000000" max="9999999999" value="" required>
                        </div>
                    </div>                   
                </div>
            </fieldset>
            
            
        </div>
            <div class="form-footer d-flex justify-content-between">
                <input class="btn btn-success" type="submit" value="Agregar">
            </div>
            </div>
           
    </div>
    <link rel="stylesheet" href="js/bootstrap.min.js">
</body>
</html>