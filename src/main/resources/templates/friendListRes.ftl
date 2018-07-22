<!DOCTYPE html>
<!-- saved from url=(0060)https://thunder-team.com/friend-finder/timeline-friends.html -->
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Resultados</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <link href='https://fonts.googleapis.com/css?family=Poppins:300,400,600,700" rel="stylesheet'>
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="This is social network html5 template available in themeforest......">
    <meta name="keywords" content="Social Network, Social Media, Make Friends, Newsfeed, Profile Page">
    <meta name="robots" content="index, follow">
    <title>My Friends | Friend Finder Friend List</title>

    <!-- Stylesheets
    ================================================= -->
    <link rel="stylesheet" href="css/ionicons.min.css">

    <!--Google Font-->

    <!--Favicon-->
    <link rel="shortcut icon" type="image/png" href="https://thunder-team.com/friend-finder/images/fav.png">
</head>

<body id="wall">

<!--Header with Nav -->
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
                    <a href="https://socialyte.codeplus.it/settings.html" title="Settings" data-toggle="modal" data-target="#settingsmodal">
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
                            <i class="fa fa-sign-out" aria-hidden="true"></i>
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
            <span><a href="https://socialyte.codeplus.it/personal-profile.html" title="Profile"><span class="hidden-xs hidden-sm">Profile</span> <i class="fa fa-user" aria-hidden="true"></i></a>
            </span>
    </div>
    <div class="second-icon menu-icon">
            <span><a href="https://socialyte.codeplus.it/wall.html" title="Wall"><span class="hidden-xs hidden-sm">Wall</span> <i class="fa fa-database" aria-hidden="true"></i></a>
            </span>
    </div>
</header>

<!--Left Sidebar with info Profile -->
<div class="sidebar-nav">
    <a href="https://socialyte.codeplus.it/personal-profile.html" title="Profile">
        <img src="img/user.jpg" alt="User name" class="img-circle img-user">
    </a>
    <h2 class="text-center hidden-xs"><a href="https://socialyte.codeplus.it/personal-profile.html" title="Profile">${usuario.nombre} ${usuario.apellidos}</a></h2>
    <p class="text-center user-description hidden-xs">
    <ul>
    <#if usuario.lugarNacimiento??>
        <li>${usuario.nacimientoFecha}</li>
        <li>${usuario.lugarNacimiento}</li>
        <li>${usuario.lugarResidencia}</li>
        <li>${usuario.lugarTrabajo}</li>
        <li>${usuario.lugarEstudio}</li>
    </#if>
        <br>
        <h3 class="text-left" href="">Amigos</h3>
        <br>
        <h3 class="text-left" href="">Albumes</h3>

    </ul>
    </p>
</div>



<!-- Friend List ================================================= -->
<div CLASS="content-posts active">
           <#if resultados??>
           <#list resultados as res>

               <div class="container">

                  <#if usuario.amigos??>
                  <#list usuario.amigos as ami>
                     <#if ami.id == res.id>
                     <a class="text-success">Amigos</a>
                     </#if>
                     <#if ami.id != res.id || !ami.id??>
                      <form action="/agregarAmigo" method="post">
                          <input name="id" value="${res.id}" type="hidden" placeholder="Search..">
                          <button type="submit">Agregar Amigo</button>
                      </form>
                     </#if>

                  </#list>
                  </#if>

                   <h5><a href="https://thunder-team.com/friend-finder/timeline.html" >${res.nombre} ${res.apellidos}</a></h5>
                   <p>${res.lugarTrabajo}</p>
               </div>

           </#list>
           </#if>
</div>
</body>
<div class="page-footer font-small blue fixed-bottom">
    <ul class="pagination">
            <#if valorAnterior == 1>
					<li><a class="active" href="/buscarPersonas?pagina=${anterior}">&lt;&lt; Anterior</a></li>

            </#if>

            <#if valorSiguiente == 1>
                <li><a class="active" href="/inicio?pagina=${siguiente}">Siguiente &gt;&gt;</a></li>
            </#if>

    </ul>
</div>