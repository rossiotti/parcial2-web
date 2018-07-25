<!DOCTYPE html>
<!-- saved from url=(0043)http://themelooks.us/demo/popforms/preview/ -->
<html class="no-js mdl-js" lang=""><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>SocialBuddy</title>


    <!-- ====Google Font CSS==== -->
    <link href='https://fonts.googleapis.com/css?family=Roboto:100,200,300,500,700,900' rel="stylesheet" type="text/css">
    <!-- ====Font Awesome CSS==== -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

    <!-- ====Favicons==== -->
    <link href="http://themelooks.us/demo/popforms/preview/img/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="http://themelooks.us/demo/popforms/preview/img/favicon.png" rel="icon" type="image/x-icon">

    <!-- ====Bootstrap Core CSS==== -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

    <!-- ====Material Design Lite Core CSS==== -->
    <link href="css/material.min.css" rel="stylesheet" type="text/css">

    <!-- ====Core CSS==== -->
    <link href="css/styleHome.css" rel="stylesheet" type="text/css">

    <!-- ====Main Color Scheme CSS==== -->
    <link href="css/main-color-1.css" rel="stylesheet" type="text/css" id="mainColorScheme">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>

        function validateEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        }

        function isValidDate(dateString)
        {

            // Parse the date parts to integers
            var parts = dateString.split("-");
            var year = parseInt(parts[0], 10);
            var today = new Date();
            var minAge = today.getFullYear() - year;

            // Check the ranges of month and year
            if(minAge < 13 || year > today.getFullYear() || dateString.length > 10)
                return true;
            else
                return false;
        };

        function validateForm() {
            var x = document.forms["registerForm"]["password"].value;
            var y = document.forms["registerForm"]["rePassword"].value;
            var e = document.forms["registerForm"]["email"].value;
            var u = document.forms["registerForm"]["username"].value;
            var d = document.forms["registerForm"]["fechaNacimiento"].value;

            if(x !== y){
                alert("Las Contraseñas no conciden.");
                return false;

            } if(x.length<6){
                alert("La contraseña debe tener un minimo de 6 caracteres.");
                document.getElementById("singupPassword").style.borderColor= 'red';
                return false;

            } if(isValidDate(d)){
                alert("Fecha Invalida");
                document.getElementById("singupBirthDate").style.borderColor= 'red';
                return false;

            }if(!validateEmail(e)){
                alert("Email no valido");
                document.getElementById("singupEmail").style.borderColor= 'red';
                return false;
            }if (/\s/.test(u)) {
                alert("Username no puede incluir espacios");
                document.getElementById("singupUsername").style.borderColor = 'red';
                return false;
            }
        }
    </script>

    <#if invalid??>
    <#if invalid = 2>
       <script type="text/javascript">
           alert("Este correo esta en uso");

                   $(window).on('load',function(){
                       $('#signupFormModal').modal('show');
                   });
           document.getElementById("singupEmail").style.color = 'red';
       </script>
    </#if>

    <#if invalid = 3>
       <script type="text/javascript">
           alert("Usuario/Correo no encontrado. Verifique usuario y contraseña");

           $(window).on('load',function(){
               $('#loginFormModal').modal('show');
           });
           document.getElementById("singupEmail").style.color = 'red';
       </script>
    </#if>

    <#if invalid = 1>
    <script type="text/javascript">
        alert("Este usuario ya existe")
        $(window).on('load',function(){
            $('#signupFormModal').modal('show');
        });
        document.getElementById("singupUsername").style.color = 'red';
    </script>
    </#if>
    </#if>
</head>
<body>
<!-- Top Navigation Bar Start -->
<nav id="topNav2" class="navbar">
    <div class="container">
        <!-- Logo Start -->
        <a class="navbar-brand" href="http://themelooks.us/demo/popforms/preview/index.html">
            <img src="./PopForms Material Design Modal Forms_files/logo.png" alt="">
        </a>
        <!-- Logo End -->
    </div>
</nav>
<!-- Top Navigation Bar End -->

<!-- Banner Area Start -->
<div id="banner" data-img-src="img/banner-bg.jpg" style="background-image: url(&quot;img/banner-bg.jpg&quot;);">
    <div class="vc-parent">
        <div class="vc-child">
            <div class="banner-content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-2-content text-center">
                                <h2 class="mdl-typography--display-2 mdl-typography--text-capitalize">BIENVENIDO A SOCIALBUDDY</h2>
                                <h4 class="mdl-typography--text-capitalize">LA RED SOCIAL QUE CONECTA A LAS PERSONAS.</h4>
                                <a href="#" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-toggle="modal" data-target="#loginFormModal" data-upgraded=",MaterialButton,MaterialRipple"><i class="fa fa-user"></i> Login<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></a>
                                <a href="#" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-toggle="modal" data-target="#signupFormModal" data-upgraded=",MaterialButton,MaterialRipple"><i class="fa fa-user-plus"></i> Signup<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Area End -->

<!-- Login Form Start -->
<div class="modal fade" id="loginFormModal" tabindex="-1" role="dialog" aria-labelledby="loginForm">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <div class="loginForm">
                <div class="mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <div class="modal--logo">
                            <img src="./PopForms Material Design Modal Forms_files/logo.png" alt="">
                        </div>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <form action="/login" method="post" id="loginForm" novalidate="novalidate">
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="username" id="loginUsername" placeholder="Username o Email">
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="password" name="password" id="loginPassword" placeholder="Contraseña">
                            </div>
                            <div>
                                <input class="form-check-input" type="checkbox" name="keepLog">
                                <label class="form-check-label" for="keepLog">
                                    <strong>Recuerdame</strong>
                                </label>
                            </div>


                            <button type="submit" class="login-form-submit-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-upgraded=",MaterialButton,MaterialRipple">Login<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></button>
                        </form>
                    </div>
                    <div class="mdl-card__actions mdl-card--border clearfix">
                        <a href="http://themelooks.us/demo/popforms/preview/#" class="pull-left mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" data-toggle="modal" data-target="#forgotFormModal" data-dismiss="modal" data-upgraded=",MaterialButton,MaterialRipple">
                            Forgot Password?
                            <span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></a>
                        <a href="http://themelooks.us/demo/popforms/preview/#" class="pull-right mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" data-toggle="modal" data-target="#signupFormModal" data-dismiss="modal" data-upgraded=",MaterialButton,MaterialRipple">
                            Create An Account
                            <span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Login Form End -->

<!-- Signup Form Start -->
<div class="modal fade" id="signupFormModal" tabindex="-1" role="dialog" aria-labelledby="signupFormModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" id="btnSignup" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <div class="signupForm">
                <div class="mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <div class="modal--logo">
                            <img src="./PopForms Material Design Modal Forms_files/logo.png" alt="">
                        </div>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <form action="/registrar" method="post" id="signupForm" novalidate="novalidate" name="registerForm" onsubmit="return validateForm()">
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="nombre" id="singupName" placeholder="Nombre" required="required">
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="apellidos" id="singupApellidos" placeholder="Apellidos" required="required">
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="username" id="singupUsername" placeholder="Username" required="required">
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="email" id="singupEmail" placeholder="Email" required="required">
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="password" name="password" id="singupPassword"  placeholder="Contraseña" required="required">
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="password" name="rePassword" id="singupPasswordAgain"placeholder="Rescriba la contraseña" required="required">
                            </div>

                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="date" name="fechaNacimiento" id="singupBirthDate"placeholder="Fecha de Nacimiento" required="required">
                            </div>

                            <button type="submit" class="singup-form-submit-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-upgraded=",MaterialButton,MaterialRipple">Signup<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></button>
                        </form>
                    </div>
                    <div class="mdl-card__actions mdl-card--border clearfix">
                        <p class="pull-left">Already Have An Account?</p>
                        <a href="http://themelooks.us/demo/popforms/preview/#" class="pull-right mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" data-toggle="modal" data-target="#loginFormModal" data-dismiss="modal" data-upgraded=",MaterialButton,MaterialRipple">
                            Login
                            <span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Signup Form End -->

<!-- Forgot Form Start -->
<div class="modal fade" id="forgotFormModal" tabindex="-1" role="dialog" aria-labelledby="signupFormModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <div class="forgotForm">
                <div class="mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <div class="modal--logo">
                            <img src="./PopForms Material Design Modal Forms_files/logo.png" alt="">
                        </div>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <form action="http://themelooks.us/demo/popforms/preview/#" method="post" id="forgotForm" novalidate="novalidate">
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="forgotEmail" id="forgotEmail">
                                <label class="mdl-textfield__label" for="forgotEmail">E-mail Address</label>
                            </div>

                            <button type="submit" class="forgot-form-submit-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-upgraded=",MaterialButton,MaterialRipple">Recover<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></button>
                        </form>
                    </div>
                    <div class="mdl-card__actions mdl-card--border clearfix">
                        <p class="pull-left">No Account?</p>
                        <a href="http://themelooks.us/demo/popforms/preview/#" class="pull-right mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" data-toggle="modal" data-target="#signupFormModal" data-dismiss="modal" data-upgraded=",MaterialButton,MaterialRipple">
                            Create An Account
                            <span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Forgot Form End -->

<!-- Subscribe Form Start -->
<div class="modal fade" id="subscribeFormModal" tabindex="-1" role="dialog" aria-labelledby="subscribeFormModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <div class="subscribeForm">
                <div class="mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <div class="modal--logo">
                            <img src="./PopForms Material Design Modal Forms_files/logo.png" alt="">
                        </div>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <form action="http://themelooks.us/demo/popforms/preview/#" method="post" id="subscribeForm" novalidate="novalidate">
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="subscribeEmail" id="subscribeEmail">
                                <label class="mdl-textfield__label" for="subscribeEmail">E-mail Address</label>
                            </div>

                            <button type="submit" class="subscribe-form-submit-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-upgraded=",MaterialButton,MaterialRipple">Subscribe<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Subscribe Form End -->

<!-- Contact Form Start -->
<div class="modal fade" id="contactFormModal" tabindex="-1" role="dialog" aria-labelledby="contactFormModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            <div class="contactForm">
                <div class="mdl-card mdl-shadow--2dp">
                    <div class="mdl-card__title mdl-card--expand">
                        <div class="modal--logo">
                            <img src="./PopForms Material Design Modal Forms_files/logo.png" alt="">
                        </div>
                    </div>
                    <div class="mdl-card__supporting-text">
                        <form action="http://themelooks.us/demo/popforms/preview/sendmail.php" method="post" id="contactForm" novalidate="novalidate">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                        <input class="mdl-textfield__input" type="text" name="contactName" id="contactName">
                                        <label class="mdl-textfield__label" for="contactName">Full Name</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                        <input class="mdl-textfield__input" type="text" name="contactEmail" id="contactEmail">
                                        <label class="mdl-textfield__label" for="contactEmail">E-mail Address</label>
                                    </div>
                                </div>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <input class="mdl-textfield__input" type="text" name="contactSubject" id="contactSubject">
                                <label class="mdl-textfield__label" for="contactSubject">Subject</label>
                            </div>
                            <div class="mdl-textfield mdl-js-textfield is-upgraded" data-upgraded=",MaterialTextfield">
                                <textarea class="mdl-textfield__input" name="contactMessage" id="contactMessage"></textarea>
                                <label class="mdl-textfield__label" for="contactMessage">Message</label>
                            </div>

                            <button type="submit" class="contact-form-submit-btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" data-upgraded=",MaterialButton,MaterialRipple">Send<span class="mdl-button__ripple-container"><span class="mdl-ripple"></span></span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact Form End -->

<!-- Color Switcher Start -->

<!-- Color Switcher End -->

<!-- ====jQuery Core JavaScript==== -->
<script src="js/jquery-2.2.2.min.js"></script>

<!-- ====Bootstrap Core JavaScript==== -->
<script src="js/bootstrap.min.js"></script>

<!-- ====Material Design Lite Core JavaScript==== -->
<script src="js/material.min.js"></script>

<!-- ====jQuery Validation JavaScript==== -->
<script src="js/jquery.validate.min.js"></script>

<!-- ====Core JavaScript==== -->
<script src="js/main.js"></script>

<!-- ====Color Switcher JavaScript==== -->
<script src="js/color-switcher.js"></script>

</body></html>