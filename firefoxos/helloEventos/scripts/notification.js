function createNotification(title, message) {
  // Chequea si el navegador soporta notificaciones
  if (!("Notification" in window)) {
    console.log("This browser does not support notifications.");
  }
  // Chequeamos si se tienen los permisos para desplegar notificaciones
  else if (Notification.permission === "granted") {
    // mostramos la notificación
    var notification = new Notification(title, { body: message });
    // podemos hacer que el dispositivo vibre medio segundo
    window.navigator.vibrate(500);
  }
  // De otra forma, tenemos que pedir permiso
  else if (Notification.permission !== 'denied') {
    Notification.requestPermission(function (permission) {
      if(!('permission' in Notification)) {
        Notification.permission = permission;
      }

      if (permission === "granted") {
        // mostramos la notificación
        var notification = new Notification(title, { body: message });
        // podemos hacer que el dispositivo vibre medio segundo
        window.navigator.vibrate(500);
      }
    });
  }
}
