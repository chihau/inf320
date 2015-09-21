// Chequea que el navegador soporta apps de mozilla
if(navigator.mozApps) {

  // Define la url donde se encuentra el manifest
  var url = location.href;
  var manifest_url = url.substring(0, url.lastIndexOf("/") + 1) + 'manifest.webapp';
  console.log('manifest_url = ' + manifest_url);

  function install(ev) {
    ev.preventDefault();
    // instala la app
    var installLocFind = navigator.mozApps.install(manifest_url);
    installLocFind.onsuccess = function(data) {
      // Si la app fue instalada se puede mostrar un mensaje
    };
    installLocFind.onerror = function() {
      // Si la app no pudo ser instalada se muestra una alerta
      alert(installLocFind.error.name);
    };
  };

  var button = document.getElementById('install-btn');

  // Si está ya instalada entonces ocultamos el botón de instalar
  var installCheck = navigator.mozApps.checkInstalled(manifest_url);
  installCheck.onsuccess = function() {
    if(installCheck.result) {
      button.style.display = "none";
    } else {
      button.addEventListener('click', install, false);
    };
  };

} else {
  button.style.display = "none";
}
