<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
              crossorigin="anonymous">
        <nav style="background-color: #005850" class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="/registration">Registration</a>
                        <a class="nav-link" href="/login">Login</a>
                        <a class="nav-link" href="/users">Users</a>
                    </div>
                </div>
            </div>
        </nav>
    </head>
    <body>
        <form action="/registration" method="post">
            <div style="width:30%;" class="mt-5 container content-center col-md-n ">
                <%
                    if(request.getAttribute("error")!=null){
                        if(!(boolean)request.getAttribute("error")){
                %>
                <div class="alert alert-danger" role="alert">
                    Пользователь с таким почтовым адресом уже зарегистрирован!
                </div>
                <%} else {
                %>
                <div class="alert alert-danger" role="alert">
                    Пароли не совпадают!
                </div>
                <%
                  }
                }
                %>
                <span>Электронная почта:</span>
                <input required name="email" type="text" class="form-control mt-1 mb-3" placeholder="введите почту"
                        aria-describedby="basic-addon1">
                <span>Ф.И.О. :</span>
                <input required name="fullname" type="text" class="form-control mt-1" placeholder="введите Ф.И.О."
                        aria-describedby="basic-addon1">
                <div class="mt-3 mb-3">
                    <span>Пол:</span>
                    <div class="form-check">

                        <input required class="form-check-input" type="radio" name="gender"
                               value="мужской" id="flexRadioDefault1">
                        <label required class="form-check-label" for="flexRadioDefault1">
                            Мужской
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender"
                               value="женский" id="flexRadioDefault2" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                            Женский
                        </label>
                    </div>
                </div>
                <span>Возраст:</span>
                <input required name="age" type="number" class="form-control mt-1 mb-3" placeholder="введите ваш возраст"
                        aria-describedby="basic-addon1">
                <span>Пароль:</span>
                <input required name="password" type="password" class="form-control mt-1 mb-3" inputmode="numeric" minlength="4"
                       maxlength="8" size="8" placeholder="введите пароль"
                        aria-describedby="basic-addon1">
                <span>Повторите пароль:</span>
                <input required name="repeat_password" type="password" class="form-control mt-1"
                       placeholder="повторите пароль"
                        aria-describedby="basic-addon1">
                <button style="width: 100%; background-color: #005850" class="btn btn-secondary mt-4">Зарегистрироваться</button>
            </div>
        </form>
    </body>
</html>
