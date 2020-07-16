<%-- 
    Document   : modals
    Created on : 13-jul-2020, 19:50:01
    Author     : Esteban
--%>
<!-- Modal Accion Medica -->
<div class="modal fade" id="accionMedicaModal" tabindex="-1" role="dialog" aria-labelledby="accionMedicaModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="accionMedicaModalLabel">Accion Medica</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">×</span>
        </button>
      </div>
        <div id="modal_AM_body" class="modal-body">
            <form id="accionMedicaForm" method="post">
              <input id="form_idPaciente" name="id_paciente" type="hidden" value=""/>
              <label for="nivel_riesgo">Nivel de Riesgo:</label>
              <select name="nivel_riesgo" id="form_nivel_riesgo" class="form-control">
                  <option value="Bajo">Bajo</option>
                  <option value="Medio">Medio</option>
                  <option value="Alto">Alto</option>
                  <option value="Grave">Grave</option>
                  <option value="Muy Grave">Muy Grave</option>
              </select>
              <label for="medicacion">Recetar Medicacion:</label>
              <textarea type="text" id="form_medicacion" name="medicacion" class="form-control"></textarea>
              <label for="descripcion">Descripcion:</label>
              <textarea type="text" id="form_descripcion" name="descripcion" class="form-control"></textarea>
              <label for="selectVemec">Cambiar Seccion o VeMec?:</label>
              <select name="selectVemec" id="selectVemec" class="form-control mb-1" onchange="showDiv('select_slave', this)">
                  <option selected value="null">No</option>
                  <option value="1">Si</option>
              </select>
              <!-- Oculto -->
              <select name="select_slave" id="select_slave" class="form-control mb-1" onchange="showDiv('id_vemec', this)">
                  <option selected value="null">Seleccione una seccion</option>
                  <c:forEach var="slave" items="${slaves}">
                      <option value="${slave.id}">${slave.Nombre}</option>
                  </c:forEach>
              </select>
              <select name="id_vemec" id="id_vemec" class="form-control mb-1">
                  <option selected value="null">Seleccione un VeMec</option>
                  <c:forEach var="vemec" items="${vemecs_libres}">
                      <c:if test="${vemec.id_slave} == id_slave">
                          <option value="${vemec.id}">${vemec.Modelo} - ${vemec.Ubicacion}</option>
                      </c:if>
                  </c:forEach>
              </select>
              <!-- -->
              <label for="alta">Dar de alta:</label>
              <select name="alta" id="form_alta" class="form-control mb-1">
                  <option selected value="false">No</option>
                  <option value="true">Si</option>
              </select>
              <label for="defuncion">Registrar defuncion:</label>
              <select name="defuncion" id="form_defuncion" class="form-control mb-1">
                  <option selected value="false">No</option>
                  <option value="true">Si</option>
              </select>
              <label for="medico_tratante">Medico tratante:</label>
              <input type="text" name="medico_tratante" id="form_medico_tratante" class="form-control">
              <div class="text-center">
                  <button class="btn btn-secondary text-white mt-1" type="button" onclick="altaAccionMedica()" data-dismiss="modal">
                      Enviar
                  </button>
              </div>
            </form>
        </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Datos de Paciente -->
<div class="modal fade" id="pacienteModal" tabindex="-1" role="dialog" aria-labelledby="pacienteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pacienteModalModalLabel">
            Paciente
            <a id="modal_modificarPac" href="" class="btn btn-sm-primary">
                <i class="fas fa-edit"></i> 
            </a>
        </h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">×</span>
        </button>
      </div>
        <div class="modal-body">
            <div class="form-inline">
                <h6><strong>CI:</strong>&nbsp;</h6>
                <h6 id="modal_ci"></h6>
            </div>
            <div class="form-inline">
                <h6><strong>Nombre:</strong>&nbsp;</h6>
                <h6 id="modal_nombre"></h6>
            </div>
            <div class="form-inline">
                <h6><strong>Sexo:</strong>&nbsp;</h6>
                <h6 id="modal_sexo"></h6>
            </div>
            <div class="form-inline">
                <h6><strong>Edad:</strong>&nbsp;</h6>
                <h6 id="modal_edad"></h6>
            </div>
            <div class="form-inline">
                <h6><strong>Nacionalidad:</strong>&nbsp;</h6>
                <h6 id="modal_nacionalidad"></h6>
            </div>
            <div class="form-inline">
                <h6><strong>Lugar de Residencia:</strong>&nbsp;</h6>
                <h6 id="modal_residencia"></h6>
            </div>
            <div class="form-inline">
                <h6><strong>Direccion:</strong>&nbsp;</h6>
                <h6 id="modal_direccion"></h6>
            </div>
            <div class="form-inline">
                <h6><strong>Coordenadas:</strong>&nbsp;</h6>
                <h6 id="modal_xyz"></h6>
            </div>
            <div>
                <h6><strong>Antecedentes clinicos:</strong></h6>
                <textarea readonly id="modal_antecedentes" class="form-control"></textarea>
            </div>
            <div class="form-inline">
                <h6><strong>Nivel de riesgo: </strong>&nbsp;</h6>
                <h6 id="modal_riesgo"></h6>
            </div>
            <div>
                <h6><strong>Informacion de contacto:</strong></h6>
                <textarea readonly id="modal_contactos" class="form-control"></textarea>
            </div>
        </div>
      <div class="modal-footer">
          <button class="btn btn-secondary" data-target="#accionMedicaModal">
              Accion Medica
          </button>
          <button id="modal_pac_historial" class="btn btn-secondary" data-target="#historialMedicoModal">
              Historial Medico
          </button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Historial Medico -->
<div class="modal fade" id="historialMedicoModal" tabindex="-1" role="dialog" aria-labelledby="historialMedicoModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="historialMedicoModalLabel">Historial Medico</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
          <span aria-hidden="true">×</span>
        </button>
      </div>
        <div id="historialMedicoModalBody" class="modal-body">
          <div id="datosPDF" class="col">
              <h1 class="text-center shadow mx-auto">VeMecMaster</h1>
              <h3 class="text-center shadow mx-auto">Historial Medico</h3>
              <div id="datosPacientePDF">
                  <h5 class="text-center mx-auto">
                      <strong>Datos paciente</strong>
                  </h5>
                  
                  <strong>CI:</strong>&nbsp;<i id="pdf_ci"></i><br/>
                  <strong>Nombre:</strong>&nbsp;<i id="pdf_nombre"></i><br/>
                  <strong>Sexo:</strong>&nbsp;<i id="pdf_sexo"></i><br/>
                  <strong>Edad:</strong>&nbsp;<i id="pdf_edad"></i><br/>
                  <strong>Nacionalidad:</strong>&nbsp;<i id="pdf_nacionalidad"></i><br/>
                  <strong>Residencia:</strong>&nbsp;<i id="pdf_residencia"></i><br/>
                  <strong>Direccion:</strong>&nbsp;<i id="pdf_direccion"></i><br/>
                  <strong>Coordenadas:</strong>&nbsp;<i id="pdf_coordenadas"></i><br/>
                  <strong>Antecedentes clinicos:</strong>&nbsp;<i id="pdf_antecedentes"></i><br/>
                  <strong>Nivel de riesgo:</strong>&nbsp;<i id="pdf_riesgo"></i><br/>
                  <hr/>
              </div>
          </div>
          <div class="col text-center">
              <div id="historial-RespiracionChart" class="historial-chart">
              </div>
              <div id="historial-PulsacionesChart" class="historial-chart">
              </div>
          </div>
          <hr/>
          <div id="historialMedicoModalDatos">
              <!-- Template de ejemplo -->
              <h6>
                  <strong>Fecha y hora:</strong>&nbsp;
                  Descripcion<br/>
                  <!-- Si lo medican -->
                  <strong>Medicación:</strong>&nbsp; Medicacion<br/>
                  <!-- -->
                  <strong>Nivel de riesgo:</strong>&nbsp; Nivel de riesto<br/>
                  <!-- Si lo conectan a vemec -->
                  <strong>Conectado a Unidad:</strong>&nbsp; VeMec.ID<br/>
                  <strong>Localizada en:</strong> VeMec.Ubicacion<br/>
                  <!-- -->
                  <strong>Médico tratante:</strong>&nbsp; Medico<br/>
              </h6>
              <hr/>
          </div>
        </div>
      <div class="modal-footer">
          <button onclick="historialMedicoPDF()" class="d-none d-sm-inline-block btn btn btn-primary shadow"><i class="fas fa-download fa-sm text-white-50"></i>
              Generar historial en pdf
          </button>
          <button class="btn btn-secondary" data-dismiss="modal">
              Cerrar
          </button>
      </div>
    </div>
  </div>
</div>

<!-- Modal de confirmacion -->
<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="dataConfirmLabel">Por favor confirme su accion</h3>
    </div>
    <div class="modal-body">
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">Cancelar</button>
        <a class="btn btn-primary" id="dataConfirmOK">Confirmar</a>
    </div>
</div>
