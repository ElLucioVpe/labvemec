<%-- 
    Document   : index
    Created on : 07-jul-2020, 21:41:51
    Author     : Esteban
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>VeMecMaster - Principal</title>

  <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
</head>

<body>
  <div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
      <jsp:include page="../components/header.jsp"></jsp:include>
      <div id="content">
        <div class="container-fluid">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Pagina Principal</h1>
          </div>

          <!-- Menu botones -->
          <div class="row">
              
            <!-- Secciones -->
            <div class="col-xl-3 col-md-6 mb-4">
              <a href="secciones">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">Secciones</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-list-alt fa-2x text-gray-300" style="color: #007bff"></i>
                    </div>
                  </div>
                </div>
              </div>
              </a>
            </div>

            <!-- Pacientes -->
            <div class="col-xl-3 col-md-6 mb-4">
              <a href="pacientes">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">Pacientes</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-user fa-2x text-gray-300" style="color: #007bff"></i>
                    </div>
                  </div>
                </div>
              </div>
              </a>
            </div>

            <!-- VeMecs -->
            <div class="col-xl-3 col-md-6 mb-4">
              <a href="vemecs">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-dark text-uppercase mb-1">VeMecs</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-wind fa-2x text-gray-300" style="color: #007bff"></i>
                    </div>
                  </div>
                </div>
              </div>
              </a>
            </div>
          </div>

          <!-- Fin Menu botones -->
        </div>
        <!-- /.container-fluid -->

      </div>
      
      <jsp:include page="../components/footer.jsp"></jsp:include>

    </div>
  </div>
</body>

</html>
