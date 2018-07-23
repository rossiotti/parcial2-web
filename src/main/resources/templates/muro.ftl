<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

    <#if !usuario.lugarNacimiento??>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#InfoFormModal').modal({backdrop: 'static', keyboard: false, }, 'show');
        });
    </script>
      <div>
        <div class="modal fade" id="InfoFormModal" tabindex="-1" role="dialog" aria-labelledby="PostForm" >
            <div class="mdl-card__supporting-text">
                <form action="/updateInfo" method="post" id="infoForm" novalidate="novalidate">
                    <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                        <h2>Queremos saber mas de usted.</h2>
                        <input class="mdl-textfield__input" type="text" name="lugarNacimiento" id="infoLugarNacimiento" placeholder="Donde nacio?"required="required">
                        <input class="mdl-textfield__input" type="text" name="lugarEstudio" id="infoLugarEstudio" placeholder="Donde estudia?" required="required">
                        <input class="mdl-textfield__input" type="text" name="lugarResidencia" id="infoLugarResidencia" placeholder="Donde vive?" required="required">
                        <input class="mdl-textfield__input" type="text" name="lugarTrabajo" id="infoLugarTrabajo" placeholder="Donde trabaja?" required="required">
                    </div>
                    <button type="submit" class="login-form-submit-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-upgraded=",MaterialButton,MaterialRipple">Update<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></button>
                </form>
            </div>
    </div>
    </div>
    </#if>
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
            <span><a href="" title="Profile"><span class="hidden-xs hidden-sm">Profile</span> <i class="fa fa-user" aria-hidden="true"></i></a>
            </span>
    </div>
    <div class="second-icon menu-icon">
        <form>
            <span><a href="/perfil?user=${usuario.username}" title="Wall"><span class="hidden-xs hidden-sm">Muro</span> <i class="fa fa-database" aria-hidden="true"></i></a>
            </span>
        </form>

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
        <form name="submitForm" method="get" action="/listaAmigos">
            <input type="hidden" name="pagina" value="1">
            <button class="text-left"type="submit">Ver Amigos</button>
        </form>
        <br>
        <h3 class="text-left" href="">Albumes</h3>

    </ul>
    </p>
</div>

<!--Wall with Post -->

<div class="content-posts active" id="posts">
    <div>
        <a href="http://themelooks.us/demo/popforms/preview/#" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-toggle="modal" data-target="#PostFormModal" data-upgraded=",MaterialButton,MaterialRipple"><i class="fa fa-user"></i> Nuevo Post<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></a>
        <div class="modal fade" id="PostFormModal" tabindex="-1" role="dialog" aria-labelledby="PostForm">
            <div class="mdl-card__supporting-text">
                <form action="/crearPost" method="post" id="loginForm" novalidate="novalidate">
                    <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                        <input class="mdl-textfield__input" type="text" name="texto" id="textoMuro" placeholder="Que piensas?">
                    </div>
                    <button type="submit" class="login-form-submit-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-upgraded=",MaterialButton,MaterialRipple">Postear<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></button>
                </form>
        </div>
    </div>

    <div id="posts-container" class="container-fluid container-posts">

        <#if usuario.muro??>

          <#list muro as post>

             <div class="card-post">
                 <div class="row">
                     <div class="col-xs-3 col-sm-2">
                         <a href="https://socialyte.codeplus.it/personal-profile.html" title="Profile">
                             <img src="img/user.jpg" alt="User name" class="img-circle img-user">
                         </a>
                     </div>
                     <div class="col-xs-9 col-sm-10 info-user">

                         <form name="submitForm" method="get" action="/perfil">
                           <strong><a href="/perfil?user=${post.usuario.username}">${post.usuario.nombre} ${post.usuario.apellidos}</a></strong>
                         </form>
                         <p><i>${post.tiempo}</i></p>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col-sm-8 col-sm-offset-2 data-post">
                         <p>${post.texto}</p>
                         <div class="reaction">
                             <#assign countLikes = 0>
                             <#assign countDislikes = 0>
                            <#if post.reaccions??>
                               <#list post.reaccions as likes>
                                <#if likes.reaccion == true>
                                <#assign countLikes = countLikes + 1>
                                <#else>
                                <#assign countDislikes = countDislikes + 1>
                                </#if>
                               </#list>
                            </#if>
                             <form action="/post/${post.id}/like" method="post">
                                 <button type="submit">${countLikes} Like</button>
                             </form>
                             <form action="/post/${post.id}/dislike" method="post">
                                 <button type="submit">${countDislikes} Dislike</button>
                             </form>
                         </div>

                         <div class="comments">
                             <#if post.comentario??>
                                <#list post.comentario as comentarios>
                                   <ul>
                                       <li><b>${comentarios.autor.nombre} ${comentarios.autor.apellidos}</b> ${comentarios.comentario}</li>
                                   </ul>
                                </#list>
                             </#if>
                             <div class="more-comments">View more comments</div>
                             <form action="/${post.id}/comentar" method="post" onsubmit="reCom()">
                                 <input type="text" class="form-control" placeholder="Add a comment" name="comentario">
                             </form>
                         </div>
                     </div>
                 </div>
             </div>

          </#list>

        </#if>

    <!--Close #posts-container-->
    <div id="loading">
        <img src="img/load.gif" alt="loader">
    </div>
</div>
<!-- Close #posts -->

        <!-- Subscribe Form Start -->
        <div class="modal fade" id="settingsFormModal" tabindex="-1" role="dialog" aria-labelledby="settingsFormModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">General Settings</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row modal-row">
                            <div class="col-sm-3">
                                <label>User name: </label>
                            </div>
                            <div class="col-sm-6">
                            ${usuario.username}
                            </div>
                            <div class="col-sm-3">
                                <a href="#" title="Edit Username"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
                            </div>
                        </div>
                        <div class="row modal-row">
                            <div class="col-sm-3">
                                <p>
                                    <label>Email: </label>
                                </p>
                            </div>
                            <div class="col-sm-6">
                                <p>
                                    example@email.com
                                </p>
                            </div>
                            <div class="col-sm-3">
                                <p>
                                    <a href="#" title="Edit Email"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
                                </p>
                            </div>
                        </div>
                        <div class="row modal-row">
                            <div class="col-sm-3">
                                <p>
                                    <label>Change password: </label>
                                </p>
                            </div>
                            <div class="col-sm-6">
                                <p>*********</p>
                            </div>
                            <div class="col-sm-3">
                                <a href="#" title="Edit Password"><i class="fa fa-pencil" aria-hidden="true"></i> <i>Edit</i></a>
                            </div>
                        </div>
                        <div class="row modal-row">
                            <div class="col-sm-3">
                                <p>
                                    <label>Public profile: </label>
                                </p>
                            </div>
                            <div class="col-sm-6">
                                <p>
                                    <input class="switch-checkbox" type="checkbox" name="PublicProfile" data-on-text="Yes" data-off-text="No" checked>
                                </p>
                            </div>
                            <div class="col-sm-3">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-social">Save changes</button>
                    </div>

                </div>
            </div>
        </div>
        <!-- Subscribe Form End -->

        <!-- Modal container for settings--->
<div id="settingsmodal" class="modal fade text-center">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>



</body></html>