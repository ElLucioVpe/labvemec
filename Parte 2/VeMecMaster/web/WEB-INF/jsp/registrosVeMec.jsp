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
        <!-- js externos -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
        
        <!-- css -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
        <link rel="stylesheet" href="<c:url value="/resources/css/forms.css" />">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registros del VeMec</title>
    </head>
    <script>
        $(document).ready(function () {
            $('#tabla-registros').DataTable();
        });
    </script>
    <body>
        <div id="wrapper">
            <div id="content-wrapper" class="d-flex flex-column">
                <jsp:include page="../components/header.jsp"></jsp:include>
                <div id="content">
                    <div class="container-fluid">
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
                                        <th class="th-sm">Pulsaciones</th>
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
                                                <td>${registro.Pulsaciones}</td>
                                                <td>${registro.Timestamp_Data}</td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                    <tfoot>
                                        <th class="th-sm">ID</th>
                                        <th class="th-sm">mmHg</th>
                                        <th class="th-sm">mmHg</th>
                                        <th class="th-sm">cc</th>
                                        <th class="th-sm">veces/min</th>
                                        <th class="th-sm">%</th>
                                        <th class="th-sm">%</th>
                                        <th class="th-sm">ºC</th>
                                        <th class="th-sm">ºC</th>
                                        <th class="th-sm">mmHg</th>
                                        <th class="th-sm">mmHg</th>
                                        <th class="th-sm">/min</th>
                                        <th class="th-sm">Timestamp</th>
                                    </tfoot>
                                </table>
                                <a href="./" class="btn btn-secondary" style="color: #15bef1">
                                    <i class="fas fa-chevron-left"></i> 
                                    Regresar
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
