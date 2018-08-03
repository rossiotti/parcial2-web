<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Perfil de ${usuario.nombre} ${usuario.apellidos}</title>
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

<!--Left Sidebar with info Profile -->
<div class="sidebar-nav">
    <a href="/perfil?user=${usuario.username}" title="Profile">
        <img src="img/user.jpg" alt="User name" class="img-circle img-user">
    </a>
    <h2 class="text-center hidden-xs"><a href="/perfil?user=${usuario.username}" title="Profile">${usuario.nombre} ${usuario.apellidos}</a></h2>
    <div class="card card-primary">
        <!-- /.card-header -->
        <br>
             <#if usuario.lugarNacimiento??>
            <div class="card-body">
                <strong><i class="fa fa-book mr-1"></i> Education</strong>

                 <p class="text-muted">
                     ${usuario.lugarEstudio}
                 </p>

                 <hr>

                 <strong><i class="fa fa-map-marker mr-1"></i> Location</strong>

                 <p class="text-muted">${usuario.lugarNacimiento}</p>

                 <hr>

                 <strong><i class="fa fa-briefcase"></i> Skills</strong>

                 <p class="text-muted">
                     ${usuario.lugarTrabajo}
                 </p>

                 <hr>

                 <strong><i class="fa fa-building"></i> Residence</strong>

                 <p class="text-muted">${usuario.lugarResidencia}</p>

                 <hr>
                 <strong><i class="fa fa-birthday-cake"></i> Born</strong>

                 <p class="text-muted">${usuario.nacimientoFecha}</p>
                 <hr>
                 <br>
             </#if>

    </div>
    </div>
    <div class="pull-left">
        <form name="submitForm" method="get" action="/listaAmigos">
            <input type="hidden" name="pagina" value="1">
            <button class="btn btn-primary" type="submit">Ver Amigos</button>
        </form>
    </div>
    <div class="pull-right">
        <button type="button" class="btn btn-primary">Albumes</button>
    </div>
</div>
<!-- /.card-body -->


<!-- Friend List ================================================= -->
<div CLASS="content-posts active">
           <#if resultados??>
           <#list resultados as res>


 <div class="row">
     <div class="shadow">
         <div class="col-sm-12">
             <div class="col-sm-2">
                 <img src="https://www.infrascan.net/demo/assets/img/avatar5.png" class="img-circle" width="60px">
             </div>
             <div class="col-sm-8">
                        <h1><a href="/perfil?user=${res.username}">${res.nombre} ${res.apellidos}</a></h1>
               <#if res.id != usuario.id>
                   <#if listaAmigos?size == 0>
               <div class="container">

                   <form action="/agregarAmigo" method="post">
                       <input name="id" value="${res.id}" type="hidden" placeholder="Search..">
                       <button class="btn btn-primary" type="submit">Agregar Amigo</button>
                   </form>
                   <#else>
                       <#list listaAmigos as a>
                           <#if a.id == res.id>
                    <h2><span class="label label-success">Amigos</span></h2>
                               <#break>
                           <#else>
                    <form action="/agregarAmigo" method="post">
                        <input name="id" value="${res.id}" type="hidden" placeholder="Search..">
                        <button class="btn btn-primary" type="submit">Agregar Amigo</button>
                    </form>
                               <#break>
                           </#if>
                       </#list>
                   </#if>
             </div>
         </div>
         <div class="clearfix"></div>
         <hr />
         </div>
        </div>
    </div>
          </#if>
 </div>
           </#list>
           <#else>
           <h2 class="text-center">La busqueda no produjo resultados</h2>
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