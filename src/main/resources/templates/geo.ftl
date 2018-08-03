<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Social Map</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
    <link rel="stylesheet" href="css/bootstrap-switch.min.css">
    <script src="js/bootstrap-switch.min.js"></script>
    <script src="js/twemoji.min.js"></script>
    <script src="js/lazy-load.min.js"></script>
    <script src="js/socialyte.min.js"></script>
    <script src="js/tagFill.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Poppins:300,400,600,700" rel="stylesheet'>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/buttons.css" type="text/css">
    <style>
        /* Set the size of the div element that contains the map */
        #map {
            height: 400px;  /* The height is 400 pixels */
            width: 100%;  /* The width is the width of the web page */
        }
    </style>
</head>
<header class="text-right">
    <form action="/buscarPersonas" class="text-left search" method="GET">
        <input name="q" type="text" placeholder="Search..">
        <input type="hidden" name="pagina" value="1">
    </form>
    <div class="menu-icon">
        <div class="dropdown">
                <span class="dropdown-toggle" role="button" id="dropdownSettings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  <span class="hidden-xs hidden-sm">Settings</span> <i class="fa fa-cogs" aria-hidden="true"></i>
                </span>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownSettings">
                <li>
                    <a href="#" title="Settings" data-toggle="modal" data-target="#settingsFormModal">
                        <div class="col-xs-4">
                            <i class="fa fa-wrench" aria-hidden="true"></i>
                        </div>
                        <div class="col-xs-8 text-left">
                            <span>Settings</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="" title="Settings">
                        <div class="col-xs-4">
                            <i class="fa fa-question" aria-hidden="true"></i>
                        </div>
                        <div class="col-xs-8 text-left">
                            <span>FAQ</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/logout" title="Settings">
                        <div class="col-xs-4">
                            <i class="fa fa-sign-out-alt" aria-hidden="true"></i>
                        </div>
                        <div class="col-xs-8 text-left">
                            <span>Logout</span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="second-icon dropdown menu-icon">
            <span class="dropdown-toggle" role="button" id="dropdownNotification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        <span class="hidden-xs hidden-sm">Notifications</span> <i class="fa fa-bell" aria-hidden="true"></i> <span class="badge">2</span>
            </span>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownNotification">
            <li class="new-not">
                <a href="https://socialyte.codeplus.it/wall.html#" title="User name comment"><img src="img/user2.jpg" alt="User name" class="img-circle img-user-mini"> User comments your post</a>
            </li>
            <li class="new-not">
                <a href="https://socialyte.codeplus.it/wall.html#" title="User name comment"><img src="img/user3.jpg" alt="User name" class="img-circle img-user-mini"> User comments your post</a>
            </li>
            <li>
                <a href="https://socialyte.codeplus.it/wall.html#" title="User name comment"><img src="img/user4.jpg" alt="User name" class="img-circle img-user-mini"> User comments your post</a>
            </li>
            <li role="separator" class="divider"></li>
            <li><a href="https://socialyte.codeplus.it/wall.html#" title="All notifications">All Notifications</a></li>
        </ul>
    </div>
    <div class="second-icon menu-icon">
            <span><a href="/sugerirAmigos?pagina=1" title="Sugerencia"><span class="hidden-xs hidden-sm">Sugerir Amigos</span> <i class="fas fa-user-plus" aria-hidden="true"></i></a>
            </span>
    </div>
    <div class="second-icon menu-icon">
            <span><a href="/geo" title="Geolocalizacion"><span class="hidden-xs hidden-sm">Mapa</span> <i class="fa fa-map" aria-hidden="true"></i></a>
            </span>
    </div>
    <div class="second-icon menu-icon">
            <span><a href="/timeline" title="Timeline"><span class="hidden-xs hidden-sm">Timeline</span> <i class="fa fa-clock-o" aria-hidden="true"></i></a>
            </span>
    </div>
    <div class="second-icon menu-icon">
        <form>
            <span><a href="/home" title="Home"><span class="hidden-xs hidden-sm">Home</span> <i aria-hidden="true"></i></a>
            </span>
        </form>

    </div>
</header>

<body>
<h1>Usuarios cerca de mi</h1>

<form action="/geoPost" method="post">
    <input type="hidden" value="" id="lat" name="latitud">
    <input type="hidden" value="" id="lon" name="longitud">
    <button type="submit" class="btn-danger">Compartir Localizacion</button>
</form>


<div id="map" class="z-depth-1" style="height: 600px"></div>

<script src="js/jquery-3.2.1.min.js"></script>

<script>
    // Initialize and add the map
    function initMap(latitud,logitud) {
        // The location of Uluru
        var i = 0;
        <#if coordenadas??>
        for(i; i<${coordenadas?size}, i++){
            <#list coordenadas as co>
             var uluru = {lat: ${co.latitud}, lng: ${co.logitud}};
            // The map, centered at Uluru
            var map = new google.maps.Map(
                    document.getElementById('map'), {zoom: 15, center: uluru});
            // The marker, positioned at Uluru
            var marker = new google.maps.Marker({position: uluru, map: map});
            </#list>

        }
        <#else>
        var uluru = {lat: latitud, lng: logitud};
            // The map, centered at Uluru
            var map = new google.maps.Map(
                    document.getElementById('map'), {zoom: 15, center: uluru});
            // The marker, positioned at Uluru
            var marker = new google.maps.Marker({position: uluru, map: map});
}
        </#if>


</script>
<!--Load the API from the specified URL
* The async attribute allows the browser to render the page while the API loads
* The key parameter will contain your own API key (which is not needed for this tutorial)
* The callback parameter executes the initMap() function
-->
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_dBRkreJdC4jm80OJW6eR_rSFFQcArLI&callback=initMap">
</script>
<script>
    var id, cantidad = 0;
    //Indica las opciones para llamar al GPS.
    var opcionesGPS = {
        enableHighAccuracy: false,
        timeout: 5000,
        maximumAge: 0
    }

    $(document).ready(function(){
        console.log("Ejemplo de Geolocalizacion");

        //Obteniendo la referencia directa.
        navigator.geolocation.getCurrentPosition(function(geodata){
            var coordenadas = geodata.coords;

            document.getElementById('lat').value = coordenadas.latitude;
            document.getElementById('lon').value = coordenadas.longitude;

            $("#posicionGps").text("Latitud: "+coordenadas.latitude+", Longitud: "+coordenadas.longitude+", Precisión: "+coordenadas.accuracy+" metros");
            initMap(coordenadas.latitude,coordenadas.longitude);
        }, function(){
            $("#posicionGps").text("No permite el acceso del API GEO");
        }, opcionesGPS);

    });
</script>

</body>
</html>