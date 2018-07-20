<!DOCTYPE html>
<!-- saved from url=(0039)https://socialyte.codeplus.it/wall.html -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Wall Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/jquery-3.2.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap-switch.min.css">
    <script src="js/bootstrap-switch.min.js"></script>
    <script src="js/twemoji.min.js"></script>
    <script src="js/lazy-load.min.js"></script>
    <script src="js/socialyte.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Poppins:300,400,600,700" rel="stylesheet'>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body id="wall">

<!--Header with Nav -->
<header class="text-right">
    <form class="text-left search" method="GET">
        <input name="q" type="text" placeholder="Search..">
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
                    <a href="https://socialyte.codeplus.it/wall.html#" title="Settings">
                        <div class="col-xs-4">
                            <i class="fa fa-question" aria-hidden="true"></i>
                        </div>
                        <div class="col-xs-8 text-left">
                            <span>FAQ</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="https://socialyte.codeplus.it/wall.html#" title="Settings">
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
        <span class="hidden-xs hidden-sm">Notifications</span> <i class="fa fa-bell-o" aria-hidden="true"></i> <span class="badge">2</span>
            </span>
        <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownNotification">
            <li class="new-not">
                <a href="https://socialyte.codeplus.it/wall.html#" title="User name comment"><img src="./Wall Template_files/user2.jpg" alt="User name" class="img-circle img-user-mini"> User comments your post</a>
            </li>
            <li class="new-not">
                <a href="https://socialyte.codeplus.it/wall.html#" title="User name comment"><img src="./Wall Template_files/user3.jpg" alt="User name" class="img-circle img-user-mini"> User comments your post</a>
            </li>
            <li>
                <a href="https://socialyte.codeplus.it/wall.html#" title="User name comment"><img src="./Wall Template_files/user4.jpg" alt="User name" class="img-circle img-user-mini"> User comments your post</a>
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
        <img src="./Wall Template_files/user.jpg" alt="User name" class="img-circle img-user">
    </a>
    <h2 class="text-center hidden-xs"><a href="https://socialyte.codeplus.it/personal-profile.html" title="Profile">My User</a></h2>
    <p class="text-center user-description hidden-xs">
        <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i>
    </p>
</div>

<!--Wall with Post -->
<div class="content-posts active" id="posts">
    <div id="posts-container" class="container-fluid container-posts">

        <div class="card-post">
            <div class="row">
                <div class="col-xs-3 col-sm-2">
                    <a href="https://socialyte.codeplus.it/personal-profile.html" title="Profile">
                        <img src="./Wall Template_files/user.jpg" alt="User name" class="img-circle img-user">
                    </a>
                </div>
                <div class="col-xs-9 col-sm-10 info-user">
                    <h3><a href="https://socialyte.codeplus.it/personal-profile.html" title="Profile">My User</a></h3>
                    <p><i>2h</i></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 data-post">
                    <p>Lorem Ipsum Dolor si amet</p>
                    <div class="reaction">
                        <img draggable="false" class="emoji" alt="❤" src="./Wall Template_files/2764.png"> 156 <img draggable="false" class="emoji" alt="😃" src="./Wall Template_files/1f603.png"> 54
                    </div>
                    <div class="comments">
                        <div class="more-comments">View more comments</div>
                        <ul>
                            <li><b>User1</b> Lorem Ipsum Dolor si amet</li>
                            <li><b>User2</b> Lorem Ipsum Dolor si amet <img draggable="false" class="emoji" alt="😂" src="./Wall Template_files/1f602.png"></li>
                        </ul>
                        <form>
                            <input type="text" class="form-control" placeholder="Add a comment">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-post">
            <div class="row">
                <div class="col-xs-3 col-sm-2">
                    <a href="https://socialyte.codeplus.it/user-profile.html" title="User Profile">
                        <img src="./Wall Template_files/user2.jpg" alt="User name" class="img-circle img-user">
                    </a>
                </div>
                <div class="col-xs-9 col-sm-10 info-user">
                    <h3><a href="https://socialyte.codeplus.it/user-profile.html" title="User Profile">User Name</a></h3>
                    <p><i>2h</i></p>
                </div>
            </div>
            <div class="row">
                <div class=" col-sm-8 col-sm-offset-2 data-post">
                    <p>Lorem Ipsum Dolor si amet</p>
                    <img src="./Wall Template_files/post.jpg" alt="image post" class="img-post">
                    <div class="reaction">
                        <img draggable="false" class="emoji" alt="❤" src="./Wall Template_files/2764.png"> 1234 <img draggable="false" class="emoji" alt="😃" src="./Wall Template_files/1f603.png"> 54
                    </div>
                    <div class="comments">
                        <div class="more-comments">View more comments</div>
                        <ul>
                            <li><b>User1</b> Lorem Ipsum Dolor si amet</li>
                            <li><b>User2</b> Lorem Ipsum Dolor si amet <img draggable="false" class="emoji" alt="😂" src="./Wall Template_files/1f602.png"></li>
                        </ul>
                        <form>
                            <input type="text" class="form-control" placeholder="Add a comment">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-post">
            <div class="row">
                <div class="col-xs-3 col-sm-2">
                    <a href="https://socialyte.codeplus.it/personal-profile.html" title="User Profile">
                        <img src="./Wall Template_files/user.jpg" alt="User name" class="img-circle img-user">
                    </a>
                </div>
                <div class="col-xs-9 col-sm-10 info-user">
                    <h3><a href="https://socialyte.codeplus.it/personal-profile.html" title="User Profile">My User</a></h3>
                    <p><i>2h</i></p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 data-post">
                    <p>Lorem Ipsum Dolor si amet</p>
                    Video here
                    <video controls="" __idm_id__="250006529">
                        <source src="img/post-video.mp4" type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                    <div class="reaction">
                        <img draggable="false" class="emoji" alt="❤" src="./Wall Template_files/2764.png"> 1234 <img draggable="false" class="emoji" alt="😃" src="./Wall Template_files/1f603.png"> 54
                    </div>
                    <div class="comments">
                        <div class="more-comments">View more comments</div>
                        <ul>
                            <li><b>User1</b> Lorem Ipsum Dolor si amet</li>
                            <li><b>User2</b> Lorem Ipsum Dolor si amet <img draggable="false" class="emoji" alt="😂" src="./Wall Template_files/1f602.png"></li>
                        </ul>
                        <form>
                            <input type="text" class="form-control" placeholder="Add a comment">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Close #posts-container-->
    <div id="loading">
        <img src="img/load.gif" alt="loader">
    </div>
</div>
<!-- Close #posts -->
<!-- Modal container for settings--->
<div id="settingsmodal" class="modal fade text-center">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>



</body></html>