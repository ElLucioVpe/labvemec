<%-- 
    Document   : registrosVeMec
    Created on : 05/04/2020, 11:29:00 PM
    Author     : esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registros del VeMec</title>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card">
                <div class="card-header text-center">
                    Registros del VeMec
                </div>
                <div class="card-body bg-secondary">
                    <table class="table table-hover">
                        <thead>
                            <th>ID</th>
                            <th>Presión Maxima</th>
                            <th>Presión Minima</th>
                            <th>Gás</th>
                            <th>Frecuencia</th>
                            <th>Mezcla</th>
                            <th>Humedad</th>
                            <th>Temperatura Entrada</th>
                            <th>Temperatura Salida</th>
                            <th>Presión Entrada</th>
                            <th>Presión Salida</th>
                            <th>Timestamp</th>
                        </thead>
                        <tbody>
                            <c:forEach var="registro" items="${lista}">
                                <tr>
                                    <td>${registro.Id}</td>
                                    <td>${registro.Presion_Maxima}</td>
                                    <td>${registro.Presion_Minima}</td>
                                    <td>${registro.Gas}</td>
                                    <td>${registro.Frecuencia}</td>
                                    <td>${registro.Humedad}</td>
                                    <td>${registro.Temperatura_Entrada}</td>
                                    <td>${registro.Temperatura_Salida}</td>
                                    <td>${registro.Presion_Entrada}</td>
                                    <td>${registro.Presion_Salida}</td>
                                    <td>${registro.Timestamp}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </body>
</html>
