<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Perfil de ${usuario.nombre} ${usuario.apellidos}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

    <link href="css/jquery.atwho.css" rel="stylesheet">
    <script src="js/jquery.caret.js"></script>
    <script src="js/jquery.atwho.js"></script>




    <#if view??>
    <#if view == 1>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#CommentsAlbumModal').modal('show');
        });
    </script>
    </#if>
    </#if>


    <#if !usuario.lugarNacimiento??>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#InfoFormModal').modal({backdrop: 'static', keyboard: false, }, 'show');
        });
    </script>
   <!-- Modal -->
<div class="modal fade" id="InfoFormModal" tabindex="-1" role="dialog" aria-labelledby="PostForm" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title" id="InfoFormModal">Queremos saber mas de usted</h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form action="/updateInfo" method="post" id="infoForm" novalidate="novalidate">

                <input type="text" class="form-control" name="lugarNacimiento" id="infoLugarNacimiento" placeholder="Donde nacio?"required="required">
                <input type="text" class="form-control" name="lugarEstudio" id="infoLugarEstudio" placeholder="Donde estudia?" required="required">
                <input type="text" class="form-control" name="lugarResidencia" id="infoLugarResidencia" placeholder="Donde vive?" required="required">
                <input type="text" class="form-control" name="lugarTrabajo" id="infoLugarTrabajo" placeholder="Donde trabaja?" required="required">
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" data-upgraded=",MaterialButton,MaterialRipple">Save changes</button>
                </form>
            </div>
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
            <br>
            <!-- /.card-header -->
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
</div>

<!-- /.card-body -->


<!--Wall with Post -->

<div class="content-posts active" id="posts">
    <div>
        <button type="button" class="btn btn-primary btn-circle btn-xl" data-toggle="modal" data-target="#PostFormModal" data-upgraded=",MaterialButton,MaterialRipple"><i class="fa fa-plus"></i></button>
        <div class="modal fade" id="PostFormModal" tabindex="-1" role="dialog" aria-labelledby="PostForm">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="modal-title" id="exampleModalLongTitle">Nuevo Post</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="/crearPost/muro" method="post" id="crearPostForm" novalidate="novalidate" enctype="multipart/form-data">
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield" >
                                <textarea class="form-control" name="texto" id="textoMuro" placeholder="Que piensas?" rows="3" ></textarea>
                                <input type="file" name="imagen" accept=".png,.jpg,.gif" multiple>
                            </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" data-upgraded=",MaterialButton,MaterialRipple">Post</button>
                        </form>
                    </div>
                </div>
            </div>
    </div>

        <div>
            <button type="button" class="btn btn-primary btn-circle btn-xl" data-toggle="modal" data-target="#AlbumFormModal" data-upgraded=",MaterialButton,MaterialRipple"><i class="fa fa-images"></i></button>
            <div class="modal fade" id="AlbumFormModal" tabindex="-1" role="dialog" aria-labelledby="AlbumForm">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="exampleModalLongTitle">Nuevo Album</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/crearAlbum/muro" method="post" id="crearAlbumForm" novalidate="novalidate" enctype="multipart/form-data">
                                <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield" >
                                    <textarea class="form-control" name="descripcion" id="textoMuro" placeholder="Descripcion del Album..." rows="3" ></textarea>
                                    <input type="file" name="imagen" accept=".png,.jpg,.gif" multiple>
                                </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" data-upgraded=",MaterialButton,MaterialRipple">Post</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

    <div id="posts-container" class="container-fluid container-posts">
<#if usuario.muro?size == 0>
<h2>Parece que no tienes amigos, aqui hay algunas personas que tal vez conozcas:</h2>
<span><a href="/sugerirAmigos?pagina=1" title="Sugerencias"><span class="hidden-xs hidden-sm">Ver Personas</span> <i class="fa fa-user-plus" aria-hidden="true"></i></a>
            </span>
</#if>

   <#if albumes?size &gt; 0>
   <#list albumes as album>
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
                                  <a href="/home?single=${post.id}&view=1"><img src="subidas/${post.imagenPath}" ></a>
                              </div>
                              <#assign activo = activo + 1>
                              <#else>
                              <div class="item">
                                  <a href="/home?single=${post.id}&view=1"><img src="subidas/${post.imagenPath}" ></a>
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
   </#list>
   </#if>

        <#if usuario.muro?size &gt; 0>

          <#list muro as post>

             <div class="card-post">
                 <div class="row">
                     <div class="col-xs-3 col-sm-2">
                         <a href="/perfil?user=${usuario.username}" title="Profile">
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
                 <div class="row" >
                     <div class="col-sm-8 col-sm-offset-2 data-post">
                         <p id="post${post_index}">${post.texto}</p>
                         <#if post.imagenPath !="">
                            <img src="subidas/${post.imagenPath}" class="img-rounded">
                         </#if>
                         <div class="reaction">


                            <#if reacciones??>
                            <#assign countLikes = 0>
                            <#assign countDislikes = 0>
                               <#list reacciones as likes>
                                  <#if likes.post??>
                                     <#if likes.post.id == post.id>
                                        <#if likes.reaccion == true>
                                           <#assign countLikes = countLikes + 1>
                                        <#else>
                                           <#assign countDislikes = countDislikes + 1>
                                      </#if>

                                      </#if>
                                </#if>
                               </#list>
                            </#if>

                             <form class="btn-group" action="/post/${post.id}/like?index=${post_index}" method="post">
                                 <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-thumbs-up"></i> ${countLikes}</button>
                             </form>
                             <form class="btn-group" action="/post/${post.id}/dislike?index=${post_index}" method="post">
                                 <button class="btn btn-danger btn-sm" type="submit"><i class="fa fa-thumbs-down"></i> ${countDislikes}</button>
                             </form>
                         </div>

                         <div class="comments">

                             <#if comentarios??>
                                <#list comentarios as comments>
                                <#if comments.post.id == post.id>
                                 <ul>
                                     <li><b>${comments.autor.nombre} ${comments.autor.apellidos}</b> ${comments.comentario} <div class="reaction">


                                   <#if reacciones??>
                                     <#assign countLikes = 0>
                                     <#assign countDislikes = 0>
                                     <#list reacciones as likes>
                                     <#if likes.comentario??>
                                       <#if likes.comentario.id == comments.id>
                                     <#if likes.reaccion == true>
                                     <#assign countLikes = countLikes + 1>
                                     <#else>
                                     <#assign countDislikes = countDislikes + 1>
                                     </#if>
                                     </#if>
                                     </#if>

                                       </#list>
                                   </#if>

                                         <form class="btn-group" action="/comentario/${comments.id}/like?index=${post_index}" method="post">
                                             <button style="border:none; background-color: transparent;" class="fa fa-thumbs-up" type="submit"> ${countLikes}</button>
                                         </form>
                                         <form class="btn-group" action="/comentario/${comments.id}/dislike?index=${post_index}" method="post">
                                             <button style="border:none; background-color: transparent;" class="fa fa-thumbs-down" type="submit"> ${countDislikes}</button>
                                         </form>
                                     </div></li>
                                 </ul>
                                </#if>
                                </#list>
                             </#if>
                             <form action="/${post.id}/comentar?index=${post_index}" method="post">
                                 <textarea type="text" class="form-control" placeholder="Add a comment" name="comentario" id="entrada"></textarea>
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
                                <a href="#" title="Edit Username"><i class="fa fa-edit" aria-hidden="true"></i> <i>Edit</i></a>
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
                                    <a href="#" title="Edit Email"><i class="fa fa-edit" aria-hidden="true"></i> <i>Edit</i></a>
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
                                <a href="#" title="Edit Password"><i class="fa fa-edit" aria-hidden="true"></i> <i>Edit</i></a>
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
           <#if singleImage??>
           <#assign view =0>
            <div class="modal fade" id="CommentsAlbumModal" tabindex="-1" role="dialog" aria-labelledby="CommentsAlbumModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Imagen</h4>
                        </div>
                        <div class="modal-body">
                            <div class="card-post">
                                <div class="row">
                                    <div class="col-xs-3 col-sm-2">
                                        <a href="/perfil?user=${usuario.username}" title="Profile">
                                            <img src="img/user.jpg" alt="User name" class="img-circle img-user">
                                        </a>
                                    </div>
                                    <div class="col-xs-9 col-sm-10 info-user">

                                        <form name="submitForm" method="get" action="/perfil">
                                            <strong><a href="/perfil?user=${singleImage.usuario.username}">${singleImage.usuario.nombre} ${singleImage.usuario.apellidos}</a></strong>
                                        </form>
                                        <p><i>${singleImage.tiempo}</i></p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-8 col-sm-offset-2 data-post">
                            <img src="subidas/${singleImage.imagenPath}" class="img-rounded">
                                        <div class="reaction">


                            <#if reacciones??>
                            <#assign countLikes = 0>
                            <#assign countDislikes = 0>
                            <#list reacciones as likes>
                            <#if likes.post??>

                            <#if likes.post.id == singleImage.id>


                            <#if likes.reaccion == true>
                            <#assign countLikes = countLikes + 1>
                            <#else>
                            <#assign countDislikes = countDislikes + 1>
                            </#if>

                            </#if>
                            </#if>
                            </#list>
                            </#if>

                                            <form class="btn-group" action="/post/${singleImage.id}/like?view=1&single=${singleImage.id}" method="post">
                                                <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-thumbs-up"></i> ${countLikes}</button>
                                            </form>
                                            <form class="btn-group" action="/post/${singleImage.id}/dislike?view=1&single=${singleImage.id}" method="post">
                                                <button class="btn btn-danger btn-sm" type="submit"><i class="fa fa-thumbs-down"></i> ${countDislikes}</button>
                                            </form>
                                        </div>

                                        <div class="comments">

                             <#if comentarios??>
                             <#list comentarios as comments>
                             <#if comments.post.id == singleImage.id>
                                 <ul>
                                     <li><b>${comments.autor.nombre} ${comments.autor.apellidos}</b> ${comments.comentario} <div class="reaction">


                                   <#if reacciones??>
                                   <#assign countLikes = 0>
                                   <#assign countDislikes = 0>
                                         <#list reacciones as likes>
                                   <#if likes.comentario??>
                                   <#if likes.comentario.id == comments.id>
                                   <#if likes.reaccion == true>
                                   <#assign countLikes = countLikes + 1>
                                   <#else>
                                   <#assign countDislikes = countDislikes + 1>
                                   </#if>
                                   </#if>
                                   </#if>

                                   </#list>
                                   </#if>

                                         <form class="btn-group" action="/comentario/${comments.id}/like?view=1&single=${singleImage.id}" method="post">
                                             <button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-thumbs-up"></i> ${countLikes}</button>
                                         </form>
                                         <form class="btn-group" action="/comentario/${comments.id}/dislike?view=1&single=${singleImage.id}" method="post">
                                             <button class="btn btn-danger btn-sm" type="submit"><i class="fa fa-thumbs-down"></i> ${countDislikes}</button>
                                         </form>
                                     </div></li>
                                 </ul>
                             </#if>
                             </#list>
                             </#if>
                                            <form action="/${singleImage.id}/comentar?view=1&single=${singleImage.id}" method="post">
                                                <input type="text" class="form-control" placeholder="Add a comment" name="comentario" id="commentArea">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
           </#if>

                    </div>
                </div>
            </div>

        <!-- Modal container for settings--->
<div id="settingsmodal" class="modal fade text-center">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>


            <script>
                $("#entrada").keypress(function (e) {
                    if(e.which == 13 && !e.shiftKey) {
                        $(this).closest("form").submit();
                        e.preventDefault();
                        return false;
                    }
                });
            </script>

</body>
</html>