<%-- 
    Document   : registrosVeMec
    Created on : 05/04/2020, 11:29:00 PM
    Author     : esteban
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registros del VeMec</title>
    </head>
    
    <style>
        body, thead, tfoot {
            background-color: #15bef1;
        }
        
        .card-header {
            background-color: #15bef1;
            font-weight: 600;
        }
    </style>
    
    <body>
        
        <div class="container mt-4">
            <div class="card">
                <div class="card-header text-center">
                    Registros del VeMec
                </div>
                <div class="card-body bg-light">
                    <table id="tabla-registros" class="table table-striped table-bordered table-sm" style="width:100%">
                        <thead>
                            <th class="th-sm">ID</th>
                            <th class="th-sm">Presión Maxima</th>
                            <th class="th-sm">Presión Minima</th>
                            <th class="th-sm">Gás</th>
                            <th class="th-sm">Frecuencia</th>
                            <th class="th-sm">Mezcla</th>
                            <th class="th-sm">Humedad</th>
                            <th class="th-sm">Temperatura Entrada</th>
                            <th class="th-sm">Temperatura Salida</th>
                            <th class="th-sm">Presión Entrada</th>
                            <th class="th-sm">Presión Salida</th>
                            <th class="th-sm">Timestamp</th>
                        </thead>
                        <tbody>
                            <c:forEach var="registro" items="${lista}">
                                <tr>
                                    <td>${registro.Id_Data}</td>
                                    <td>${registro.Presion_Maxima}</td>
                                    <td>${registro.Presion_Minima}</td>
                                    <td>${registro.Gas}</td>
                                    <td>${registro.Frecuencia}</td>
                                    <td>${registro.Mezcla}</td>
                                    <td>${registro.Humedad}</td>
                                    <td>${registro.Temperatura_Entrada}</td>
                                    <td>${registro.Temperatura_Salida}</td>
                                    <td>${registro.Presion_Entrada}</td>
                                    <td>${registro.Presion_Salida}</td>
                                    <td>${registro.Timestamp_Data}</td>
                                </tr>
                            </c:forEach>
                                
                        </tbody>
                        <tfoot>
                            <th class="th-sm">ID</th>
                            <th class="th-sm">Presión Maxima</th>
                            <th class="th-sm">Presión Minima</th>
                            <th class="th-sm">Gás</th>
                            <th class="th-sm">Frecuencia</th>
                            <th class="th-sm">Mezcla</th>
                            <th class="th-sm">Humedad</th>
                            <th class="th-sm">Temperatura Entrada</th>
                            <th class="th-sm">Temperatura Salida</th>
                            <th class="th-sm">Presión Entrada</th>
                            <th class="th-sm">Presión Salida</th>
                            <th class="th-sm">Timestamp</th>
                        </tfoot>
                    </table>
                    <a href="index.htm" class="btn btn-secondary" style="color: #15bef1">
                        <i class="fas fa-chevron-left"></i> 
                        Regresar
                    </a>
                    
                    <script>
                        $(document).ready(function () {
                            $('#tabla-registros').DataTable();
                        });
                    </script>
                </div>
            </div>
            
        </div>
    </body>
</html>
