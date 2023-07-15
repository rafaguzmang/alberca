<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap.min.css"> 
    <link rel="stylesheet" href="css/dataStyle.css">  
    
    <title>Turno</title>
</head>


<body>

	<%
		int turno = 0; 
		if(request.getSession().getAttribute("turnoval") != null){
			turno = (int) request.getSession().getAttribute("turnoval");
		}
	
	%>

    <div class="wrap">
        <form>
            <div class="form-header">
                <h2>Turno</h2>
            </div>
            <div class="form-body">
            <fieldset >
                <legend ><i class="fa fa-user " ></i>
                    
                    <h1 class=" badge bg-secondary text-center" style="font-size: 70px;"><%=turno %></h1>
                    
                </legend>
               
            </fieldset>
            
            
        </div>
            <div class="form-footer d-flex justify-content-between">
               
            </div>
            </div>
           
    </div>
</body>
</html>