//Para seleccionar seccion y vemecs en caso de querer cambiarlos
function showDiv(hiddenItem, element)
{
    if(element.value !== null && element.value !== "null") {
        let html = "";
        if(hiddenItem === "id_vemec") {
            html = '<option selected value="null">Seleccione un VeMec</option>';
            arrayVeMecs.forEach(vemec => {
                if(vemec.id_slave === element.value) {
                    html+='<option value="'+vemec.id+'">'+vemec.Modelo+' - '+vemec.Ubicacion+'</option>';
                }
            });
        }
        if(hiddenItem === "select_slave") {
            html = '<option selected value="null">Seleccione una seccion</option>';
            arraySlaves.forEach(slave => {
                html+='<option value="'+slave.id+'">'+slave.Nombre+'</option>';
            });
        }
        document.getElementById(hiddenItem).innerHTML = html;
    }

    document.getElementById(hiddenItem).style.display = element.value === "null" ? 'none' : 'block';
}
