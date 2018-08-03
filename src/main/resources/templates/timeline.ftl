<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Timeline</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/timeline.css" type="text/css">
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
    <link rel="stylesheet" href="css/buttons.css" type="text/css">
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


<div id="content">
    <h1>Timeline</h1>
    <ul class="timeline">

        <#if albumes?size &gt; 0>
        <#list albumes as album>
        <li class="event" data-date="${album.tiempo}">
            <h3>${album.creador.nombre} ${album.creador.apellidos} Creo el album:</h3>
          <div class="card-post">
              <div class="row">
                  <div class="col-xs-3 col-sm-2">
                      <a href="/perfil?user=${usuario.username}" title="Profile">
                          <img src="img/user.jpg" alt="User name" class="img-circle img-user">
                      </a>
                  </div>
                  <div class="col-xs-9 col-sm-10 info-user">

                      <form name="submitForm" method="get" action="/perfil">
                          <strong><a href="/perfil?user=${album.creador.username}">${album.creador.nombre} ${album.creador.apellidos}</a></strong>
                      </form>
                      <p><i>${album.tiempo}</i></p>
                  </div>
              </div>
              <div class="row">
                  <div class="col-sm-8 col-sm-offset-2 data-post">
                      <p>${album.descripcion}</p>
                      <br>
                      <div id="myCarousel${album_index}" class="carousel slide" data-interval="false">
                          <div class="carousel-inner">
                              <#assign activo = 0>
                              <#list albumPosts as post>
                              <#if album.id == post.album.id>
                              <#if activo == 0>
                              <div class="item active">
                                  <a href="/home?single=${post.id}&view=1"><img src="subidas/${post.imagenPath}" class="img-thumbnail"></a>
                              </div>
                              <#assign activo = activo + 1>
                              <#else>
                              <div class="item">
                                  <a href="/home?single=${post.id}&view=1"><img src="subidas/${post.imagenPath}" class="img-thumbnail"></a>
                              </div>
                              </#if>

                              </#if>
                              </#list>

                          </div>
                          <a class="left carousel-control" href="#myCarousel${album_index}" data-slide="prev" >
                              <span class="fa fa-angle-left" aria-hidden="true"></span>
                              <span class="sr-only">Previous</span>
                          </a>
                          <a class="right carousel-control" href="#myCarousel${album_index}" data-slide="next">
                              <span class="fa fa-angle-right" aria-hidden="true"></span>
                              <span class="sr-only">Next</span>
                          </a>

                      </div>
                  </div>
              </div>
          </div>
        </li>
        </#list>
        </#if>

        <#if muro?size &gt; 0>
        <#list muro as eventos>
        <li class="event" data-date="${eventos.tiempo}">
            <h3>${eventos.usuario.nombre} ${eventos.usuario.apellidos} posteo:</h3>
            <div class="card-post">
                <div class="row">
                    <div class="col-xs-3 col-sm-2">
                        <a href="/perfil?user=${eventos.usuario.username}" title="Profile">
                            <img src="img/user.jpg" alt="User name" class="img-circle img-user">
                        </a>
                    </div>
                    <div class="col-xs-9 col-sm-10 info-user">

                        <form name="submitForm" method="get" action="/perfil">
                            <strong><a href="/perfil?user=${eventos.usuario.username}">  ${eventos.usuario.nombre} ${eventos.usuario.apellidos}</a></strong>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 data-post">
                        <p>${eventos.texto}</p>
                    </div>
                </div>
            </div>
        </li>

        <#if comentarios??>
        <#list comentarios as comments>
        <#if comments.post.id == eventos.id>
        <li class="event" data-date="${comments.tiempo}">
            <h3>${comments.autor.nombre} ${comments.autor.apellidos} comento:</h3>
            <h2>${comments.comentario}</h2> en
            <div class="card-post">
                <div class="row">
                    <div class="col-xs-3 col-sm-2">
                        <a href="/perfil?user=${eventos.usuario.username}" title="Profile">
                            <img src="img/user.jpg" alt="User name" class="img-circle img-user">
                        </a>
                    </div>
                    <div class="col-xs-9 col-sm-10 info-user">

                        <form name="submitForm" method="get" action="/perfil">
                            <strong><a href="/perfil?user=${eventos.usuario.username}">  ${eventos.usuario.nombre} ${eventos.usuario.apellidos}</a></strong>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 data-post">
                        <p>${eventos.texto}</p>
                    </div>
                </div>
            </div>
        </li>
</li>
        </#if>
        </#list>
        </#if>


        <#if reacciones??>
        <#list reacciones as reaccion>
        <#if reaccion.post??>
        <#if reaccion.post.id == eventos.id>
        <li class="event" data-date="${reaccion.tiempo}">
            <h3>${reaccion.usuario.nombre} ${reaccion.usuario.apellidos} reacciono:</h3>
    <#if reaccion.reaccion == true>
    <h2>Le gusto</h2>
    <#else>
    <h2>No le gusto</h2>
    </#if>
        </#if>
            :
            <div class="card-post">
                <div class="row">
                    <div class="col-xs-3 col-sm-2">
                        <a href="/perfil?user=${eventos.usuario.username}" title="Profile">
                            <img src="img/user.jpg" alt="User name" class="img-circle img-user">
                        </a>
                    </div>
                    <div class="col-xs-9 col-sm-10 info-user">

                        <form name="submitForm" method="get" action="/perfil">
                            <strong><a href="/perfil?user=${eventos.usuario.username}">  ${eventos.usuario.nombre} ${eventos.usuario.apellidos}</a></strong>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 data-post">
                        <p>${eventos.texto}</p>
                    </div>
                </div>
            </div>
        </li>
</li>

        </#if>
        </#list>
        </#if>

        </#list>
    </ul>
<#else>
        <h1>No ha pasado nada</h1>
        </#if>

</div>
</html>