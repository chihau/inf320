// No en todos los navegadores la API se llama de la misma forma
var battery = navigator.battery || navigator.mozBattery || navigator.webkitBattery;
var indicator, indicatorPercentage;

if(battery) {
  indicator = document.getElementById('cargando-bateria'),
  indicatorPercentage = document.getElementById('porcentaje-bateria');

  // Seteamos los listeners para detectar cuando hay un cambio en el estado de la batería
  battery.addEventListener('chargingchange', updateBattery);
  battery.addEventListener('levelchange', updateBattery);

  // Actualizamos el estado de la batería en pantalla
  updateBattery();
}

function updateBattery() {
  console.log('Estado de la batería');
  var level = (battery.level * 100) + '%';

  if (level === '100%') {
    createNotification("Batería", "La carga de la batería se ha completado");
  }

  console.log('Porcentaje de carga: ' + level);
  indicatorPercentage.innerHTML = 'Porcentaje de carga: ' + level;
  indicator.innerHTML = battery.charging ? 'Estado: cargando' : 'Estado: descargando';
  console.log(battery.charging ? 'Estado: cargando' : 'Estado: descargando');
}
