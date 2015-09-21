function vibrar() {
  console.log("vibrando por 5 segundos");
  window.navigator.vibrate(5000);
}

function mostrarAlerta() {
  console.log("mostrando dialogo");
  window.alert("Texto de prueba");
}

function mostrarConfirmacion() {
  console.log("mostrando dialogo");
  var respuesta = window.confirm("Probando");

  if (respuesta == true) {
    labelRespuesta.innerHTML = "Confirmación: se presionó 'OK'";
    console.log("Confirmación: se presionó 'OK'");
    createNotification("Confirmación", "se presionó 'OK'");
  } else {
    labelRespuesta.innerHTML = "Confirmación: se presionó 'Cancel'";
    console.log("Confirmación: se presionó 'Cancel'");
    createNotification("Confirmación", "se presionó 'Cancel'");
  }
}

function mostrarPrompt() {
  var nombre = prompt("Ingrese su nombre", "");
  if (nombre != null) {
    labelRespuesta.innerHTML = "Prompt: ingresó " + nombre;
    console.log("Prompt: ingresó " + nombre);
    createNotification("Prompt", "ingresó " + nombre);
  } else {
    labelRespuesta.innerHTML = "Prompt: canceló la operación";
    console.log("Prompt: canceló la operación");
    createNotification("Prompt", "canceló la operación");
  }
}

var btnAlerta = document.getElementById('alert-btn');
var btnConfirmar = document.getElementById('confirm-btn');
var btnPrompt = document.getElementById('prompt-btn');
var btnVibrar = document.getElementById('vibrate-btn');

var labelRespuesta = document.getElementById('respuesta-dialogo');

btnAlerta.addEventListener('click', mostrarAlerta);
btnConfirmar.addEventListener('click', mostrarConfirmacion);
btnPrompt.addEventListener('click', mostrarPrompt);
btnVibrar.addEventListener('click', vibrar);
